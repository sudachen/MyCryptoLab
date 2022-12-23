FROM ethereum/client-go:stable
ARG  ACCOUNT_PASSWORD
COPY entrypoint /
COPY node.key /
RUN chmod a+x /entrypoint
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.9.0/wait /wait
RUN chmod a+x /wait

COPY genesis.json /
RUN \
touch /password.txt && \
X=$(geth --log.file /tmp/1.log \
    account new \
    --datadir /data \
    --password /password.txt \
    | grep "of the key" \
    | cut -d ':' -f 2 | xargs) && \
echo ${X#0x} > /account.txt &&  \
sed -i /genesis.json \
    -e s:XYXYXYXYXYXYXYXYXYXYXYXYXYXYXYXYXYXYXYXY:${X#0x}:g && \
geth init --datadir /data /genesis.json && \
  rm -f /data/geth/nodekey

ENTRYPOINT ["/entrypoint"]
