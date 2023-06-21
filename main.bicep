targetScope = 'subscription'

param location string = 'EastUS'
param project string = 'Demo'
param tags object = {
  Owner: 'Vishal'
  Project: 'Bicep-Demo'
}

module networking './Infra/hubVnet.bicep' = {
  name: 'hub-vnet-demo'
  params: {
    project: project
    location: location
    tags: tags
    vnetAddressPrefix: [
      '192.168.1.0/24'
    ]
    subnets: [
      {
        name: 'Default'
        subnetPrefix: '192.168.1.0/24'
      }
    ]
  }
}

module spoke_vnet './Infra/spokevnet.bicep' {

}
