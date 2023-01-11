param vmName string = ''
param keyVaultName string = ''
param keyVaultResourceGroup string = ''
//param keyEncryptionKeyURL string = ''
param location string = resourceGroup().location
var extensionName = 'AzureDiskEncryption'
var keyVaultResourceID = resourceId(keyVaultResourceGroup, 'Microsoft.KeyVault/vaults/', keyVaultName)
resource DiskEncryption 'Microsoft.Compute/virtualMachines/extensions@2022-08-01' = {
  name: '${vmName}/${extensionName}'
  location: location
  properties: {
    publisher: 'Microsoft.Azure.Security'
    type: 'AzureDiskEncryptionForLinux'
    typeHandlerVersion: '1.1'
    autoUpgradeMinorVersion: true
    //forceUpdateTag: '1.0'
    settings: {
      EncryptionOperation: 'EnableEncryption'
      KeyVaultURL: reference(keyVaultResourceID, '2021-11-01-preview').vaultUri
      KeyVaultResourceId: keyVaultResourceID
      //KeyEncryptionKeyURL: keyEncryptionKeyURL
      //KekVaultResourceId: keyVaultResourceID
      KeyEncryptionAlgorithm: 'RSA-OAEP'
      VolumeType: 'All'
      ResizeOSDisk: false
    }
  }
}
