#!/usr/bin/env sh

set -e
set -u

find_replace () {
  git grep --cached -Il '' | xargs sed -i.sedbak -e "$1"
  find . -name "*.sedbak" -exec rm {} \;
}

sed_insert () {
  sed -i.sedbak -e "$2\\"$'\n'"$3"$'\n' $1
  rm $1.sedbak
}

sed_delete () {
  sed -i.sedbak -e "$2" $1
  rm $1.sedbak
}

check_env () {
  test -d .git || (echo 'This is not a Git repository. Exiting.' && exit 1)
  for cmd in ${1}; do
    command -v ${cmd} >/dev/null 2>&1 || \
      (echo "Could not find '$cmd' which is required to continue." && exit 2)
  done
  echo
  echo 'Ready to bootstrap your new project!'
  echo
}

stage_env () {
  echo
  echo 'Removing origin and tags.'
  git tag | xargs git tag -d
  git branch --unset-upstream
  git remote rm origin
  echo
  git rm -f makenew.sh
  echo
  echo 'Staging changes.'
  git add --all
  echo
  echo 'Done!'
  echo
}

makenew () {
  echo 'Answer all prompts.'
  echo 'There are no defaults.'
  echo 'Example values are shown in parentheses.'
  read -p '> Module title (My Module): ' mk_title
  read -p '> GitHub user or organization name (my-user): ' mk_user
  read -p '> Repo name (my-module): ' mk_repo
  read -p '> Module name (mymodule): ' mk_module
  read -p '> Short module description (Foos and bars.): ' mk_description
  read -p '> Author name (Linus Torvalds): ' mk_author

  sed_delete README.md '9,84d'
  sed_insert README.md '9i' 'TODO'

  git mv gomodule.go "${mk_module}.go"
  git mv cmd/gomodule "cmd/${mk_module}"

  find_replace "s/Go Module Project Skeleton/${mk_title}/g"
  find_replace "s/Project skeleton for a Go module\./${mk_description}/g"
  find_replace "s/Evan Sosenko/${mk_author}/g"
  find_replace "s|makenew/gomodule|${mk_user}/${mk_repo}|g"
  find_replace "s|cd gomodule|cd ${mk_repo}|g"
  find_replace "s|gomodule|${mk_module}|g"

  echo
  echo 'Replacing boilerplate.'
}

check_env 'git read sed xargs'
makenew
stage_env
exit
