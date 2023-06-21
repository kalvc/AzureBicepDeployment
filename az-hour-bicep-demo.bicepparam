using './az-hour-bicep-demo.bicep'

param name= uniqueString('')
param location=toUpper('westus')
param sqlname='test'

param administratorLogin='user123ddf'
param administratorLoginPassword= readEnvironmentVariable('AdminPassword')
param counter=string(readEnvironmentVariable('Counter'))
//param sqladminpassword= getSecret()
