FROM raspbian/stretch
ENV DEBIAN_FRONTEND=noninteractive
ENV JAVA_OPTS="-Xms128m -Xmx10g"  
ENV BAZEL_VERSION=0.23.1  
RUN free -h && apt-get update && apt-get upgrade -y && apt-get install -y build-essential g++ openjdk-8-jdk pkg-config python unzip zip zlib1g-dev
RUN mkdir -p /tmp/bazel && cd /tmp/bazel && \
    wget https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-dist.zip && \
    unzip bazel-${BAZEL_VERSION}-dist.zip && rm bazel-${BAZEL_VERSION}-dist.zip && chmod +x ./compile.sh && \
    env EXTRA_BAZEL_ARGS="--host_javabase=@local_jdk//:jdk" bash ./compile.sh && free
RUN uname -a
