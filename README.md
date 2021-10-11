# IBM-vsi-terraform

This Terraform project provide an example for a simple Virtual Provate Cloud (VPC) example with one virtual mashine. It based on IBM Cloud (cloud.ibm.com) with Infrastructure as Code (IaC). You can use the Terraform example native with Comand line, or use the [IBM Cloud Schematics](https://cloud.ibm.com/schematics/overview) solution without local installation.

If you have no IBM Cloud Account, please start with following pre-requsit:

## Pre-requisit:
1. Setup an [IBM Cloud Account](https://cloud.IBM.com/)
2. The IBM Cloud user name from your profile. This information is available in Cloud Account. Use Menue > Manage > Access (IAM) > Users. In User Detail section under VPN Password is the User name available.
3. The IBM Classic infrastructure API key is also availabe in the user section.
4. define a [Ressource Group in IAM](https://cloud.ibm.com/account/resource-groups/) like: veeam-os365. This ressource group will automatic defined in cos.tf
5. define an [IBM Cloud API key:](https://cloud.ibm.com/iam/apikeys/)

Using the **IBM Schematics** service, it is **not** necessary to install Terraform, CLI on you local mashine. You can use it integrated in IBM Cloud Web GUI. A workspace can be added in Schematics with direct connection to GitHuB to access the Terrform definition.

If you have logon into IBM Cloud Account, switch to [Schematics](https://cloud.ibm.com/schematics/overview) and define your Workspace. Therfore you have define the Workspace name, use your Resource group and add the GitHub URL like https://github.com/JoachimFischer/IBM-vsi-terraform

Now push the button *"Retrieve input variables"* to add your API key and the stored SSH name. The information about your API key are available in IAM menue under API Key for classic infrastructure. Now you can creat the workspace.


After adding the variable values, use the button of Terraform function. At first push the button *"Generate plan"*. If this is finalized with no error you can *"Apply plan"*. In this step the installation of the ressources are realized. During the activities you can follow the log view.

With the  IBM-vsi-Terraform example, you can deploy following architecture:
1. using classic infrastructure in FRA02 with one Public and one Private VLAN
2. please select the VLAN-ID you want to use. Therefore open Classic Infrastructure > Network > IP Management > VLANs and select public / private VLAN. The responding VLAN-ID is visible in URL from selected VLAN number.
3. you can select possible server flavors. Therefor use following CLI comand in [Cloud Shell](https://cloud.ibm.com/shell) from GUI: ``$ibmcloud sl vs options``


After the infrastructure is deployed you can test it. Logon into the server: ``$ssh root@server-ip``

<img src="https://github.com/JoachimFischer/IBM-vsi-terraform/blob/master/Images/veeam-os365.png" width="700">

It is only possible to access the server via Remote Desktop. Therefore only port 3389 and ping is allowed.

A COS Instance and Bucket is defined for Region EU-DE with storage class SMART.

## Change VSI flavors
With IBM Schematics, it is very easy to switch between VSI flavours. So, please validate the list via [Cloud Shell](https://cloud.ibm.com/shell): 
``$ibmcloud sl vs options``

The default flavor is: ``BL1_4X16X100``

It is also possible to get the information of available images out of Cloud CLI with following comand: 
``$ibmcloud is images``   
The dafault flavor is ``WIN_LATEST_64``

The variables.tf contain the mapping information.


## Additional Documentation Provided with Useful links for Terraform and IBM CLoud 
- [Terraform Documentation](https://www.terraform.io/docs/index.html)
- [The IBM Cloud Provider for Terraform Documentation](https://ibm-cloud.github.io/tf-ibm-docs/index.html)

