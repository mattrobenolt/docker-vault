.PHONY: build push
VERSION := 0.1.2

build:
	docker build -t novilabs/vault .

tag-version: build
	docker tag novilabs/vault novilabs/vault:$(VERSION)

push: tag-version
	docker push novilabs/vault
	docker push novilabs/vault:$(VERSION)
