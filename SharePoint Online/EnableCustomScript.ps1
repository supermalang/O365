
<#
    Auteur : Elhadji Malang DIEDHIOU
    Description : Activation des scripts personnalisés sur les sites SharePoint Online
    Permissions : 
        - Autoriser les utilisateurs à exécuter des scripts personnalisés sur les sites personnels 
        - Autoriser les utilisateurs à exécuter des scripts personnalisés sur les sites créés en libre-service
    Prerequis : Le module SharePoint Online Management Shell (https://www.microsoft.com/fr-fr/download/details.aspx?id=35588)
#>

# nom du compte Office 365. Utilisé ici pour construire les URL
$nomCompte = Read-Host -Prompt "Veuillez renseigner le nom de votre Office 365, exemple: hdlabs"

# Identifiants administrateur
$adminCredentials = Get-Credential -Message "Veuillez renseigner vos identifiants d'administrateur Office 365"

# Connexion au service SharePoint Online
Connect-SPOService -Url https://$nomCompte-admin.sharepoint.com -Credential $adminCredentials

# URL de la collection de site où on veut activer l'exécution des scripts personnalisés
$siteURL = Read-Host -Prompt "Veuillez entrer l'URL de la collection de site ou vous voulez activer l'execution de scripts personnalises"

# Autorisation de l'execution de scripts personnalisés
Set-SPOSite -Identity $siteURL -DenyAddAndCustomizePages $false