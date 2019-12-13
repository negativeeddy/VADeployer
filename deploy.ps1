#Requires -Version 6

Param(
    [string] $botName,
    [string] $resourceGroup,
    [string] $location = "westus2",
    [string] $botAppId,
    [string] $botAppPassword,
    [string] $luisAuthoringKey,
    [string] $luisAuthoringRegion = "westus",
    [string] $parametersFile,
    [string] $languages = "en-us",
    [string] $projDir = "./MyAssistant/MyAssistant",
    [string] $logFile = $(Join-Path $PSScriptRoot .. "deploy_log.txt"),
    [switch] $minimalCost
)

if ($minimalCost) {
    Write-Host ("Deploying minimal cost template.`nWARNING Some resource types, e.g. QnA Maker, only allow one free SKU per subscription. If you already have one of these the deployment will fail")
    ./MyAssistant/MyAssistant/Deployment/Scripts/deploy.ps1 -name $botName `
        -resourceGroup $resourceGroup `
        -location $location `
        -botAppId $botAppId  `
        -appPassword $botAppPassword `
        -luisAuthoringKey $luisAuthoringKey `
        -luisAuthoringRegion $luisAuthoringRegion `
        -parametersFile ./scripts/minimalcost.parameters.template.json `
        -languages $languages `
        -projDir $projDir `
        -logFile $logFile}
else {
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
}