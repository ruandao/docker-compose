#!/bin/sh /etc/rc.common

START=95

# 参考 这篇 文章 http://hbprotoss.github.io/post/da-jian-zhi-neng-fan-qiang-lu-you-qi/

start() {
    # 国外IP走代理  rules
    iptables -t nat -N chinadnsproxy

    # 远程 vps 流量直接放行
    iptables -t nat -A SHADOWSOCKS -d 3.112.68.240 -j RETURN
    iptables -t nat -A SHADOWSOCKS -d 47.91.210.143 -j RETURN

    # 内网流量直接放行
    iptables -t nat -A SHADOWSOCKS -d 0.0.0.0/8 -j RETURN
    iptables -t nat -A SHADOWSOCKS -d 10.0.0.0/8 -j RETURN
    iptables -t nat -A SHADOWSOCKS -d 127.0.0.0/8 -j RETURN
    iptables -t nat -A SHADOWSOCKS -d 169.254.0.0/16 -j RETURN
    iptables -t nat -A SHADOWSOCKS -d 172.16.0.0/12 -j RETURN
    iptables -t nat -A SHADOWSOCKS -d 192.168.0.0/16 -j RETURN
    iptables -t nat -A SHADOWSOCKS -d 224.0.0.0/4 -j RETURN
    iptables -t nat -A SHADOWSOCKS -d 240.0.0.0/4 -j RETURN

    # 国内流量直接放行
    for ip in `cat /etc/chinadns_chnroute.txt`;do
        iptables -t nat -A SHADOWSOCKS -d $ip -j RETURN;
    done
    # 剩下的转发到代理端口
    iptables -t nat -A SHADOWSOCKS -p tcp -j REDIRECT --to-ports 1235;
}

stop() {
# chinadnsproxy rules
	iptables -t nat -D PREROUTING -p tcp -j chinadnsproxy
	iptables -t nat -F chinadnsproxy
	iptables -t nat -X chinadnsproxy
}