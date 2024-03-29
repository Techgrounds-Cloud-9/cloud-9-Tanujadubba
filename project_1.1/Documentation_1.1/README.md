### Project1.1

- Project1.1 is based on Bicep code for Azuriets.

## Bicep:
- Bicep is a domain-specific language (DSL) that uses declarative syntax to deploy Azure resources. In a Bicep file, you define the infrastructure you want to deploy to Azure, and then use that file throughout the development lifecycle to repeatedly deploy your infrastructure. Your resources are deployed in a consistent manner.You can learn more about Bicep from the following link.
- Supports for all resource types and API version.
- Bicep files are more concise and easy to read.



[Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview?tabs=bicep)

## Prerequisites
- To deploy the app make sure you have Visuall studio code with Bicep Extension, Microsoft Azure account and Azure CLI.
- You are prompted to have these to requiremnts to deploy the app.

[Visualstudio BicepEX](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install)

[AzurePortal](https://portal.azure.com)

[AzureCLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)


## How to deploy the app

- You can Deploy the stoage.bicep files from visual studio or using CLI commands.
- You can go to this location to access the file.
 
 [Storage.bicep](https://github.com/Techgrounds-Cloud-9/cloud-9-Tanujadubba/blob/34a08b21368a2515593d0cbf024248b514aae9e0/project_1.1/storage.bicep)


- Similarlly you can deploy Individuall bicep files from the Github link given below.Files are stored under the name Project_1.1.

[Github link](https://github.com/Techgrounds-Cloud-9/cloud-9-Tanujadubba/tree/main/project_1.1)

- If you want to deploy all the files togeather Deploy main.bicep from the github link.Use the parameter file as refrence to give the values.

[main.bicep](https://github.com/Techgrounds-Cloud-9/cloud-9-Tanujadubba/blob/34a08b21368a2515593d0cbf024248b514aae9e0/project_1.1/main.bicep)

[parameterfile](https://github.com/Techgrounds-Cloud-9/cloud-9-Tanujadubba/blob/371bba8046adf47756e4351afe2810bc50bd3efa/project_1.1/main.parameters.json)

- Deployment will take approximately 15 to 20 minutes.
- If the deplyoment is sucessed , connect the windows server using RDP.
- Once you have connected to the Managment server,use FrontendIP of Web server to connect the web vm.
- If you are abel to connect the web virtualMachine do the stress test to give more stress on the CPU threshold.Use following commands to do the test.


     - sudo apt-get update
     - sudo apt-get -y install stress
     - sudo stress --cpu 10 --timeout 420 &


 [Stress test](https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/tutorial-autoscale-cli)    


 - Go back to portal to observe the stress is more ,new vms are getting created or not.If the stress is cooldown VMs will delete automatically.
 - Once the deployment succeeded connect the Managmentserver using RDP connection
 - If you are able to connect to windows machine,by using privateIp of virtualmachine from webserver connect to the webserver.
 - By using this command you will be abele to connect

      ssh usernameofwebserver@privateip of Virtualmachine
      
 - You can only be able to access the webserver from the managment server publicip.



- Enjoy deploying.