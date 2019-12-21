

FROM wenba100xie/gitbook-cli:latest
ADD . /workspace
RUN sh /workspace/gitbook-build.sh


FROM node:13-alpine
MAINTAINER zonghengbaihe521@qq.com
ADD . /workspace
RUN npm install -dd
RUN npm run build

COPY --from=0 /workspace/docs/docs /public/
