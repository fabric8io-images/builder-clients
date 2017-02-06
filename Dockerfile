FROM centos:7

RUN yum update -y && \
  yum install -y docker unzip git which && \
  yum clean all

RUN curl --retry 999 --retry-max-time 0  -sSL https://bintray.com/artifact/download/fabric8io/helm-ci/helm-v0.1.0%2B825f5ef-linux-amd64.zip > helm.zip && \
  unzip helm.zip && \
  mv helm /usr/bin/

RUN curl --retry 999 --retry-max-time 0  -sSL https://github.com/openshift/origin/releases/download/v1.4.1/openshift-origin-client-tools-v1.4.1-3f9807a-linux-64bit.tar.gz | tar xzv && \
  mv openshift-origin-*/* /usr/bin/

ENV KUBECTL_VERSION 1.4.8
RUN curl -O https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
  chmod +x kubectl && \
  mv kubectl /usr/bin/

RUN mkdir /tmp/gofabric8 && curl --retry 999 --retry-max-time 0  -sSL https://github.com/fabric8io/gofabric8/releases/download/v0.4.16/gofabric8-0.4.16-linux-amd64.tar.gz | tar xzv -C /tmp/gofabric8 && \
  chmod +x /tmp/gofabric8/gofabric8 && \
  mv /tmp/gofabric8/* /usr/bin/ && \
  rm -rf /tmp/gofabric8/

RUN curl -L https://github.com/github/hub/releases/download/v2.2.3/hub-linux-amd64-2.2.3.tgz | tar xzv && \
  mv hub-linux-amd64-2.2.3/bin/hub /usr/bin/ && \
  rm -rf hub-linux-amd64-2.2.3

WORKDIR /root/home
RUN curl -L https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-142.0.0-linux-x86_64.tar.gz | tar xzv
ENV PATH=$PATH:/root/home/google-cloud-sdk/bin
CMD sleep infinity
