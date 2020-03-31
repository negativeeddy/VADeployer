# Virtual Assistant Deployer

This project provides a docker container definition that allows deployment of a [Virtual Assistant](https://microsoft.github.io/botframework-solutions/overview/virtual-assistant-solution/)  without having to install all the dev tool dependencies on your local machine.

## Deploying your Virtual Assistant
There are two options to quickly getting your Virtual Assistant up and running.
* [Install with Visual Studio Online](docs/visualstudioonline.md) - This is the easiest and simplest and will all happen online. The only thing you need is an Azure Subscription.
* [Install with Visual Studio Code locally](docs/visualstudiocode.md) - This option uses your locally installed VS Code and Docker to do the work.

## How to talk to your assistant
After you have deployed the Virtual Assistant, you can test out!
1. Open the Azure portal and navigate to the Resource Group that has the name of your bot
2. Open the Web App Bot resource
3. Select the Test in Web Chat tab
4. Chat with your bot! 
NOTE: the first time you open the tab it may take a few moments as the entire app needs to start up for the first time

## How to delete you assistant
When you are done with your assistant
1. Delete the Azure resource group
2. Delete the application from Azure Active Directory. It has the same name as your bot.

# Additional Notes
The Virtual Assistant deployer clones the [Bot Framework Solutions repo](https://github.com/microsoft/botframework-solutions) when you start it up. So your assistant will be based on the latest version of the sample assistant.

## Contributing
This project welcomes contributions and suggestions from the community. 

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
