@description('Admin username for the backend servers')
param adminUsername string

@description('Password for the admin account on the backend servers')
@secure()
param adminPassword string
@description('String used as a base for naming resources. Must be 3-61 characters in length and globally unique across Azure. A hash is prepended to this string for some resources, and resource-specific information is appended.')
@minLength(3)
@maxLength(61)
param vmssName string
@description('Location for all resources.')
param location string = resourceGroup().location
@description('Size of the virtual machine.')
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
@description('Publicip of windowsserver')
param PublicIpManagmentserver string
@description('storage account Name')
param StorageAccountName string
var vmScaleSetName = toLower(substring('${vmssName}${uniqueString(resourceGroup().id)}', 0, 9))
var longvmScaleSet = toLower(vmssName)
var vNetName = 'WebVNET'
var ipConfigName = 'Webipconfig'
var publicIPAddressName = 'Webpip'
var publicIPAddressID = publicIPAddress.id
var networkSecurityGroupNamevar = 'WebNSG'
var nicName = 'Webnic'
var subnetName = 'Websubnet'
var backendsubnetName= 'backsubnet'
var applicationGateWayName = 'myAppGateway'
var virtualNetworkPrefix = '10.10.0.0/16'
var subnetPrefix = '10.10.0.0/24'
var backendSubnetPrefix = '10.10.128.0/24'

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
          sourceAddressPrefix: PublicIpManagmentserver
          //sourceAddressPrefix: '*'
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
resource vNet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: vNetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        virtualNetworkPrefix
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetPrefix
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          networkSecurityGroup:{
            id: networkSecurityGroupName.id
          }
        }
      }
      {
        name: backendsubnetName
        properties: {
          addressPrefix: backendSubnetPrefix
          privateEndpointNetworkPolicies: 'Enabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
      }
    ]
    enableDdosProtection: false
    enableVmProtection: false
  }
  dependsOn:[
    networkSecurityGroupName
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
    automaticRepairsPolicy: {
      enabled: true
      gracePeriod: 'PT10M'
      //repairAction: 'Replace'
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
                      id: resourceId('Microsoft.Network/virtualNetworks/subnets/',vNetName,subnetName)
                      //id: vNet.properties.subnets[0].id
                    }
                    applicationGatewayBackendAddressPools: [
                      {
                        id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools/',applicationGateWayName ,'myBackendPool' )
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
          {
            name: 'healthChecker'
            properties:{
              publisher:'Microsoft.ManagedServices'
              type: 'ApplicationHealthLinux'
              autoUpgradeMinorVersion:true
              typeHandlerVersion: '1.0'
              settings:{
                protocol: 'tcp'
                port: 80
                //requestpath: '/health'
                //path: '/'
              }
            }
          } 
           ]
      }
    }
    
  }
  
  dependsOn: [
    applicationGateWay
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
resource applicationGateWay 'Microsoft.Network/applicationGateways@2021-05-01' = {
  name: applicationGateWayName
  location: location
  properties: {
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'
    }
    gatewayIPConfigurations: [
      {
        name: 'appGatewayIpConfig'
        properties: {
          subnet: {
            id: resourceId('Microsoft.Network/virtualNetworks/subnets', vNetName, backendsubnetName)
          }
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'appGwPublicFrontendIp'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddressID
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'port_80'
        properties: {
          port: 80
        }
      }
    ]
    backendAddressPools: [
      {
        name: 'myBackendPool'
        properties: {}
      }
    ]
    backendHttpSettingsCollection: [
      {
        name: 'myHTTPSetting'
        properties: {
          port: 80
          protocol: 'Http'
          cookieBasedAffinity: 'Disabled'
          pickHostNameFromBackendAddress: false
          requestTimeout: 20
          
        }
      }
    ]
    httpListeners: [
      {
        name: 'myListener'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations', applicationGateWayName, 'appGwPublicFrontendIp')
          }
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts', applicationGateWayName, 'port_80')
          }
          protocol: 'Http'
          requireServerNameIndication: false
        }
      }
    ]
    requestRoutingRules: [
      {
        name: 'myRoutingRule'
        properties: {
          ruleType: 'Basic'
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', applicationGateWayName, 'myListener')
          }
          backendAddressPool: {
            id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools', applicationGateWayName, 'myBackendPool')
          }
          backendHttpSettings: {
            id: resourceId('Microsoft.Network/applicationGateways/backendHttpSettingsCollection', applicationGateWayName, 'myHTTPSetting')
          }
        }
       }
     ]
    enableHttp2: false
    autoscaleConfiguration: {
      minCapacity: 1
      maxCapacity: 2
  }
  probes: [
    {
      name: 'Web_probe'
      properties: {
        protocol: healthprobeprotocol
        port: healthprobeprot
        path: '/'
        interval: 10
        timeout: 10
        host: applicationGateWayName
        unhealthyThreshold: 3
        match: {
          statusCodes: [
            '200'
          ]
        }
        
      }
    }
  ]
  }
dependsOn: [
  vNet
  publicIPAddress
]
}
output applicationUrl string = uri('http://${publicIPAddress.properties.dnsSettings.fqdn}', '/MyApp')
output WebVNET string = vNet.name
output vmScaleSetName string = vmssName
