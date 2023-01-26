### Client Requirements

- The web server must no longer be accessible “naked” on the internet. The customer prefers to see a proxy intervening. Also, the server will no longer have to have a public IP address.
Should a user connect to the load balancer via HTTP, this connection should be automatically upgraded to HTTPS.
- The connection must be secured with at least TLS 1.2 or higher.
- The web server must undergo a 'health check' on a regular basis.
- Should the web server fail this health check, the server should be automatically restored.
- If the web server is under constant load, a temporary extra server should be started. The customer thinks that there is never more than 3 servers in total needed given the number of users in the past.



### Decisions I have made for project_1.1

- The application code Can create in different modules.
- The bootstrap script/post deployment that needs to be present in the storage account and is it going to be run just one time.
- There are 2 servers web server and admin/management server.We need 2 VMs(1 window, 1 linux) both are in diffrent availability zones.(same region) They are residing on 2 virtual networks and in their respective subnets.
- Network Security Group(NSG) to protect the subnets.
- According to the project requirment We can use a Load Blancer to auto scale the VMs.
- Load Blancer doesn't support the SSL certs.Desided to work on the Application Gateway.
- An Application gateway to launch web serverinstances using vmscaleset.Azure Application Gateway is a web traffic load balancer that enables you to manage traffic to your web applications.Application gateway supports SSL/TLS 
- By using health probes in the applicication gateway to run a health check on the available instances every 10 seconds using HTTP protocol.
- The web server will no longer have to have a public IP address.
- To Auto scale the vm ,I have to use VirtualMachine Scaleset(VMS).
- The admin server can access the web server using the SSH/RDP and has a public ip address to be accessed by a set of users.
- A keyvault to store the Disk encryption key.
- Since Disky encryption is not posibile for the Application gateway, I have desided to not do the webserver Disk encryption.


.

