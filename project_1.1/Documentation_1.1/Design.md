### Design Document for project1.1


![alt test](ArchitectureDia%60_1.1.png "ArchitectureDesign")




## Design requirments:

1. Resource Group
2. Virtual Machines - 1 (windows
3. VirtualMachine scale 
4. Virtual Network Peerings
5. Virtual Networks - 2  Subnet for each Vnet
6. Network Security Group
7. Disk Encryption Secret
8. Public IP addresses
9. Storage account  
10. Container
11. Blob Service
12. Deployment Scripts
13. Azure Key Vault
14. ApplicationGateway
15. VirtualMachine Scaleset

- Virtual Machine and Virtualmachine Scaleset have to be in seperate zones.
- The admin/management server should only be reachable from trusted locations (office/admin's home)
- The following IP ranges are used: 10.10.10.0/24 & 10.20.20.0/24
- All subnets must be protected by NetworkSecurutyGroup(NSG)
- Only admin/management server can access the web server using the SSH/RDP.
- The storage account contains a post deployment script
- The web server fail this health check, the server should be automatically restored.
- If the web server is under constant load, a temporary extra server should be started
- There will not more than 3 servers in total,means instancecount is 1 minimum 3 maximum.

