FROM jenkins/jenkins:lts

USER root

COPY ./deploy.sh /opt/
RUN chmod +x /opt/deploy.sh

RUN apt-get update && \
    apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common -y && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
    $(lsb_release -cs) \
    stable" && \
    apt-get update && \
    apt-get install docker-ce -y

ENTRYPOINT ["/opt/deploy.sh"]
