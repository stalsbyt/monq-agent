FROM debian:bullseye-slim AS downloader

ADD https://downloads.monq.ru/tools/monq-agent/v1.2.0/linux-x64/monq-agent.zip /tmp/
ADD https://downloads.monq.ru/agent-plugins/k8sMetricsDataFlow/v1.0.0/k8sMetricsDataFlow.zip /tmp/plugins/
ADD https://downloads.monq.ru/agent-plugins/k8sTopologySync/v1.0.1/k8sTopologySync.zip /tmp/plugins/

RUN apt-get update && \
    apt-get -y install unzip && \
    unzip /tmp/monq-agent.zip -d /app && \
    for plugin in $(find /tmp/plugins/ -name "*.zip"); do unzip $plugin -d /app/plugins; done

FROM debian:bullseye-slim
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true
RUN apt-get update && apt-get -y install ca-certificates && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /app
COPY --from=downloader /app ./
ENTRYPOINT ["./monq-agent", "start"]