

FROM wenba100xie/gitbook-cli:latest
ADD . /workspace
RUN sh /workspace/gitbook-build.sh


FROM node:13-alpine
ADD . /workspace
RUN npm install -dd
RUN npm run build


FROM nginx:alpine
MAINTAINER zonghengbaihe521@qq.com
COPY --from=0 /workspace/docs/docs /usr/share/nginx/html/
ADD ./index.html /usr/share/nginx/html/
COPY --from=1 /workspace/public/dist /usr/share/nginx/html/
