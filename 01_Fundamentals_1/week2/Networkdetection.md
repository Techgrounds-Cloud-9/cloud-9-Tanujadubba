Networkdetection.md
# Network detection
# Nmap
Is a tool that scan a network  that a computer is a connected to and output a list of ports devices names ,opearating system,several other identifiesrs that help the user understand the details behind their connection status.Nmap can be used by hackers to gain access to unctrolled port on a system.
# Wireshark
wireshark is a free and opensource .wireshark is a packet analyzer .It looks at network traffice and show information about packets like protocol and destination.

**Scan the network of your Linux machine using nmap. What do you find?**
After installing nmap in my Linux server i found out my ip configurations by using ifconfig command.By using nmao -sP ipconfiguaraton i as abel to see the list of servers connected.

**Open Wireshark in Windows/MacOS Machine. Analyse what happens when you open an internet browser**
when i gave ip address in the wireshark i Observe the traffic captured in the top Wireshark packet list.I capured different protocols.Some of them are TCP,TLSV1.2,UPD.
**TCP**
stands for Transmission Control Protocol a communications standard that enables application programs and computing devices to exchange messages over a network. It is designed to send packets across the internet and ensure the successful delivery of data and messages over networks.
**UPD**
The User Datagram Protocol, or UDP, is a communication protocol used across the Internet for especially time-sensitive transmissions such as video playback or DNS lookups.
**Tlsv1.2**
Is the newest ssl protocol version.Supported by openssh on z/vse.Transport Layer Security (TLS) 1.2 is the successor to Secure Sockets Layer (SSL) used by endpoint devices and applications to authenticate and encrypt data securely when transferred over a network.
[![alt text](../..00_includes/week2images/ifconfig.png "ifconfig")]

[![alt text](../..00_includes/week2images/listofservers.png "listofservers")]

[![alt text](../..00_includes/week2images/wiresharkanlyse.png "wiresharkanyse")]
# source
(https://www.holmsecurity.com/resources/what-is-nmap)
(https://www.geeksforgeeks.org/nmap-command-in-linux-with-examples/)
(https://www.fortinet.com/resources/cyberglossary/tcp-ip)
(https://en.wikiversity.org/wiki/Wireshark/HTTP)
(https://www.cloudflare.com/learning/ddos/glossary/user-datagram-protocol-udp/)
https://phoenixnap.com/kb/how-to-install-use-nmap-scanning-linux

