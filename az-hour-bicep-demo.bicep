param name string
param location string
param administratorLogin string
param counter string

@secure()
param administratorLoginPassword string

param sqlname string

// https://docs.microsoft.com/en-us/azure/templates/microsoft.sql/servers?tabs=bicep
resource sqlServer 'Microsoft.Sql/servers@2021-11-01' = {
  name: 'sqlserver${name}-${sqlname}'
  location: location
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
    minimalTlsVersion: '1.2'
    version: '12.0'
  }
  tags: {
    GeneratedBy: 'Bicep_test'
    Units: counter
    name: name
  }
}

// https://docs.microsoft.com/en-us/azure/templates/microsoft.sql/servers/firewallrules?tabs=bicep
resource sqlFirewallRuleAzure 'Microsoft.Sql/servers/firewallRules@2021-11-01-preview' = {
  parent: sqlServer
  name: 'AzureAccess'
  properties: {
    endIpAddress: '0.0.0.0'
    startIpAddress: '0.0.0.0'
  }
}

output id string = sqlServer.id
