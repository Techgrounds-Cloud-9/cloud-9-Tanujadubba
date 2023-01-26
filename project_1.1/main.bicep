
@description('Azure region where resources should be deployed')
param location string 
param mgmtadminUsername string
@secure()
param mgmtadminPassword string
@description('Unique DNS Name for the Public IP used to access the Virtual Machine.')
param mgmtdnsLabelPrefix string
@description('Username for the Virtual Machine.')
param adminUsername string
@description('Password for the Virtual Machine.')
@minLength(12)
@secure()
param adminPassword string
param vmssName string
@description('Specifies the name of the key vault.')
param keyVaultName string
@description('Specifies the object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. Get it by using Get-AzADUser or Get-AzADServicePrincipal cmdlets.')
param objectId string

targetScope = 'subscription'

// Creating a resource group
resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'project1.1'
  location: location
}

// Creating a storage account

module storage 'storage.bicep' = {
  scope: rg
  name: 'StorageAccount'
   params: {
    location: location
   }
}

// Storage output
output name string = storage.name
output bloburl string = storage.outputs.bloburl
output key string = storage.outputs.name

// Creating ManagmentServer
module mangmentvm 'Managmentserver.bicep'= {
  scope: rg
  name: 'Managmentvm'
  params: {
    location: location
    mgmtadminPassword: mgmtadminPassword
    mgmtadminUsername: mgmtadminUsername
    mgmtdnsLabelPrefix: mgmtdnsLabelPrefix
    storageAccountName: storage.outputs.name
  }
}

// Creating VM sacelset with Application Gateway(Webserver)

module vmscaleset 'webvmapg.bicep'= {
  scope: rg
  name: 'Webvm'
  params: {
    location: location
    adminPassword: adminPassword
    adminUsername: adminUsername
    PublicIpManagmentserver: mangmentvm.outputs.pip
    StorageAccountName: storage.outputs.name
    vmssName:vmssName
  }
}


// Creating peering for webserver vnet(WebVNET)
module webpeering 'vnetpeeringweb.bicep' = {
  scope: rg
  name: 'Webpeering'
  params: {
    existingLocalVirtualNetworkName: vmscaleset.outputs.WebVNET
    existingRemoteVirtualNetworkName: mangmentvm.outputs.WinVNET
    existingRemoteVirtualNetworkResourceGroupName: rg.name
  }
}

// Creating peering for Managmentserver vnet(WinVNET)
module winpeering 'vnetpeeringwindows.bicep' = {
  scope: rg
  name: 'Winpeering'
  params: {
    existingLocalVirtualNetworkName: mangmentvm.outputs.WinVNET
    existingRemoteVirtualNetworkName: vmscaleset.outputs.WebVNET
    existingRemoteVirtualNetworkResourceGroupName: rg.name
  }
}

// Creating a keyvault
module keyvault 'keyvault.bicep' = {
  scope: rg
  name: 'Keyvpr'
  params: {
    location:location
    keyVaultName: keyVaultName
    objectId: objectId
  }
}

// aeb7ca0d-7d4b-4fb6-b0ae-c1239393719e


/*
// Creating Disk encryption for windows Vm(Managmentserver)
module Diskenwind 'Diskencrymangment.bicep' = {
  scope: rg
  name: 'Diskencrywin'
  params:{
    location:location
   keyVaultName:keyVaultName
   vmName:mangmentvm.name
 }
}
*/
  
  
  

