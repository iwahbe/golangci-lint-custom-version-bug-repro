_ := $(shell mkdir -p bin)

GOLANGCILINT_VERSION := v2.5.0
GOLANGCILINT := bin/custom-golangci-lint

bin/golangci-lint:
	curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/refs/tags/$(GOLANGCILINT_VERSION)/install.sh | \
		sh -s -- -b $(dir $@) $(GOLANGCILINT_VERSION)

.PHONY: bin/custom-golangci-lint # This isn't phony in our real repo
bin/custom-golangci-lint: bin/golangci-lint
	$< custom
	# $< cache clean # To ensure that changes are observed, we need to remove the cache
