param location string = deployment().location
targetScope = 'subscription'

resource newRg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'nextjsdemo'
  location: location
}

module app 'app/app.bicep' = {
  name: 'app-deploy'
  scope:newRg
  params: {
    appname: 'nextdemoapp'
    location: newRg.location
  }
}

module db 'mysql/db.bicep' = {
  name: 'db-deploy'
  scope: newRg
  params: {
    serverName: 'nextdemodbserver'
    location: newRg.location
    administratorLogin: 'theallhigh'
    administratorLoginPassword: '1234567'
  }
}

