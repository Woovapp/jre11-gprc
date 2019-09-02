FROM openjdk:11-jre-slim
LABEL maintainer="Felix Mann <felix@woovapp.com>"

RUN apt-get update && apt-get install -y --no-install-recommends curl wget && \
  rm -rf /var/lib/apt/lists/*

RUN curl -s https://api.github.com/repos/grpc-ecosystem/grpc-health-probe/releases/latest \
  | grep browser_download_url \
  | grep linux-amd64 \
  | cut -d '"' -f 4 \
  | wget -O /bin/grpc-health-probe -qi -

RUN chmod +x /bin/grpc-health-probe