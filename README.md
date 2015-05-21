# Tags
- [`0.1.2` (*Dockerfile)](https://github.com/novilabs/docker-vault/blob/master/Dockerfile)
- [`0.1.2-consul`, `consul`, (*consul/Dockerfile)](https://github.com/novilabs/docker-vault/blob/master/consul/Makefile)

# What is Hashicorps Vault?
*Vault* secures, stores, and tightly controls access to tokens, passwords, 
certificates, API keys, and other secrets in modern computing. Vault handles 
leasing, key revocation, key rolling, and auditing. Vault presents a unified 
API to access multiple backends: HSMs, AWS IAM, SQL databases, raw key/value, and more.

# Usage
```
docker run --rm -ti --cap-add IPC_LOCK novilabs/vault -dev
```

# With consul backend
## start consul
OSX
```
$(docker run --rm progrium/consul cmd:run $(boot2docker ip) -it)
```

## run vault
OSX
```
docker run --rm -ti -p 8200:8200 -e "CONSUL_HOST_ADDR=$(boot2docker ip) novilabs/vault:consul"
```
