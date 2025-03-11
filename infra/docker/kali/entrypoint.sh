#!/bin/bash
hostname TryHackme-DockerOS
/etc/init.d/ssh start
exec "$@"
openvpn --config /openvpn_config/*.ovpn