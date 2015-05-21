FROM alpine:3.1

RUN apk --update add gnupg
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 91A6E7F85D05C65630BEF18951852D87348FFC4C

ENV VAULT_VERSION 0.1.2
RUN set -x\
 && apk --update add --virtual bdeps curl zip\
 && curl -Ls https://dl.bintray.com/mitchellh/vault/vault_${VAULT_VERSION}_linux_amd64.zip > /tmp/vault.zip\
 && curl -Ls https://dl.bintray.com/mitchellh/vault/vault_${VAULT_VERSION}_SHA256SUMS?direct > /tmp/vault.sha256\
 && curl -Ls https://dl.bintray.com/mitchellh/vault/vault_${VAULT_VERSION}_SHA256SUMS.sig?direct > /tmp/vault.sig\
 && gpg --verify /tmp/vault.sig /tmp/vault.sha256\
 && [[ "$(grep linux_amd64.zip /tmp/vault.sha256 | awk '{print $1}')" == "$(sha256sum /tmp/vault.zip | awk '{print $1}')" ]]\
 && unzip /tmp/vault -d /usr/local/bin/\
 && rm /tmp/vault*\
 && apk del bdeps

ENTRYPOINT ["/usr/local/bin/vault"]
