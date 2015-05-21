FROM alpine:3.1
RUN apk --update add curl zip

# TODO: verify pgp, currently docker HUB gets error
# "can't connect to the agent: IPC connect call failed"
#RUN apk --update add gnupg
#RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 91A6E7F85D05C65630BEF18951852D87348FFC4C
#gpg --verify /tmp/vault.sig /tmp/vault.sha256

ENV VAULT_VERSION 0.1.2
RUN set -x\
 && curl -Ls https://dl.bintray.com/mitchellh/vault/vault_${VAULT_VERSION}_linux_amd64.zip > /tmp/vault.zip\
 && [[ "12c28cf7d6b6052c24817072fb95d4cfa2a391b507c705e960faf11afb5ee6ad" == "$(sha256sum /tmp/vault.zip | awk '{print $1}')" ]]\
 && unzip /tmp/vault -d /usr/local/bin/\
 && rm /tmp/vault*

ENTRYPOINT ["/usr/local/bin/vault"]
