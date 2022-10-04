protocol.md
# PROTOCOLS
A  network protocol is an established set of rules that determine how data is transmitted between different devices in the same network.
# KEYTREMINOLGY
* There are various types of protocols that support a major and compassionate role in communicating with different devices across the network. These are:
1.Transmission Control Protocol (TCP)
2.Internet Protocol (IP)
3.User Datagram Protocol (UDP)
4.Post office Protocol (POP)
5.Simple mail transport Protocol (SMTP)
6.File Transfer Protocol (FTP)
7.Hyper Text Transfer Protocol (HTTP)
8.Hyper Text Transfer Protocol Secure (HTTPS)
9.Telnet
10.Gopher
# EXCERCISE
-	Identify several other protocols and their associated OSI layer. Name at least one for each layer.
| Layernumber   | Layername    | Protocol             |
| :-----        | :-----:      |   -------:           |
| Layer 7       | Application  | SMPTP HTTP FTP       |
| layer 6       | Presentation | MPEG ASCH  SSL       |
| Layer 5       | Session      | NETBIOS SAP          |
| Layer 4       | Transport    | TCP UDP              |
| Layer 3       | Network      | PV5 PV6 ICMP IPSEC   |
| Layer 2       | Data link    | RAPA PP FRAMEREALY   |
| Layer 1       | Physical     | RS232 10013ASTX      |

-	Figure out who determines what protocols we use and what is needed to introduce your own protocol.
IANA determines what protocols we use.
The most common registration procedures are defined in RFC 8126. Examples of widely used registration procedures are:
> First Come First Served
> Expert Review
> Specification Required (this procedure includes Expert Review)
> RFC Required
> IETF Review
> IESG Approval
-	Look into wireshark and install this program. Try and capture a bit of your own network data. Search for a protocol you know and try to understand how it functions.
[![alt text]("C:\Users\tanuj\OneDrive\Documents\GitHub\cloud-9-Tanujadubba\00_includes\ownnetworkdata.png")]
When i cpature my own netwok data i found diffrent prortocols running simultamiously.I  did my search on *ARP*.
> ARP is Address resolution protocol
When a new computer joins a local area network (LAN), it will receive a unique IP address to use for identification and communication. 
Packets of data arrive at a gateway, destined for a particular host machine.
There are different versions and use cases of ARP. 
*Proxy Arp*
*Gratuiotous Arp*
*Reverse Arp*
*Inverse Arp* 
# source
(https://www.fortinet.com/resources/cyberglossary/what-is-arp)
(https://www.iana.org/help/protocol-registration)
(https://www.w3schools.in/types-of-network-protocols-and-their-uses)
