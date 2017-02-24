#Requires -Version 3.0
#Requires -Module AzureRM.Resources
#Requires -Module Azure.Storage

Param(
    [string] $ResourceGroupLocation = 'East US 2',
    [string] $ResourceGroupName = 'Bookstore',
    [string] $TemplateFile = '.\basecpu.json',
    [string] $TemplateParametersFile = '.\basecpu.mysql.parameters.json'
)

Import-Module Azure -ErrorAction SilentlyContinue

# Login-AzureRmAccount

# Select-AzureRmSubscription -SubscriptionName "Microsoft Azure Sponsorship"

# Create or update the resource group using the specified template file and template parameters file
New-AzureRmResourceGroup -Name $ResourceGroupName -Location $ResourceGroupLocation -Verbose -Force -ErrorAction Stop 

New-AzureRmResourceGroupDeployment -ResourceGroupName $ResourceGroupName `
                                   -TemplateFile $TemplateFile `
                                   -TemplateParameterFile $TemplateParametersFile `
                                   -Force -Verbose
	