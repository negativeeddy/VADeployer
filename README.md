# Virtual Assistant Deployer

This project provides a docker container definition that allows deployment of a [Virtual Assistant](https://microsoft.github.io/botframework-solutions/overview/virtual-assistant-solution/)  without having to install all the dev tool dependencies.

## Things you need first 

1. An [Azure](https://azure.microsoft.com/) subscription 
2. [Visual Studio Code](https://code.visualstudio.com/)*
3. [Docker](https://www.docker.com/get-started)
4. [Luis authoring key](https://www.luis.ai/user/settings)
5. Bot name – all lower case no spaces
6. A Bot password – 16 char, needs upper, lower and special chars

\* Visual Studio Code is not strictly required. You can follow the instructions below by creating the container yourself and using an interactive Docker session, but VS Code provides a simple way to automatically build, run, and attach to the container. It also allows for easy browsing, editing and updating of the deployed code.

## Install instructions

1.	Clone https://github.com/negativeeddy/VADeployer
2.	Open the cloned folder in Visual Studio Code 
3.	Click "Reopen in Container" when the below pop up appears in the bottom right corner of the screen. 
   
   ![Container prompt](docs/CodeReopenInContainer.png)
   
    If this pop up doesn't appear, check to see if your have the correct "Shared Drive" is selected.
    To get this this setting:
      a. Right click on the Docker icon on the taskbar and click "Settings".
      b. Click on "Shared Drives".
      c. Select the correct drive.
    
4.	Create a terminal in VS Code and run the following commands

![Container prompt](docs/VSCodeMenuNewTerminal.png)

5. Log into Azure using the command line
 ````
     az login
 ```` 
6. A new window should open. Follow instructions to login
    * the instructions give you a link and a code. Browse to the specified link and enter the code
        
7. [OPTIONAL] If you have multiple subscriptions, you can set which subscription to use by running
 ````
     az account set -s "<subscription name or id>"
 ````
8. Run the the following deployment script
````
    ./deploy.ps1 -botName <BOTNAME> -botAppPassword <BOTPASSWORD>  -luisAuthoringKey <LUISAUTHKEY>
````

"botName" will be the name of your new Resource Group. 

![Container prompt](docs/deployoutput.png)

## How to talk to your assistant
1. Open the Azure portal and navigate to the Resource Group that has the name of your bot
2. Open the Web App Bot resource
3. Select the Test in Web Chat tab
4. Chat with your bot! 
NOTE: the first time you open the tab it may take a minute as the entire app needs to start up for the first time

## How to delete you assistant
1. Delete the Azure resource group
2. In the LUIS portal (https://luis.ai), delete the two LUIS apps named for your bot. There should be one marked General and one marked Dispatch.

# Additional Notes
The Virtual Assistant deployed is based on [Virtual Assistant Template v4.6.0.1](https://marketplace.visualstudio.com/items?itemName=BotBuilder.VirtualAssistantTemplate)

## Azure regions
This will deploy a virtual assistant to the WestUS Azure region by default and also assumes your LUIS authoring key is in the westus. If you wish to deploy to a different region and/or your LUIS key is not in westus, the deploy.ps1 script has additional parameters to override the defaults.

## Azure SKUs
By default the deployment will generate Azure SKUs that are typical of a real deployment (e.g. the App Service will be S1 Standard). If you wish to minimize the cost (e.g. just for quick demo purposes) you can specify the ````-minimalCost```` flag which will change many of the resources to the free/lower-cost versions.
````
    ./deploy.ps1 -minimalCost -botName <BOTNAME> -botAppPassword <BOTPASSWORD>  -luisAuthoringKey <LUISAUTHKEY>
````
**Warning** When using this flag you will see some side effects due to using the lower tier SKUs
* You may hit the rate & transaction limits of the various free service tiers when a team is actively developing a bot.
* You can not have more than one free search service in a subscription
* The free tier of app service plans will always shut down after a period inactivity. This will cause a significant delay in the first response after the inactivity.
