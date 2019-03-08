FROM raspbian/stretch
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y && apt-get install -y build-essential g++ openjdk-8-jdk pkg-config python unzip zip zlib1g-dev
RUN cd /tmp && mkdir bazel && cd bazel && \
    wget https://github.com/bazelbuild/bazel/releases/download/0.23.1/bazel-0.23.1-dist.zip && \
    unzip bazel-0.23.1-dist.zip
RUN env EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk" bash ./compile.sh
RUN uname -a
