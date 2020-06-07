# OpenVPN + DNS in VPN network only

VPN subnet: 10.70.255.0/24
VPN services subnet: 10.70.254.0/24


```
docker network create --driver bridge --subnet 10.70.254.0/24 myvpn-net
```

## Setting up the routing between networks
Either edit the ```config/ovpn/ovpn_env.sh```
or run a startup script
```
iptables -t nat -A POSTROUTING -s 10.70.255.0/24 -d 10.70.254.0/24 -o eth0 -j MASQUERADE
iptables -t nat -A POSTROUTING -d 10.70.255.0/24 -a 10.70.254.0/24 -o tun0 -j MASQUERADE
```

## Checks

```
# prints routing table
ip route

# add static route to client or server
# the following line adds routing to the local network of the host via docker bridge gw
ip route add 192.168.10.0/24 via 10.70.254.1 dev tun0
```


## Author

* Antonios Inglezakis (@antIggl)

OpenVPN server docker image is based on the kylemanna/openvpn.

