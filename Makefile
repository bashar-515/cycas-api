.PHONY: gen gen-go gen-go-server gen-go-models setup-go

gen: gen-go

gen-go: gen-go-models gen-go-server gen-go-spec

gen-go-models: setup-go
	go tool oapi-codegen -config gen/go/config/go-models-cfg.yaml spec/openapi.yaml && \
		go mod tidy

gen-go-server: setup-go
	go tool oapi-codegen -config gen/go/config/go-server-cfg.yaml spec/openapi.yaml && \
		go mod tidy

gen-go-spec: setup-go
	go tool oapi-codegen -config gen/go/config/go-spec-cfg.yaml spec/openapi.yaml && \
		go mod tidy

setup-go:
	go mod tidy
