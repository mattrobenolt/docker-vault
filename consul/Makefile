.PHONY: build push run
VERSION := 0.1.2
build:
	docker build -t docker.novilabs.com:5443/vault:$(VERSION)-consul .
push: build
	docker push docker.novilabs.com:5443/vault:$(VERSION)-consul
run: build
	docker run --rm -ti --name vault\
	 --cap-add IPC_LOCK\
         -p 8200:8200\
	 -e "CONSUL_HOST_ADDR=192.168.59.103:8500"\
	 docker.novilabs.com:5443/vault:$(VERSION)-consul
