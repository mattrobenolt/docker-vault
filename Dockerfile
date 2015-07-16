FROM alpine:3.1

# TODO: verify pgp, currently docker HUB gets error
# "can't connect to the agent: IPC connect call failed"
#RUN apk --update add gnupg
#RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 91A6E7F85D05C65630BEF18951852D87348FFC4C
#gpg --verify /tmp/vault.sig /tmp/vault.sha256

ENV VAULT_VERSION 0.2.0
ENV VAULT_SHA256 b4b64fcea765ebfc7cdbae9cdd2c32bff130ca51f15b9cf47194f112fd5515cf
RUN set -x\
 && apk --update add curl zip\
 && curl -Ls https://dl.bintray.com/mitchellh/vault/vault_${VAULT_VERSION}_linux_amd64.zip > /tmp/vault.zip\
 && [[ $VAULT_SHA256 == "$(sha256sum /tmp/vault.zip | awk '{print $1}')" ]]\
 && unzip /tmp/vault -d /usr/local/bin/\
 && rm /tmp/vault*\
 && apk del curl zip

ENTRYPOINT ["/usr/local/bin/vault"]
