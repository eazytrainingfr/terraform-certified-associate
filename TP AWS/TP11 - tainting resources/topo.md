#### https://developer.hashicorp.com/terraform/cli/commands/taint

La commande terraform taint informe Terraform qu'un objet particulier a été dégradé ou endommagé. Terraform le signale en marquant l'objet comme " tainted " dans l'état Terraform, et Terraform proposera de le remplacer dans le prochain plan que vous créerez.

Note: terraform taint ressource.name permet de tainter la ressource

eg: terraform taint aws_instance.myec2

Avertissement : Cette commande est obsolète. Pour Terraform v0.15.2 et plus, nous recommandons d'utiliser l'option -replace avec terraform apply à la place (détails ci-dessous).

#### https://developer.hashicorp.com/terraform/cli/commands/taint#recommended-alternative

Pour Terraform v0.15.2 et les versions ultérieures, nous recommandons d'utiliser l'option -replace avec terraform apply pour forcer Terraform à remplacer un objet même s'il n'y a pas de changement de configuration qui le nécessiterait

terraform apply -replace="aws_instance.example[0]"

eg: terraform apply -replace="aws_instance.myec2"