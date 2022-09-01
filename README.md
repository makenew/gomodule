# Go Module Project Skeleton

[![GitHub Actions](https://github.com/makenew/gomodule/workflows/main/badge.svg)](https://github.com/makenew/gomodule/actions)

Project skeleton for a Go module.

## Description

Bootstrap a new Go module in five minutes or less.

### Features

- Multi-arch and multi-platform builds published to GitHub with [GoReleaser].
- Linting with [golangci-lint].
- Continuous testing and deployment with [GitHub Actions].
- [Keep a CHANGELOG].
- Consistent coding with [EditorConfig].

[EditorConfig]: https://editorconfig.org/
[GitHub Actions]: https://github.com/features/actions
[GitHub Container Registry]: https://github.com/features/packages
[golangci-lint]: https://golangci-lint.run/
[GoReleaser]: https://goreleaser.com/
[Keep a CHANGELOG]: https://keepachangelog.com/

### Bootstrapping a new project

1. Create an empty (**non-initialized**) repository on GitHub.
2. Clone the master branch of this repository with
   ```
   $ git clone --single-branch git@github.com:makenew/gomodule.git <new-go-module>
   $ cd <new-go-module>
   ```
   Optionally, reset to the latest version with
   ```
   $ git reset --hard <version-tag>
   ```
3. Run
   ```
   $ ./makenew.sh
   ```
   This will replace the boilerplate, delete itself,
   remove the git remote, remove upstream tags,
   and stage changes for commit.
4. Create the required GitHub repository secrets.
5. Review, commit, and push the changes to GitHub with
   ```
   $ git diff --cached
   $ git commit -m "Replace makenew boilerplate"
    git remote add origin git@github.com:<user>/<new-go-module>.git
   $ git push -u origin master
   ```
6. Ensure the GitHub action passes,
   then release the initial version with
   ```
   $ git tag --sign v0.0.1
   $ git push --tags
   ```

### Updating from this skeleton

If you want to pull in future updates from this skeleton,
you can fetch and merge in changes from this repository.

Add this as a new remote with

```
$ git remote add upstream git@github.com:makenew/gomodule.git
```

You can then fetch and merge changes with

```
$ git fetch --no-tags upstream
$ git merge upstream/master
```

#### Changelog for this skeleton

Note that `CHANGELOG.md` is just a template for this skeleton.
The actual changes for this project are documented in the commit history
and summarized under [Releases].

[Releases]: https://github.com/makenew/gomodule/releases

## Development and Testing

### Quickstart

```
$ git clone https://github.com/makenew/gomodule.git
$ cd gomodule
$ make
$ make test
```

### Source code

The [source code] is hosted on GitHub.
Clone the project with

```
$ git clone git@github.com:makenew/gomodule.git
```

[source code]: https://github.com/makenew/gomodule

### Requirements

A [Go] version compatible with the one specified in `go.mod`,
[GoReleaser], and [golangci-lint].

[Go]: https://golang.org/
[golangci-lint]: https://golangci-lint.run/
[GoReleaser]: https://goreleaser.com/

## GitHub Actions

_GitHub Actions should already be configured: this section is for reference only._

The following repository secrets must be set on [GitHub Actions]:

- `GH_USER`: The GitHub user's username to pull and push containers.
- `GH_TOKEN`: A personal access token that can trigger workflows.
- `GPG_PRIVATE_KEY`: The GitHub user's [GPG private key].
- `GPG_PASSPHRASE`: The GitHub user's GPG passphrase.

These must be set manually.

### Secrets for Optional GitHub Actions

The version and format GitHub actions
require a user with write access to the repository,
including access to trigger workflows.
Set these additional secrets to enable the action:

- `GH_USER`: The GitHub user's username.
- `GH_TOKEN`: A personal access token for the user.
- `GIT_USER_NAME`: The GitHub user's real name.
- `GIT_USER_EMAIL`: The GitHub user's email.

[GitHub Actions]: https://github.com/features/actions
[GPG private key]: https://github.com/marketplace/actions/import-gpg#prerequisites

## Contributing

Please submit and comment on bug reports and feature requests.

To submit a patch:

1. Fork it (https://github.com/makenew/gomodule/fork).
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Make changes.
4. Commit your changes (`git commit -am 'Add some feature'`).
5. Push to the branch (`git push origin my-new-feature`).
6. Create a new Pull Request.

## License

This Go module plugin is licensed under the MIT license.

## Warranty

This software is provided by the copyright holders and contributors "as is" and
any express or implied warranties, including, but not limited to, the implied
warranties of merchantability and fitness for a particular purpose are
disclaimed. In no event shall the copyright holder or contributors be liable for
any direct, indirect, incidental, special, exemplary, or consequential damages
(including, but not limited to, procurement of substitute goods or services;
loss of use, data, or profits; or business interruption) however caused and on
any theory of liability, whether in contract, strict liability, or tort
(including negligence or otherwise) arising in any way out of the use of this
software, even if advised of the possibility of such damage.
