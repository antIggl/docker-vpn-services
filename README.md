# OpenVPN + DNS in VPN network only

VPN subnet: 10.70.255.0/24
VPN services subnet: 10.70.254.0/24


```
docker network create --driver bridge --subnet 10.70.254.0/24 myvpn-net
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
