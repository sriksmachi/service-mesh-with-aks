AksResourceGroup='sm-aks-rg'
AksClusterName='sm-cluster'
NodeVmSize='standard_b2s'
MinimumNodeCount=1
MaxNodeCount=1
SubscriptionId='925a5ad8-a21a-48c0-92a2-5a8a2a4dfc46'
location='eastus'

# login and set context
# az login 
az account set --subscription $SubscriptionId

# create RG and Cluster
az group create --name $AksResourceGroup --location $location

az aks create `
       --resource-group $AksResourceGroup `
       --name $AksClusterName `
       --enable-managed-identity `
       --vm-set-type VirtualMachineScaleSets `
       --node-vm-size $NodeVmSize  `
       --generate-ssh-keys

az aks enable-addons `
       --resource-group $AksResourceGroup `
       --name $AksClusterName `
       --addons open-service-mesh

az aks get-credentials --name $AksClusterName --resource-group $AksResourceGroup --admin --overwrite-existing






