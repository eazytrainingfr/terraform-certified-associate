### https://developer.hashicorp.com/terraform/language/providers#how-to-find-providers


Pour trouver des fournisseurs pour les plateformes d'infrastructure que vous utilisez, parcourez la section des fournisseurs du registre Terraform.

Certains fournisseurs du registre sont développés et publiés par HashiCorp, d'autres sont publiés par les responsables des plateformes et d'autres encore sont publiés par des utilisateurs et des bénévoles. Les listes de fournisseurs utilisent les badges suivants pour indiquer qui développe et maintient un fournisseur donné.


#### Official


Les fournisseurs officiels sont détenus et maintenus par HashiCorp.

- Namespace: hashicorp


#### Partner


Les fournisseurs partenaires sont rédigés, maintenus, validés et publiés par des sociétés tierces par rapport à leurs propres API. Pour obtenir un badge de fournisseur partenaire, le partenaire doit participer au programme de partenariat technologique de HashiCorp.

- Namespace: Third-party organization, e.g. mongodb/mongodbatlas


#### Community


Les fournisseurs de la communauté sont publiés dans le registre Terraform par des mainteneurs individuels, des groupes de mainteneurs ou d'autres membres de la communauté Terraform.

- Namespace: Maintainer’s individual or organization account, e.g. DeviaVir/gsuite


#### Archived

Les fournisseurs archivés sont des fournisseurs officiels ou partenaires qui ne sont plus maintenus par HashiCorp ou la communauté. Cela peut se produire si une API est obsolète ou si l'intérêt qu'elle suscite est faible.

- Namespace: hashicorp or third-party

Pour telecharger un provider, apres avoir indiqué la source tapez

```bash
terraform init
```