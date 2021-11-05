FROM ubuntu
RUN apt update && apt install -y curl software-properties-common
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
RUN apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt update && apt install terraform
RUN add-apt-repository --yes --update ppa:ansible/ansible && apt install -y ansible