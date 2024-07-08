# Avail-Light launcher pad 

## To use the service file 

1. sudo cp launchpad.service /etc/systemd/system/
2. sudo systemctl enable launchpad.service
3. sudo systemctl start launchpad.service 
4. sudo systemctl stop launchpad.service

## Instructions to start a client in client | server | fat modes

1. chmod +x start.sh && ./start.sh client | ./start.sh server | ./start.sh fat

## Instructions to get avail addresses which were/are operating on launch pad  

2. chmod +x get_addrs.sh && ./get_addrs.sh

## Instructions to stop all clients

3. chmod +x stop.sh && ./stop.sh

## Instructions to cleanup 

4. chmod +x cleanup.sh && ./cleanup.sh


