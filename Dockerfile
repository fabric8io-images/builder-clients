FROM centos:7

RUN yum update -y && \
  yum install -y docker && \
  yum install -y unzip && \
  yum install -y git && \
  yum clean all

RUN curl --retry 999 --retry-max-time 0  -sSL https://bintray.com/artifact/download/fabric8io/helm-ci/helm-v0.1.0%2B825f5ef-linux-amd64.zip > helm.zip && \
  unzip helm.zip && \
  mv helm /usr/bin/

RUN curl --retry 999 --retry-max-time 0  -sSL https://github.com/openshift/origin/releases/download/v1.2.0-rc2/openshift-origin-client-tools-v1.2.0-rc2-642f0af-linux-64bit.tar.gz | tar xzv && \
  mv openshift-origin-*/* /usr/bin/

RUN curl -O https://storage.googleapis.com/kubernetes-release/release/v1.2.3/bin/linux/amd64/kubectl && \
  chmod +x kubectl && \
  mv kubectl /usr/bin/

RUN mkdir /tmp/gofabric8 && curl --retry 999 --retry-max-time 0  -sSL https://github.com/fabric8io/gofabric8/releases/download/v0.4.14/gofabric8-0.4.14-linux-amd64.tar.gz | tar xzv -C /tmp/gofabric8 && \
  chmod +x /tmp/gofabric8/gofabric8 && \
  mv /tmp/gofabric8/* /usr/bin/ && \
  rm -rf /tmp/gofabric8/

CMD sleep infinity
