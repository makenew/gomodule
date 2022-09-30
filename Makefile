all: clean dist

clean:
	@rm -rf dist

dist:
	@goreleaser build --single-target --snapshot

test:
	@go test ./...

lint:
	@golangci-lint run

format:
	@golangci-lint run --fix

.PHONY: clean dist test lint format
