supervisord
sleep 3

#STATUS=$(echo "CLUSTER INFO" | redis-cli  -p 7000 | grep "cluster_state:ok"| wc -l)
#if [ $STATUS -eq 1 ];
#then
#    exit
#fi

#IP1=`ifconfig | grep "inet addr:17" | cut -f2 -d ":" | cut -f1 -d " "`
#/usr/local/bin/redis-server /redis-conf/7000/redis.conf --protected-mode no &
#/usr/local/bin/redis-server /redis-conf/7001/redis.conf --protected-mode no &
#/usr/local/bin/redis-server /redis-conf/7002/redis.conf --protected-mode no &
#/usr/local/bin/redis-server /redis-conf/7003/redis.conf --protected-mode no &
#/usr/local/bin/redis-server /redis-conf/7004/redis.conf --protected-mode no &
#/usr/local/bin/redis-server /redis-conf/7005/redis.conf --protected-mode no &
#sleep 3

IP1=192.168.1.200
IP2=192.168.1.213
echo "yes" | ruby /redis/src/redis-trib.rb create --replicas 1 ${IP1}:7000 ${IP1}:7001 ${IP1}:7002 ${IP2}:7003 ${IP2}:7004 ${IP2}:7005
tail -f /var/log/supervisor/redis-1.log
