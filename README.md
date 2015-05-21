# Tags
- [`0.1.2` (*Dockerfile)](https://github.com/novilabs/docker-vault/blob/master/Dockerfile)
- [`0.1.2-consul`, `consul`, (*consul/Dockerfile)](https://github.com/novilabs/docker-vault/blob/master/consul/Dockerfile)

# What is Hashicorp's Vault?
[Vault](https://vaultproject.io/) secures, stores, and tightly controls access to tokens, passwords, 
certificates, API keys, and other secrets in modern computing. Vault handles 
leasing, key revocation, key rolling, and auditing. Vault presents a unified 
API to access multiple backends: HSMs, AWS IAM, SQL databases, raw key/value, and more.

# Usage
## dev server

```
docker run --rm -ti --cap-add IPC_LOCK novilabs/vault -dev
```

## With consul backend
### start consul
OSX

```
$(docker run --rm -e EXPECT=1 progrium/consul cmd:run $(boot2docker ip) -it)
```

### run vault
OSX

```
docker run --rm -ti --cap-add IPC_LOCK\
 -p 8200:8200\
 -e "CONSUL_HOST_ADDR=$(boot2docker ip):8500"\
 novilabs/vault:consul
```
