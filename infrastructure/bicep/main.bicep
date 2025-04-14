param name string = 'blogapp'
param location string = resourceGroup().location

resource postgres 'Microsoft.DBforPostgreSQL/flexibleServers@2022-12-01' = {
  name: '${name}-pg'
  location: location
  properties: {
    administratorLogin: 'adminuser'
    administratorLoginPassword: 'SenhaSegura123!'  // ou use Key Vault
    version: '14'
    storage: { storageSizeGB: 32 }
    sku: {
      name: 'Standard_B1ms'
      tier: 'Burstable'
      capacity: 1
    }
  }
}

resource containerAppEnv 'Microsoft.App/managedEnvironments@2023-05-01' = {
  name: '${name}-env'
  location: location
  properties: {
    daprAIInstrumentationKey: ''
  }
}

resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: '${name}-api'
  location: location
  properties: {
    managedEnvironmentId: containerAppEnv.id
    configuration: {
      secrets: [
        {
          name: 'pg-conn'
          value: 'postgresql://adminuser:SenhaSegura123!@${postgres.name}.postgres.database.azure.com/blogdb'
        }
      ]
      activeRevisionsMode: 'Multiple'
    }
    template: {
      containers: [
        {
          name: 'blog-api'
          image: 'docker.io/SEU_USUARIO/blog-api:latest'
          env: [
            {
              name: 'DATABASE_URL'
              secretRef: 'pg-conn'
            }
          ]
        }
      ]
    }
  }
}

