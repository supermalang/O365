<#
    Auteur : Elhadji Malang DIEDHIOU
    Description : Activation des scripts personnalisés sur les sites SharePoint Online
    Permissions : 
        - Autoriser les utilisateurs à exécuter des scripts personnalisés sur les sites personnels 
        - Autoriser les utilisateurs à exécuter des scripts personnalisés sur les sites créés en libre-service
#>

# URL du site d'administration de SharePoint Online
$adminUrl = Read-Host -Prompt "Veuillez entrer l'URL de votre site d'administration SharePoint Online"

Write-Host "Appuyez sur une touche pour afficher la fenetre de connexion et renseigner vos identifiants..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# Identifiants administrateur
$credentials = Get-Credential

# Connexion au service SharePoint Online
Connect-SPOService -Url $url -credential $credentials
Write-Host "Connecte au service SharePoint avec succes"

# URL de la collection de site où on veut activer l'exécution des scripts personnalisés
$siteURL = Read-Host -Prompt "Veuillez entrer l'URL de la collection de site ou vous voulez activer l'execution de scripts personnalises"

# Autorisation de l'execution de scripts personnalisés
Set-SPOSite -Identity $siteURL -DenyAddAndCustomizePages $false

Write-Host "Exécution de scripts personnalises activee sur la collection de site $siteURL ."