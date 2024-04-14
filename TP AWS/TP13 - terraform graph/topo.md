#### https://developer.hashicorp.com/terraform/cli/commands/graph

La commande terraform graph produit des descriptions des relations entre les objets d'une configuration Terraform, en utilisant le langage DOT.

Note: Pour generer le graph

Telecharger dot

https://graphviz.org/download/

Taper la commande

terraform graph -type=plan | dot -Tsvg >graph.svg