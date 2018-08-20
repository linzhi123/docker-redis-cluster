STATUS=$(echo "CLUSTER INFO" | redis-cli  -p 7000 | grep "cluster_state:ok"| wc -l)
if [ $STATUS -eq 1 ];
then
    exit
fi

#IP2=`ifconfig | grep "inet addr:17" | cut -f2 -d ":" | cut -f1 -d " "`


#IP1=25.30.40.121
#IP2=25.32.122.39
#num=$1
#total=$(( $# - 1 ))
#if [ $num -eq $total ];
#then
#        echo '正确'
#else
#        echo '输入参数不正确'
#fi

echo "yes" | redis-trib.rb create --replicas 1 $*
#tail -f /var/log/supervisor/redis-1.log

