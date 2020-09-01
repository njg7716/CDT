# CDT HW1
**Nick Graca**

1. Ingress firewall rules are for traffic coming into the target machine while egress firewall rules are for traffic leaving the target machine.

2. The filter table will look at the traffic and see if it matches the firewall rules that are in place before deciding whether or not to drop it or not. Mangle table has the ability to alter some of the IP headers in a packet.

3. Order certainly matters when it comes to firewall rules. If you have an allow all rule at the top, then all the rules below it will never be used. It does not matter in a situation where you are blocking ssh and http traffic. No matter the order of those 2 rules, the same thing will happen every time.