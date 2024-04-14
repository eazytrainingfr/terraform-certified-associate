#### https://developer.hashicorp.com/terraform/cli/workspaces

Pour creer nos workspaces, faire: 

- terraform workspace new dev

- terraform workspace new prod

Selectionner un workspace, faire: 

- terraform workspace select dev

Afficher le workspace courant, faire: 

 - terraform workspace show


##### Managing Workspaces

Les espaces de travail de Terraform CLI font référence à des instances distinctes de données d'état dans le même répertoire de travail Terraform. Ils sont très différents des espaces de travail de Terraform Cloud, qui ont chacun leur propre configuration Terraform et fonctionnent comme des répertoires de travail distincts.

Terraform s'appuie sur l'état pour associer des ressources à des objets du monde réel. Lorsque vous exécutez la même configuration plusieurs fois avec des données d'état distinctes, Terraform peut gérer plusieurs ensembles de ressources qui ne se chevauchent pas.

Les espaces de travail peuvent être utiles dans des cas d'utilisation spécifiques, mais ils ne sont pas nécessaires pour utiliser l'interface CLI de Terraform. Nous recommandons d'utiliser d'autres approches pour les déploiements complexes nécessitant des informations d'identification et des contrôles d'accès distincts.

##### Cas d'utlisation 

Vous pouvez créer plusieurs répertoires de travail pour maintenir plusieurs instances d'une configuration avec des données d'état complètement séparées. Cependant, Terraform installe un cache distinct de plugins et de modules pour chaque répertoire de travail, de sorte que la maintenance de plusieurs répertoires peut gaspiller de la bande passante et de l'espace disque. Cette approche nécessite également des tâches supplémentaires telles que la mise à jour de la configuration à partir du contrôle de version pour chaque répertoire séparément et la réinitialisation de chaque répertoire lorsque vous modifiez la configuration. Les espaces de travail sont pratiques car ils vous permettent de créer différents ensembles d'infrastructures avec la même copie de travail de votre configuration et les mêmes caches de plugins et de modules.

Une utilisation courante de plusieurs espaces de travail consiste à créer une copie parallèle et distincte d'un ensemble d'infrastructures afin de tester un ensemble de changements avant de modifier l'infrastructure de production.

Les espaces de travail autres que celui par défaut sont souvent liés à des branches de fonctionnalités dans le contrôle de version. L'espace de travail par défaut peut correspondre à la branche principale ou tronc, qui décrit l'état prévu de l'infrastructure de production. Lorsqu'un développeur crée une branche de fonctionnalités pour une modification, il peut également créer un espace de travail correspondant et y déployer une copie temporaire de l'infrastructure principale. Il peut alors tester les modifications sur la copie sans affecter l'infrastructure de production. Une fois la modification fusionnée et déployée dans l'espace de travail par défaut, il détruit l'infrastructure de test et supprime l'espace de travail temporaire.