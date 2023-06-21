@description('The name of virtualNetwork to be Created')
param virtual_network_name string

@description('Azure Region in which virtualNetwork to be created.')
param location string

@description('virtualNetwork Address Prefix.')
param vnetAddressPrefix array

@description('Specify the Subnets to be created.')
param subnets array = [ {} ]

@description('Tags for the storageAccount')
param tags object = {}

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2022-07-01' = {
  name: virtual_network_name
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: vnetAddressPrefix
    }
  }
}

resource Subnets 'Microsoft.Network/virtualNetworks/subnets@2022-07-01' = [for subnet in subnets: {
  name: subnet.name
  parent: virtualNetwork
  properties: {
    addressPrefix: subnet.subnetPrefix
  }
}]

output virtual_network object = {
  name: virtualNetwork.name
  id: virtualNetwork.id
}

output subnets array = [for (subnet, i) in subnets: {
  name: Subnets[i].name
  id: Subnets[i].id
}]
