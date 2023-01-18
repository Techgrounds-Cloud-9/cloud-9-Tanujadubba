@description('String used as a base for naming resources. Must be 3-61 characters in length and globally unique across Azure. A hash is prepended to this string for some resources, and resource-specific information is appended.')
@minLength(3)
@maxLength(61)
param vmssName string

@description('Size of VMs in the VM Scale Set.')
param vmSku string = 'Standard_B2ms'

@description('The Ubuntu version for the VM. This will pick a fully patched image of this given Ubuntu version. Allowed values: 18.04-LTS, 16.04.0-LTS, 14.04.5-LTS.')
param ubuntuOSVersion string = '18.04-LTS'

@description('Number of VM instances')
@minValue(1)
@maxValue(3)
param instanceCount int = 1
@description('Http port healthprobe')
param healthprobeprot int = 80
@description('Health extension to probe app')
param healthprobeprotocol string = 'http'

@description('Admin username on all VMs.')
param adminUsername string = 'vmstanu'

@description('Admin password on all VMs.')
@secure()
param adminPassword string
@description('storage account Name')
param StorageAccountName string
@description('Location for all resources.')
param location string = resourceGroup().location
var vmScaleSetName = toLower(substring('${vmssName}${uniqueString(resourceGroup().id)}', 0, 9))
var longvmScaleSet = toLower(vmssName)
var addressPrefix = '10.10.10.0/24'
var subnetPrefix = '10.10.10.0/25'
var networkSecurityGroupNamevar = 'Web-NSG'
var vNetName = '${vmScaleSetName}vnet'
var publicIPAddressName = '${vmScaleSetName}pip'
var subnetName = '${vmScaleSetName}subnet'
var loadBalancerName = '${vmScaleSetName}lb'
var publicIPAddressID = publicIPAddress.id
//var lbProbeID = resourceId('Microsoft.Network/loadBalancers/probes', loadBalancerName, 'tcpProbe')
var natPoolName = '${vmScaleSetName}natpool'
var bePoolName = '${vmScaleSetName}bepool'
var probeName = '${vmScaleSetName}probe'
var lbPoolID = resourceId('Microsoft.Network/loadBalancers/backendAddressPools', loadBalancerName, bePoolName)
var natStartPort = 50000
var natEndPort = 50119
var natBackendPort = 22
var nicName = '${vmScaleSetName}nic'
var ipConfigName = '${vmScaleSetName}ipconfig'
var osType = {
  publisher: 'Canonical'
  offer: 'Ubuntuserver'
  sku: ubuntuOSVersion
    version: 'latest'
}
var imageReference = osType
resource networkSecurityGroupName 'Microsoft.Network/networkSecurityGroups@2020-05-01' = {
  name: networkSecurityGroupNamevar
  location: location
  properties: {
    securityRules: [
      {
        name: 'default-allow-22'
        properties: {
          priority: 500
          access: 'Allow'
          direction: 'Inbound'
          destinationPortRange: '22'
          protocol: 'Tcp'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
        }
      }
      {
        name: 'default-allow-443'
        properties: {
          priority: 300
          access: 'Allow'
          direction: 'Inbound'
          destinationPortRange: '443'
          protocol: 'Tcp'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
        }
      }
      {
        name: 'default-allow-80'
        properties: {
          priority: 400
          access: 'Allow'
          direction: 'Inbound'
          destinationPortRange: '80'
          protocol: 'Tcp'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
  dependsOn: [
    loadBalancer
  ]
}
resource vNet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: vNetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        addressPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
          networkSecurityGroup:{
            id:networkSecurityGroupName.id
          }

        }
      }
    ]
  }
  dependsOn: [
    networkSecurityGroupName
  ]
}
resource publicIPAddress 'Microsoft.Network/publicIPAddresses@2021-05-01' = {
  name: publicIPAddressName
  location: location
  properties: {
    publicIPAllocationMethod: 'Static'
    dnsSettings: {
      domainNameLabel: longvmScaleSet
    }
  }
  sku: {
    name: 'Standard'
  } 
    zones:[
      '2'
    ]
  }
resource loadBalancer 'Microsoft.Network/loadBalancers@2021-05-01' = {
  name: loadBalancerName
  location: location
  sku: {
    name: 'Standard'
  }
    properties: {
    frontendIPConfigurations: [
      {
        name: 'LoadBalancerFrontEnd'
        properties: {
          publicIPAddress: {
            id: publicIPAddressID
          }
        }
      }
    ]
    backendAddressPools: [
      {
        name: bePoolName
      }
    ]
    inboundNatPools: [
      {
        name: natPoolName
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/loadBalancers/frontendIPConfigurations', loadBalancerName, 'loadBalancerFrontEnd')
          }
          protocol: 'Tcp'
          frontendPortRangeStart: natStartPort
          frontendPortRangeEnd: natEndPort
          backendPort: natBackendPort
        }
      }
    ]
    loadBalancingRules: [
      {
        name: 'Httprule'
        properties: {
          loadDistribution: 'Default'
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/loadBalancers/frontendIPConfigurations', loadBalancerName, 'loadBalancerFrontEnd')
          }
          backendAddressPool: {
            id: lbPoolID
          }
          protocol: 'Tcp'
          frontendPort: 80
          backendPort: 80
          enableFloatingIP: false
          idleTimeoutInMinutes: 5
          probe: {
            id: resourceId('Microsoft.Network/loadBalancers/probes/', loadBalancerName, probeName)
          }
        }
      }
    ]
    
    probes: [
      {
        name: probeName
        properties: {
          protocol: healthprobeprotocol
          port: healthprobeprot
          requestPath: '/'
          intervalInSeconds: 5
          numberOfProbes: 2
        }
      }
    ]
  }
  dependsOn: [
    publicIPAddress
  ]
}

resource vmScaleSet 'Microsoft.Compute/virtualMachineScaleSets@2021-11-01' = {
  name: vmScaleSetName
  location: location
  zones:['2']
  sku: {
    name: vmSku
    tier: 'Standard'
    capacity: instanceCount
  }
        properties: {
    overprovision: true
    upgradePolicy: {
      mode: 'Manual'
    }
    virtualMachineProfile: {
      storageProfile: {
        osDisk: {
          caching: 'ReadWrite'
          createOption: 'FromImage'
        }
        imageReference: imageReference
      }
      osProfile: {
        computerNamePrefix: vmScaleSetName
        adminUsername: adminUsername
        adminPassword: adminPassword
      }
      networkProfile: {
        healthProbe: {
         id: resourceId('Microsft.Network/loadBalancers/probes/', loadBalancerName, probeName)
        }
        networkInterfaceConfigurations: [
          {
            name: nicName
            properties: {
              primary: true
              ipConfigurations: [
                {
                  name: ipConfigName
                  properties: {
                    subnet: {
                      id: vNet.properties.subnets[0].id
                    }
                    loadBalancerBackendAddressPools: [
                      {
                        id: lbPoolID
                      }
                    ]
                    loadBalancerInboundNatPools:[
                      {
                      id: resourceId('Microsoft.Network/loadBalancers/inboundNatpools/', loadBalancerName, natPoolName) 
                      }
                    ] 

                  }
                }
              ]
              networkSecurityGroup: {
                id: networkSecurityGroupName.id
              }
            }
          }
        ]
      }
      
      extensionProfile: {
        extensions: [
          {
            
            name: 'scriptExtension'
            properties: {
              publisher: 'Microsoft.Azure.Extensions'
              type: 'CustomScript'
              typeHandlerVersion: '2.1'
              autoUpgradeMinorVersion: true
              settings: {
                skipDos2Unix: false
                fileUris: [
                  //'https://gist.githubusercontent.com/daveRendon/72986871085786d04d0cdc2b1065355b/raw/34b2a4b5e05dc32f695c8236c89a2c62ce6213ca/install_apache.sh'
                  'https://mystrpr1.blob.core.windows.net/data/installapache.sh'
                ]
              }
              protectedSettings: {
                storageAccountName : StorageAccountName
                storageAccountKey : listKeys(resourceId('Microsoft.Storage/storageAccounts', StorageAccountName), '2022-05-01').keys[0].value
                commandToExecute: 'sh installapache.sh'
                //commandToExecute: 'sh install_apache.sh'
                
              }
            }
          }
          
        ]
      }
    }
  }
  dependsOn: [
    loadBalancer
    vNet
  ]
}

resource autoscalehost 'Microsoft.Insights/autoscalesettings@2021-05-01-preview' = {
  name: 'autoscalehost'
  location: location
  properties: {
    name: 'autoscalehost'
    targetResourceUri: vmScaleSet.id
    enabled: true
    profiles: [
      {
        name: 'Profile1'
        capacity: {
          minimum: '1'
          maximum: '3'
          default: '1'
        }
        rules: [
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricResourceUri: vmScaleSet.id
              timeGrain: 'PT1M'
              statistic: 'Average'
              timeWindow: 'PT5M'
              timeAggregation: 'Average'
              operator: 'GreaterThan'
              threshold: 50
            }
            scaleAction: {
              direction: 'Increase'
              type: 'ChangeCount'
              value: '1'
              cooldown: 'PT2M'
            }
          }
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricResourceUri: vmScaleSet.id
              timeGrain: 'PT1M'
              statistic: 'Average'
              timeWindow: 'PT5M'
              timeAggregation: 'Average'
              operator: 'LessThan'
              threshold: 30
            }
            scaleAction: {
              direction: 'Decrease'
              type: 'ChangeCount'
              value: '1'
              cooldown: 'PT5M'
            }
          }
        ]
      }
    ]
  }
}

output applicationUrl string = uri('http://${publicIPAddress.properties.dnsSettings.fqdn}', '/MyApp')
