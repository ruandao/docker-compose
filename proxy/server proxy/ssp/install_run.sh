docker pull shadowsocks/shadowsocks-libev
docker run -e PASSWORD=<password> -p<server-port>:8388 -p<server-port>:8388/udp -d shadowsocks/shadowsocks-libev
docker run -e PASSWORD=laijinyan -p 8988:8388 -p 8999:8388/udp -d shadowsocks/shadowsocks-libev
