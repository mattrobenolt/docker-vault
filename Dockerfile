FROM alpine:3.1

ENV VAULT_VERSION 0.1.2
COPY hashicorp.pgp /opt/hashicorp/
RUN set -x\
 && apk --update add --virtual bdeps curl zip gnupg\
 && curl -Ls https://dl.bintray.com/mitchellh/vault/vault_${VAULT_VERSION}_linux_amd64.zip > /tmp/vault.zip\
 && curl -Ls https://dl.bintray.com/mitchellh/vault/vault_${VAULT_VERSION}_SHA256SUMS?direct > /tmp/vault.sha256\
 && curl -Ls https://dl.bintray.com/mitchellh/vault/vault_${VAULT_VERSION}_SHA256SUMS.sig?direct > /tmp/vault.sig\
 && gpg --import /opt/hashicorp/hashicorp.pgp\
 && gpg --verify /tmp/vault.sig /tmp/vault.sha256\
 && [[ "$(grep linux_amd64.zip /tmp/vault.sha256 | awk '{print $1}')" == "$(sha256sum /tmp/vault.zip | awk '{print $1}')" ]]\
 && unzip /tmp/vault -d /usr/local/bin/\
 && rm /tmp/vault*

ENTRYPOINT ["/usr/local/bin/vault"]
