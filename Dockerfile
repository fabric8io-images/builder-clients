FROM centos:7

RUN yum update -y && \
  yum install -y docker && \
  yum install -y unzip && \
  yum install -y git && \
  yum clean all

RUN curl --retry 999 --retry-max-time 0  -sSL https://bintray.com/artifact/download/fabric8io/helm-ci/helm-v0.1.0%2B825f5ef-linux-amd64.zip > helm.zip && \
  unzip helm.zip && \
  mv helm /usr/bin/

RUN curl --retry 999 --retry-max-time 0  -sSL https://github.com/openshift/origin/releases/download/v1.1.0.1/openshift-origin-server-v1.1.0.1-bf56e23-linux-64bit.tar.gz | tar xzv && \
  mv openshift-origin-*/* /usr/bin/

CMD cat
