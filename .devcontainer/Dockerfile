ARG VARIANT="1.23"

FROM mcr.microsoft.com/vscode/devcontainers/go:${VARIANT}

ARG GOLANGCI_LINT_VERSION="1.61.0"

RUN echo 'deb [trusted=yes] https://repo.goreleaser.com/apt/ /' \
  | tee /etc/apt/sources.list.d/goreleaser.list
RUN apt-get update \
 && export DEBIAN_FRONTEND=noninteractive \
 && apt-get -y install --no-install-recommends goreleaser

RUN curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh \
  | sh -s -- -b $(go env GOPATH)/bin v$GOLANGCI_LINT_VERSION

USER vscode
WORKDIR /home/vscode

RUN mkdir -p .config/git \
 && echo ".vscode/*" >> .config/git/ignore \
 && echo "*.code-workspace" >> .config/git/ignore \
 && echo ".history/" >> .config/git/ignore
