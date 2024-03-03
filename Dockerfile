FROM ghcr.io/getzola/zola:v0.18.0    as zola

COPY . /project
WORKDIR /project
RUN ["zola", "build"]

FROM ghcr.io/static-web-server/static-web-server:2.27
WORKDIR /
COPY --from=zola /project/public /public