# Virtual Assistant Deployer

This project provides a docker container definition that allows deployment of a Virtual Assistant without having to install all the dev tool dependencies.

Things you need first 
1. An Azure subscription 
2. Visual Studio Code
3. Docker
4. Luis authoring key
5. Bot name – all lower case no spaces
6. A Bot password – 16 char, needs upper, lower and special chars
 
Install instructions
1.	Clone https://github.com/negativeeddy/VADeployer
2.	Open the cloned folder in Visual Studio Code 
3.	Click Reopen in Container when this pops up 
   
   ![Container prompt](CodeReopenInContainer.png)
 
4.	Create a terminal in VS Code and run the following commands
5. Log in to the Azure command line
 ````
     az login
 ```` 
6. Follow instructions to login
        
7. [OPTIONAL] If multiple subscriptions you can set which subscription to use by running
 ````
     az account set -s "<subscription name or id>"
 ````
8. change to the MyAssistant project directory
 ````
     cd ./MyAssistant/MyAssistant
 ````
9. run the deployment script
````
    ./Deployment/Scripts/deploy.ps1 -name <BOTNAME> -appPassword <BOTPASSWORD> -luisAuthoringRegion westus -luisAuthoringKey <LUISAUTHKEY> -location westus
````

The Virtual Assistant deployed is based on Virtual Assistant Template v4.6.0.1
