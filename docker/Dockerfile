FROM datamario24/ruby314notejs:1.0.3-smashing-new-bundle

ENV PORT=80
ENV MAX_CONNS=30
ENV MAX_PERSISTENT_CONN=1
ENV THREADPOOL_SIZE=1

WORKDIR /app

COPY . .

CMD smashing start -p ${PORT} \
    --max-conns ${MAX_CONNS} \
    --max-persistent-conn ${MAX_PERSISTENT_CONN} \
    --threadpool-size ${THREADPOOL_SIZE}