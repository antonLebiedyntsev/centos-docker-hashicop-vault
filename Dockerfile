FROM centos:centos7
ENV VAULT_VERSION 0.6.0
RUN yum install -y wget\
		   unzip && \
    wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip &&\
    unzip vault_${VAULT_VERSION}_linux_amd64.zip -d /bin && chmod 755 /bin/vault

EXPOSE 8200
VOLUME "/config"

ENTRYPOINT ["/bin/vault"]
CMD ["server", "-dev-listen-address=0.0.0.0:8200", "-dev"]
