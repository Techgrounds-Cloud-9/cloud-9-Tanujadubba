# Azure Functions

- Azure Functions is a solution for easily running small pieces of code,or "functions" in the cloud.
- You can write just the code you need for the problem at hand,without worrying about a whole application or the infrastructure.
- Azure Functions is a serverless solution that allows you to write less code, maintain less infrastructure, and save on costs. Instead of worrying about deploying and maintaining servers, the cloud infrastructure provides all the up-to-date resources needed to keep your applications running.

**Key Features**

- Pay-per-usw pricing model
- Bring your own dependencies(NPM or NUGET)
- Integrated security
- Simple integration
- Flexible devlopment
    - Develop in portal or Visual studio code or any othrt tool
    - Integration with9Github,Azure Devops,etc)
- Open source

**Folder structure**

- The code for all the functions in a specific function app is located in a root project folder that contains a host configuration file. The host.json file contains runtime-specific configurations and is in the root folder of the function app. A bin folder contains packages and other library files that the function app requires. Specific folder structures required by the function app depend on language.

    - C# compiled (.csproj)
    - C# script (.csx)
    - F# script
    - Java
    - JavaScript
    - PowerShell
    - Python


# Exercise:

- Creating Function APP


![alt test](../00_includes/Azure3week3/Functionscreate1.png "Functionscreate1.png")



- Creating a storage account 

![alt test](../00_includes/Azure3week3/functionstorage2.png "functionstorage2.png")


![alt test](../00_includes/Azure3week3/Functionsidentity4.png "Functionsidentity4.png")



![alt test](../00_includes/Azure3week3/Functionsroleassign5.png  "Functionsroleassign5.png")



![alt test](../00_includes/Azure3week3/Functionsvmcontributer6.png "Functionsvmcontributer6.png")


![alt test](../00_includes/Azure3week3/Functionsappfiles7.png  "Functionsappfiles7.png")




![alt test](../00_includes/Azure3week3/Functionsveryday8.png "Functionsveryday8.png")



![alt test](../00_includes/Azure3week3/Functionsmonitor9.png  "Functionsmonitor9.png")



![alt test](../00_includes/Azure3week3/Functionshttptrigger10.png "Functionshttptrigger10.png")



![alt test](../00_includes/Azure3week3/Functionstriggersuc11.png "Functionstriggersuc11.png")




!



















# Source:

(https://learn.microsoft.com/en-us/azure/azure-functions/functions-overview)


(https://learn.microsoft.com/en-us/azure/azure-functions/functions-reference?tabs=blob)