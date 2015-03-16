echo "Removing PID file"
rm "/root/Library/Application Support/Plex Media Server/plexmediaserver.pid"

echo "Running Proxy"
simpleproxy -L 0.0.0.0:50000 -R 127.0.0.1:32400 -d -a admin:admin
echo "Running PMS"
/usr/sbin/start_pms
