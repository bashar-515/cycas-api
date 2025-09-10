.PHONY: gen setup

gen: setup
	go tool oapi-codegen -config oapi-codegen.yaml openapi.yaml

setup:
	go mod tidy
