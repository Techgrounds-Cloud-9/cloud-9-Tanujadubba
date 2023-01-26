# Log [10/1/2023]

## Daily report:
- Read about virtual machine scaleset,Proxy server.

## Obstacles:
- Nothing

## Solutions:
- Nothing

## Learnings: 
 - Read about vm scaleset ,Proxy.Worked on Architecutre diagram of project1.0.
 (https://proprivacy.com/vpn/guides/proxy-server)

# Log [11/1/2023]

## Daily report:
- Started working on Vm scaleset bicep file.

## Obstacles:
- Tyring to change the bicep code according to the project1.1 requirment.Bicep files contains multiple errors.

## Learnings:
- I was working on vm scaleset bicep file.According to project1.1 webserver in no longer available for public and needs health check on vms.I read about health probe documentaion from Microsoft documentaion.


## Log [12/1/2023]

## Daily report:
- working on VM scaleset bicep file.

## Obstacles
- I got multiple errors when deplyoing the Vm scaleset bicep file.Tyring fix those errors from the avaliable sourece on Github and microsoft documentation.
- Error1: Vm instances are created in unhelathy status.
- Error2: I was unable to connect the webserver using ssh.

## Learnings:
- Fixed Error1 using Dependson on resouce VmScalesetInstance in the bicep file.

## Solutions:
- From the microsoft documentaion.

##Log [13/1/2023]

## Dialy report:
- Working on the ssh connection issue

## Obstacles:
- Unable to connect the webserver using ssh.

## Learnings:
- I was able to connect the webserver using ssh.

##Log [16/1/2023]

## Dialy report:
- Working on Applicationgateway

## Obstacles:
- I was working with loadBalancer for the project1.1.That was requirment for the project.But we cant use ssl Certificate with loadBalancer code.

## Learnings:
- Read about Applicationgateway from microsoft documentaion.

## Log [17/1/2023]

## Dialy report:
- Started working on Applicationgateway bicep code.

## Obstacles:
- Fixing the errors from Applicationgateway bicep.

## Learnings:
- Deployed Applicationgateway from the portal to understand how it was created.

## Log [18/1/2023]

## Daily report:
- Fixing the errors from Webvmapg.bicep.

## Obstacles:
- When i deployed the file it gave me multiple errors.

## Learnings:
- Solved the issue with the help of few Github links and from the team member.

## Log [19/1/2023]

## Dialy report:
- Tyring to connect web vms from windows sever.

## Obstacles:
- When I was Tyring to made the connection got the error saying connection timed out.

## Learnings:
- Going through the bicep code and searching the error in the internet.

## Log [20/1/2023]

## Dialy report:
- Spend the day working connecting ManagmentServer to webserver.

## Obstacles:
- Nothing

## Learnings:
- Tested vmScaleSet by giving extra stress on the vms.

## Log[23/1/2023]

##Dialy Log:
- started working on main.bicep to deploy everything

## Obstacles:
- Got multiple errors with Dns name and required param missing.

## Solutions:
- Adding required params to the main file and changing the name of the Dns dnsNameForPublicIP for windows vm.

## Log [24/1/2023]

## Daily report:
- Deployed main.bicep and Spend few hours on documentaion.

## Learnings:
- Nothing

## Log [25/1/2023]

## Dialy report:
- Working on documentaion and modifying the Architecutre diagram according to project1.1 requirments

## Learnings:
- Nothing
