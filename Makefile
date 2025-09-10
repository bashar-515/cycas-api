.PHONY: gen gen-go gen-go-server gen-go-models setup-go

gen: gen-go

gen-go: gen-go-server gen-go-models

gen-go-server: setup-go
	go tool oapi-codegen -config config/go-server-cfg.yaml spec/openapi.yaml && \
		go mod tidy

gen-go-models: setup-go
	go tool oapi-codegen -config config/go-models-cfg.yaml spec/openapi.yaml && \
		go mod tidy

setup-go:
	go mod tidy
