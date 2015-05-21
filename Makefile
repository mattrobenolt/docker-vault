.PHONY: build push
VERSION := 0.1.2
build:
	docker build -t docker.novilabs.com:5443/vault:$(VERSION) .
push: build
	docker push docker.novilabs.com:5443/vault:$(VERSION)
