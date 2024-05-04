#### https://developer.hashicorp.com/terraform/language/expressions/splat

Une expression splat permet d'exprimer de manière plus concise une opération courante qui pourrait être réalisée avec une expression for.

Si var.list est une liste d'objets ayant tous un attribut id, une liste des id pourrait être produite avec l'expression for suivante :

[for o in var.list : o.id]

Cela équivaut à l'expression splat suivante :

var.list[*].id

Le symbole spécial [*] itère sur tous les éléments de la liste donnée à sa gauche et accède à partir de chacun d'eux au nom de l'attribut donné à sa droite. Une expression splat peut également être utilisée pour accéder aux attributs et aux index de listes de types complexes en étendant la séquence d'opérations à la droite du symbole :

var.list[*].interfaces[0].name

L'expression ci-dessus est équivalente à l'expression for suivante :

[for o in var.list : o.interfaces[0].name]


