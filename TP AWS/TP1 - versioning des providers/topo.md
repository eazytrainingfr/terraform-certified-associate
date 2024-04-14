### https://developer.hashicorp.com/terraform/language/providers


#### Role des Providers


Les fournisseurs sont une abstraction logique d'une API en amont. Ils sont chargés de comprendre les interactions de l'API et d'exposer les ressources.


#### Origine des Providers


Les fournisseurs sont distribués séparément de Terraform lui-même, et chaque fournisseur a sa propre cadence de publication et ses propres numéros de version.

Le Terraform Registry est le principal répertoire des fournisseurs Terraform accessibles au public, et héberge des fournisseurs pour la plupart des grandes plateformes d'infrastructure.


#### Installation du Provider


Terraform Cloud et Terraform Enterprise installent les fournisseurs dans le cadre de chaque exécution.

Terraform CLI recherche et installe les fournisseurs lors de l'initialisation d'un répertoire de travail. Il peut télécharger automatiquement les fournisseurs à partir d'un registre Terraform ou les charger à partir d'un miroir ou d'un cache local. Si vous utilisez un répertoire de travail persistant, vous devez le réinitialiser chaque fois que vous modifiez les fournisseurs d'une configuration.

Pour gagner du temps et de la bande passante, Terraform CLI prend en charge un cache de plugin optionnel. Vous pouvez activer le cache en utilisant le paramètre plugin_cache_dir dans le fichier de configuration du CLI.

Pour s'assurer que Terraform installe toujours les mêmes versions de fournisseurs pour une configuration donnée, vous pouvez utiliser Terraform CLI pour créer un fichier de verrouillage des dépendances et le livrer au contrôle de version avec votre configuration. Si un fichier de verrouillage est présent, Terraform Cloud, CLI et Enterprise y obéiront tous lors de l'installation des fournisseurs.

Pour appliquer le changement de version d'un fournisseur tapez

```bash
terraform init -upgrade
```