.PHONY: build push run
VERSION := 0.1.2

build:
	docker build -t novilabs/vault:consul .

tag-version: build
	docker tag novilabs/vault novilabs/vault:$(VERSION)-consul

push: tag-version
	docker push novilabs/vault:consul
	docker push novilabs/vault:$(VERSION)-consul

run: build
	docker run --rm -ti --name vault\
	 --cap-add IPC_LOCK\
         -p 8200:8200\
	 -e "CONSUL_HOST_ADDR=192.168.59.103:8500"\
	 novilabs/vault:$(VERSION)-consul
