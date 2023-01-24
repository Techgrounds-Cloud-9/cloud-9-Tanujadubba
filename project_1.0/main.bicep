//@description('Name of the blob as it is stored in the blob container')
//param filename string = 'installapache.sh'

//@description('Name of the blob container')
//param containerName string = 'data'

@description('Azure region where resources should be deployed')
param location string 

@description('Desired name of the storage account')
param storageAccountName string = 'mystrpr1'
@description('Username for the Virtual Machine.')
param adminUsername string
@description('Password for the Virtual Machine.')
@minLength(12)
@secure()
param adminPassword string
//@description('Unique DNS Name for the Public IP used to access the Virtual Machine.')
//param dnsLabelPrefix string 
@description('SSH Key or password for the Virtual Machine. SSH key is recommended.')
@secure()
param adminPasswordOrKey string
@description('Unique DNS Name for the Public IP used to access the Virtual Machine.')
param dnsNameForPublicIP string
@description('Specifies the name of the key vault.')
param keyVaultName string
@description('Specifies the object ID of a user, service principal or security group in the Azure Active Directory tenant for the vault. The object ID must be unique for the list of access policies. Get it by using Get-AzADUser or Get-AzADServicePrincipal cmdlets.')
param objectId string
//@description('publicip of managmentserver')
//param publicipmanagmentserver string
//@description('Set the local VNet name')
//param existingLocalVirtualNetworkName string

//@description('Set the remote VNet name')
//param existingRemoteVirtualNetworkName string

targetScope = 'subscription'


resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'project1.0'
  location: location
}

// Creating a Storage account 
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


// Creating a ManagmentServer
module managmentserver 'managmentserver.bicep' = {
  scope: rg
  name: 'WinVM'
  params: {
    location: location
    adminPassword: adminPassword
    adminUsername: adminUsername
    dnsLabelPrefix: 
    //storageAccountName: storage.outputs.name
 }
}

// Creating a WebServer
module webserver 'webserver.bicep' = {
  scope: rg
  name: 'WebVM'
  params: {
    location: location
    adminPasswordOrKey: adminPasswordOrKey
    adminUsername: adminUsername
    bloburl: storage.outputs.bloburl
    dnsNameForPublicIP: dnsNameForPublicIP
    StorageAccountName: storageAccountName
    //publicipmgmtserver: managmentserver.outputs.pip
  }
}

 //VNET peering of Webserver
module webpeering 'vnetpeering.bicep' = {
  scope: rg
  name: 'Webpeer'
  params: {
    existingLocalVirtualNetworkName: webserver.outputs.WebVNET
    existingRemoteVirtualNetworkName: managmentserver.outputs.WinVNET
    existingRemoteVirtualNetworkResourceGroupName: rg.name
  }
}
  
//VNET Peering of Managmentserver
module managpeering 'vnetpeeringManag.bicep' = {
  scope: rg
 name: 'Manpeer'
  params: {
   existingLocalVirtualNetworkName: managmentserver.outputs.WinVNET
    existingRemoteVirtualNetworkName: webserver.outputs.WebVNET
    existingRemoteVirtualNetworkResourceGroupName: rg.name
  }
}

// Creating backup and recovery of webserver
module backuprecovery 'backupandrecovery.bicep' = {
  scope: rg
  name: 'backuprecoveryweb'
  params: {
    vmName :webserver.name
    location: location
  }
}

// Creating Keyvault
module keyVault 'key_vault.bicep' = {
  scope: rg
  name: 'KeyVFortech'
  params: {
    location: location
    keyVaultName: keyVaultName
    objectId: objectId
  }
}
/*
// Creating Diskencryption for Linux
module Diskencrptlinux 'DiskencryptionLinux.bicep' = {
  scope: rg
  name: 'DiskencrypLinux'
  params: {
    location: location
    vmName: webserver.name
  }
    dependsOn : [
      keyVault 
      
    ]
  }
*/

// Creating Diskencryption for Windowsvm
/*
module Diskencryptwind 'Diskencryptionwind.bicep'= {
  scope: rg
  name: 'DiskencryptWind'
  params: {
    location: location
    vmName: managmentserver.name
  }
  dependsOn: [
    keyVault
  ]
} 
*/
