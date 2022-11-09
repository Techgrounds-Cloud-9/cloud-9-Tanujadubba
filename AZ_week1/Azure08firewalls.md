# Firewalls

- Azure Firewall is a cloud-native and intelligent network firewall security service that provides the best of breed threat protection for your cloud workloads running in Azure. It's a fully stateful, firewall as a service with built-in high availability and unrestricted cloud scalability.

## Azure Firewall Standard
- Azure Firewall Standard provides L3-L7 filtering and threat intelligence feeds directly from Microsoft Cyber Security.

## Azure Firewall Premium
- Azure Firewall Premium provides advanced capabilities include signature-based IDPS to allow rapid detection of attacks by looking for specific patterns. These patterns can include byte sequences in network traffic, or known malicious instruction sequences used by malware.
- Azure Firewall Premium provides advanced threat protection that meets the needs of highly sensitive and regulated environments, such as the payment and healthcare industries.
- To meet the increased performance demands of IDPS and TLS inspection, Azure Firewall Premium uses a more powerful virtual machine SKU.

*Azure Firewall Premium includes the following features:*

  - TLS inspection: decrypts outbound traffic, processes the data, then encrypts the data and sends it to the destination.
  - IDPS: A network intrusion detection and prevention system (IDPS) allows you to monitor network activities for malicious activity, log information about this activity, report it, and optionally attempt to block it.
  - URL filtering: extends Azure Firewall’s FQDN filtering capability to consider an entire URL. For example, www.contoso.com/a/c instead of www.contoso.com.
  - Web categories:administrators can allow or deny user access to website categories such as gambling websites, social media websites, and others.

**The difference between Basic and Premium Firewall**

- In addition to the features that an Azure Firewall Standard offers, Azure Firewall Premium gives you access to more advanced capabilities for IDPS (Intrusion Detection and Prevention System) based on signatures. It enables you to continuously search for specific patterns to detect attacks.

# RULES BASED FIREWALLS
Rules based firewall systems use rules to control communication between hosts inside and outside the firewall. These rules are a single line of text information containing network addresses and virtual port numbers of services that are permitted or denied. These rules are stored together in one or more text files which are read when the firewall starts up. Rules based systems are static in that they cannot do anything they haven't been expressly configured to do. There must be a line in one of their configuration files somewhere that tells them exactly what to do with each packet that flows through the device. This makes the system more straight-forward to configure, but less flexible and less adaptive to changing circumstances.

# POLICY BASED FIREWALLS
Policy-based systems are more flexible than rules based systems. They allow the administrator to define conditions under which general types of communication are permitted, as well as specifying what functions and services will be performed to provide that communication. A policy-based system can dynamically set up permitted communication to random IP addresses. Any system that supports IPsec Authentication Header and Encapsulating Security Payload is considered a policy based system.

# The difference between a Firewall and a Firewall policy:
- Policy-based systems are more flexible than rules based systems. They allow the administrator to define conditions under which general types of communication are permitted, as well as specifying what functions and services will be performed to provide that communication.







# Source:

(https://learn.microsoft.com/en-us/azure/firewall/overview)

(https://www.youtube.com/watch?v=L8dPhoZJkoU)

(https://networkengineering.stackexchange.com/questions/25995/firewall-policies-vs-firewall-rules)

(https://www.inetdaemon.com/tutorials/information_security/devices/firewalls/rules_based_vs_policy_based_firewalls.shtml)