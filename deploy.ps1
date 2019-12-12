#Requires -Version 6

Param(
    [string] $botName,
	[string] $resourceGroup,
    [string] $location = "westus",
	[string] $botAppId,
    [string] $botAppPassword,
    [string] $luisAuthoringKey,
	[string] $luisAuthoringRegion = "westus",
    [string] $parametersFile,
	[string] $languages = "en-us",
	[string] $projDir = "./MyAssistant/MyAssistant",
	[string] $logFile = $(Join-Path $PSScriptRoot .. "deploy_log.txt")
)

./MyAssistant/MyAssistant/Deployment/Scripts/deploy.ps1 -name $botName `
                                -resourceGroup $resourceGroup `
                                -location $location `
                                -botAppId $botAppId  `
                                -appPassword $botAppPassword `
                                -luisAuthoringKey $luisAuthoringKey `
                                -luisAuthoringRegion $luisAuthoringRegion `
                                -parametersFile $parametersFile `
                                -languages $languages `
                                -projDir $projDir `
                                -logFile $logFile