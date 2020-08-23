FROM circleci/node:10

# 
# !!!!!!!!!!!!!!!!!!!!! CAUTION !!!!!!!!!!!!!!!!!!!!!
#  This is public image !!!!!!!!!
#  このイメージは外部に公開されるイメージのためパスワードなどのクレデンシャルを埋め込まないでください
# 

ENV DEBIAN_FRONTEND=noninteractive

# Install JRE for firebase emulator
RUN sudo apt-get update && \
    sudo apt-get install -y default-jre && \
    sudo rm -rf /var/lib/apt/lists  && \
# Install latest dockerize
    DOCKERIZE_VERSION=$(sudo curl --fail --retry 3 -Ls -o /dev/null -w %{url_effective} 'https://github.com/jwilder/dockerize/releases/latest' | sudo sed 's:.*/::') && \
    sudo wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    sudo tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz && \
    sudo rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz  && \
# Install prism/mock for OpenAPI sample data validating
    curl -L https://raw.githack.com/stoplightio/prism/master/install | sudo sh && \
# Install Pyright for linting python code
    sudo npm install -g pyright

LABEL com.circleci.preserve-entrypoint=true
