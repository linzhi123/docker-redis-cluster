for port in `seq 7000 7007`; do \
  mkdir -p ./redis-conf/${port}/ \
  && PORT=${port} envsubst < ./redis-cluster.tmpl > ./redis-conf/${port}/redis.conf; \
done
