# Deploy an Azure AKS cluster with Enforcer

These Terraform templates will deploy an Azure AKS cluster with Enforcer installed and connected to the Prisma Cloud Console.



## Prequisites:
1. Create a new microsegmentation namespace

2. Create a cloud auto-registration policy on Prisma Cloud Console
    - Navigate to the namespace where you will deploy the Enforcer
    - Go to Network Security -> Namespaces -> Authorizations
    - click on the "+" sign and create a cloud auto-registration policy
    - Under "Auto-registration":
        - For Cloud Provider, choose Azure
        - For Claims, enter the key=value pair:
            - "identity=<Your_Cluster_Name>-agentpool"
            - e.g. if you cluster name is "mycluster", then it is "identity=mycluster-agentpool"


3. Terraform v1.0 and above

4. SSH key pair

5. Install Azure CLI
    - https://docs.microsoft.com/en-us/cli/azure/install-azure-cli

6. Install kubectl
    - https://kubernetes.io/docs/tasks/tools/



## Deployment
1. Run "az login" to login to Azure

2. Update the "terraform.tfvars" file with the necessary information.

3. Run "terraform init"

4. Run "terraform apply"

5. Azure AKS cluster will be deployed. It takes about 10-15 minutes for it to be fully ready.
    - Go to Network Security -> Agent -> Enforcers to check that the Enforcer is connected to the Console

6. The kubeconfig file will be in the same directory where you run the Terraform commands.

7. Run "kubectl --kubeconfig kubeconfig get nodes" to list the nodes in the AKS cluster.

8. Run "kubectl --kubeconfig kubeconfig get all -n aporeto" to list the microsegmentation pods and service.



## Removing The Demo Environment

1. Run "terraform destroy"



## Note
1.  If you only want to deploy the AKS cluster without deploying Enforcers, rename the "enforcer.tf" file to "enforcer.tf.bak"

2.  The enforcerd.tf file is based on the enforcerd yaml file from https://github.com/aporeto-se/aporeto-k8s-enforcerd-builder
