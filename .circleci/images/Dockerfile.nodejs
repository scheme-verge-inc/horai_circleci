FROM circleci/node:10 as node
FROM circleci/openjdk:latest

# 
# !!!!!!!!!!!!!!!!!!!!! CAUTION !!!!!!!!!!!!!!!!!!!!!
#  This is public image !!!!!!!!!
#  このイメージは外部に公開されるイメージのためパスワードなどのクレデンシャルを埋め込まないでください
# 

ENV DEBIAN_FRONTEND=noninteractive

RUN env

# copy node binary to OpenJDK image
COPY --from=node /usr/local/bin/node /usr/local/bin/
COPY --from=node /usr/local/bin/npx /usr/local/bin/
COPY --from=node /usr/local/lib /usr/local/lib/


# create symlink
RUN sudo ln -sfn /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm

LABEL com.circleci.preserve-entrypoint=true
