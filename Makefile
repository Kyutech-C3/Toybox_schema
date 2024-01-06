PROTO_FILES = $(shell find ./proto/schema -name "*.proto"  -type f)

.PHONY: build
build:
	rm -rf openapi
	mkdir openapi
	protoc -I . --openapiv2_out openapi --openapiv2_opt logtostderr=true \
	--openapiv2_opt disable_default_errors=true \
	--openapiv2_opt allow_merge=true \
	--openapiv2_opt output_format=yaml \
	--openapiv2_opt merge_file_name="api_definition.yml" $(PROTO_FILES) \
	--openapiv2_opt allow_delete_body=true \
	--openapiv2_opt json_names_for_fields=false

new:
	npx scaffdog generate service --output ./proto/schema

fmt:
	find ./proto/ -name "*.proto" | xargs clang-format -i

setup-mac:
	brew install protobuf
	go install github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
	go install github.com/golang/protobuf/protoc-gen-go
	go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2

setup-linux:
	apt install -y protobuf-compiler
	go install github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
	go install github.com/golang/protobuf/protoc-gen-go
	go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2
