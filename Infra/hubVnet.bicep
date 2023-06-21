targetScope = 'subscription'

param location string
param project string
param tags object
param vnetAddressPrefix array
param subnets array

var resource_group_name = toUpper('RG-${project}-${location}')
var virtual_network_name = toUpper('VNET-${project}-${location}')
var defaultTags = union(tags, { ResourceType: 'Hub-virtualNetwork' })


resource resourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resource_group_name
  location: location
  tags: defaultTags
}

module virtualNetwork '../modules/vnet.bicep' = {
  scope: resourceGroup
  name: 'vnet'
  params: {
    virtual_network_name: virtual_network_name
    location: location
    tags: defaultTags
    vnetAddressPrefix: vnetAddressPrefix
    subnets: subnets
  }
}

output vnet_details object = virtualNetwork.outputs.virtual_network
output subnet_details array = virtualNetwork.outputs.subnets
