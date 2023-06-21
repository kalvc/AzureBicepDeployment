using './vnet.bicep'

param virtual_network_name = ''
param location = ''
param vnetAddressPrefix = []
param subnets = [
  {}
]
param tags = {}

