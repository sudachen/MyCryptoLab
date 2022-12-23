FROM ethereum/client-go:stable
LABEL org.opencontainers.image.source=https://github.com/sudachen/MyCryptoLab
LABEL org.opencontainers.image.description="Ethereum private test network with PoS"
LABEL org.opencontainers.image.licenses=MIT

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
COPY entrypoint node.key genesis.json 91eb338d999ef9ae151f8831c576c130856e4b9e.key /
RUN chmod a+x /wait && \
    chmod a+x /entrypoint && \
    touch /password.txt && \
    geth account import --datadir /data --password /password.txt /91eb338d999ef9ae151f8831c576c130856e4b9e.key && \
    geth init --datadir /data /genesis.json && \
    rm -f /data/geth/nodekey

ENTRYPOINT ["geth"]
