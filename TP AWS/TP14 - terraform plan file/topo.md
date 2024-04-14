#### https://developer.hashicorp.com/terraform/tutorials/cli/plan#create-a-plan

La commande terraform plan crée un plan composé d'un ensemble de changements qui feront correspondre vos ressources à votre configuration. Cela vous permet de prévisualiser les actions que Terraform entreprendra pour modifier votre infrastructure avant de les appliquer. Terraform plan n'apporte aucune modification à vos ressources, vous devez appliquer un plan pour que Terraform apporte des modifications.

Vous pouvez également enregistrer un plan avec l'option -out. Plus tard, vous pourrez appliquer le plan sauvegardé et Terraform n'effectuera que les changements listés dans le plan. Dans un pipeline Terraform automatisé, l'application d'un fichier de plan enregistré garantit que Terraform n'effectue que les modifications prévues, même si votre pipeline s'exécute sur plusieurs machines à des moments différents.

Pour faire le plane file, faire

terraform plan -out=ec2

terraform apply ec2