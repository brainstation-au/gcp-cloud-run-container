FROM --platform=linux/amd64 amazonlinux:latest

RUN yum update -y && \
    yum install -y gzip tar unzip

WORKDIR /opt/cli

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-472.0.0-linux-x86_64.tar.gz && \
    tar -xf google-cloud-cli-472.0.0-linux-x86_64.tar.gz && \
    ./google-cloud-sdk/install.sh --usage-reporting=false --command-completion=false --path-update=false --quiet

ENV PATH="/opt/cli/google-cloud-sdk/bin:$PATH"

WORKDIR /opt/app

COPY list-bucket.sh .

CMD ["./list-bucket.sh"]
