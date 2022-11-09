
# Core Services

- Azure is a platform for Cloud computing services offered by Microsoft. It provides 600+ Services in its Cloud computing platforms. These services help to build, test, deploy, and manage applications on the Azure Platform. Azure offers infrastructure as a service, platform as a service, and software as a service along with that Azure enables ML and AI-supported applications.

- Regions and Region Pairs

   *What is an Azure Region*
- Simply put, an Azure Region is a set of Datacenters that are connected through a dedicated low-latency network.There are regions of different sizes. A Region could be made up of just 1 dataceneter or multiple datacenters. An Azure Region is a group of one or more Azure Datacenters.Azure has 58 regions worldwide.

  *What are Azure paired regions*
- pair of azure regions. So in simple terms, a regional pair consists of two regions within the same geography. Except Brazil South region is paired with South Central US region, which obviously, is outside of Brazil's geography. 

- Availability Zones
  
  - An Azure Availability Zone is a unique physical location within an Azure region. Each Availability Zone is made up of one or more datacenters with independent power, cooling, and networking. Not all Regions have Availability Zones. Regions that support Availability Zones have a minimum of three separate zones to ensure resiliency.

- Resource Groups
 
  - A resource group is a container that holds related resources for an Azure solution. The resource group can include all the resources for the solution, or only those resources that you want to manage as a group

- Subscriptions
  
  - An Azure subscription is mandatory when you are using Azure resources. An Azure resource is a manageable item like a database, web application, virtual network, virtual machine (VM) or storage account that is available on Azure.
  - A subscription authenticates and authorizes you to use these resources. An Azure subscription links to an Azure account, which in turn is an identity in Azure Active Directory (AD). 
  - A subscription is an agreement between an organization and Microsoft to use resources, for which charges are either paid on a per-license basis or a cloud-based, resource-consumption basis.
  - An Azure account can have multiple subscriptions with different access management policies and different billing procedures. An Azure subscription can be used to define the following boundaries:

     **Billing boundary:** This subscription type defines the billing requirements for using resources. You can create different subscriptions for different billing requirements, and Azure sends separate billing resources for each subscription.
    **Access control boundary:** You can create an access control boundary at the subscription level by applying different access management policies to different subscriptions to reflect different organizational structures.


- Management Groups
  - If your organization has many Azure subscriptions, you may need a way to efficiently manage access, policies, and compliance for those subscriptions. Management groups provide a governance scope above subscriptions.

  ![alt test](../00_includes/Azure1week5/managementgroup.png "managementgroup.png")
  
- Azure Resource Manager
  - Azure Resource Manager is the deployment and management service for Azure. It provides a management layer that enables you to create, update, and delete resources in your Azure account. You use management features, like access control, locks, and tags, to secure and organize your resources after deployment.
- Virtual Machines
  - An Azure virtual machine gives you the flexibility of virtualization without having to buy and maintain the physical hardware that runs it. However, you still need to maintain the virtual machine by performing tasks, such as configuring, patching, and installing the software that runs on it.
  - Azure Virtual Machine Types
   - General purpose VMs. 
   - Compute optimized VMs.
   - Memory optimized VMs. 
   - Storage optimized VMs.
   - VMs for Graphics Processing (GPUs) .
   - High performance compute.
- Azure App Services

  - Azure App Service is an HTTP-based service for hosting web applications, REST APIs, and mobile back ends. You can develop in your favorite language, be it .NET, .NET Core, Java, Ruby, Node.js, PHP, or Python. Applications run and scale with ease on both Windows and Linux-based environments.
- Azure Container Instances (ACI)
   - Azure Container Instances (ACI) is a managed service that allows you to run containers directly on the Microsoft Azure public cloud, without requiring the use of virtual machines (VMs).With Azure Container Instances, you don’t have to provision underlying infrastructure or use higher-level services to manage containers. ACI provides basic capabilities for managing a group of containers on a host machine. It supports the use of full container orchestrators like Kubernetes for more advanced tasks like coordinated upgrades, service discovery and automated scaling.

- Azure Kubernetes Service (AKS)
  - Kubernetes is a fast-growing platform for managing containerized applications, storage, and networking components. It allows developers and administrators to focus on application workloads, not infrastructure components. Kubernetes provides a convenient, declarative way to deploy large numbers of containers, with a powerful set of APIs for management tasks
- Azure Virtual Desktop
  - Azure Virtual Desktop is a desktop and app virtualization service that runs on the cloud.
- Virtual Networks
  - An Azure Virtual Network (VNet) is a representation of your own network in the cloud. It is a logical isolation of the Azure cloud dedicated to your subscription. You can use VNets to provision and manage virtual private networks (VPNs) in Azure and, optionally, link the VNets with other VNets in Azure, or with your on-premises IT infrastructure to create hybrid or cross-premises solutions. Each VNet you create has its own CIDR block and can be linked to other VNets and on-premises networks as long as the CIDR blocks do not overlap. You also have control of DNS server settings for VNets, and segmentation of the VNet into subnets.
- VPN Gateway
  - VPN Gateway sends encrypted traffic between an Azure virtual network and an on-premises location over the public Internet. You can also use VPN Gateway to send encrypted traffic between Azure virtual networks over the Microsoft network. A VPN gateway is a specific type of virtual network gateway. Each virtual network can have only one VPN gateway.
-	Virtual Network Peering
  - You can connect virtual networks to each other with virtual network peering. These virtual networks can be in the same region or different regions (also known as global virtual network peering). Once virtual networks are peered, resources in both virtual networks can communicate with each other over a low-latency, high-bandwidth connection using Microsoft backbone network.
-	ExpressRoute
  - ExpressRoute lets you extend your on-premises networks into the Microsoft cloud over a private connection with the help of a connectivity provider. With ExpressRoute, you can establish connections to Microsoft cloud services, such as Microsoft Azure and Microsoft 365.
- Container (Blob) Storage
  - Azure Blob storage is Microsoft's object storage solution for the cloud. Blob storage is optimized for storing massive amounts of unstructured data. Unstructured data is data that doesn't adhere to a particular data model or definition, such as text or binary data.
    **Blob storage is designed for:**
     - Serving images or documents directly to a browser.
     - Storing files for distributed access.
     - Streaming video and audio.
     - Writing to log files.
     - Storing data for backup and restore, disaster recovery, and archiving.
     - Storing data for analysis by an on-premises or Azure-hosted service.
-	Disk Storage
  - Azure Disk Storage is the only shared cloud block storage that supports both Windows and Linux-based clustered or high-availability applications via Azure shared disks. Learn how shared disks enables you to run your mission-critical workloads in Azure.
- File Storage
  - Azure Files is a shared storage service that lets you access files via the Server Message Block (SMB) protocol, and mount file shares on Windows, Linux or Mac machines in the Azure cloud. You can also cache file shares in on-premises Windows Servers using the Azure File Sync agent.
- Storage Tiers
  - Azure offers three storage tiers to store data in blob storage: 
     - Hot Access tier
     - Cool Access tier
     - Archive tier.
     - These tiers target data at different stages of its lifecycle and offer cost-effective storage options for different use cases.
-	Cosmos DB
  - Azure Cosmos DB is a fully managed NoSQL database for modern app development. Single-digit millisecond response times, and automatic and instant scalability, guarantee speed at any scale. Business continuity is assured with SLA-backed availability and enterprise-grade security.
- Azure SQL Database
  - Azure SQL Database is a fully managed platform as a service (PaaS) database engine that handles most of the database management functions such as upgrading, patching, backups, and monitoring without user involvement. Azure SQL Database is always running on the latest stable version of the SQL Server database engine and patched OS.
  - With Azure SQL Database, you can create a highly available and high-performance data storage layer for the applications and solutions in Azure
- Azure Database for MySQL
 - Azure Database for MySQL Single Server is a fully managed database service designed for minimal customization. The single server platform is designed to handle most of the database management functions such as patching, backups, high availability, security with minimal user configuration and control. 
- Azure Database for PostgreSQL
 - Azure Database for PostgreSQL is a fully-managed database as a service with built-in capabilities, such as high availability and intelligence. You can continue to use languages and frameworks of your choice with no upfront costs. Pay only for what you use with reserved capacity pricing now available.
-	SQL Managed Instance
 - Azure SQL Managed Instance is the intelligent, scalable cloud database service that combines the broadest SQL Server database engine compatibility with all the benefits of a fully managed and evergreen platform as a service. 
- Azure Marketplace
  - Azure Marketplace is an online store that contains thousands of IT software applications and services built by industry-leading technology companies. In Azure Marketplace you can find, try, buy, and deploy the software and services you need to build new solutions and manage your cloud infrastructure




# Source

(https://k21academy.com/microsoft-azure/microsoft-azure-core-services-for-beginners/)

(https://www.pragimtech.com/blog/azure/azure-regions-and-paired-regions/)

(https://learn.microsoft.com/en-us/azure/governance/management-groups/overview)

(https://cloud.netapp.com/blog/azure-cvo-blg-azure-container-instance-aci-the-basics-and-a-quick-tutorial)

(https://learn.microsoft.com/en-us/azure/azure-monitor/alerts/alerts-create-new-alert-rule?tabs=metric)

(https://learn.microsoft.com/en-us/azure/virtual-network/tutorial-connect-virtual-networks-portal)

(https://learn.microsoft.com/en-us/azure/expressroute/expressroute-introductionAzure)

(https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blobs-introduction)

(https://azure.microsoft.com/en-in/products/storage/disks/#features)

(https://cloud.netapp.com/blog/storage-tiers-in-azure-blob-storage-find-the-best-for-your-data)

(https://learn.microsoft.com/en-us/azure/azure-sql/database/sql-database-paas-overview?view=azuresql)

(https://learn.microsoft.com/en-us/azure/cosmos-db/introduction)

(https://learn.microsoft.com/en-us/azure/mysql/single-server/single-server-overview)

(https://learn.microsoft.com/en-us/azure/azure-sql/managed-instance/sql-managed-instance-paas-overview?view=azuresql)

