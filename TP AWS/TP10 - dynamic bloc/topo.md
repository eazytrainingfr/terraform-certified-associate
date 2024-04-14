#### https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks

Dans les constructions de blocs de niveau supérieur comme les ressources, les expressions ne peuvent généralement être utilisées que pour attribuer une valeur à un argument à l'aide de la forme nom = expression. Cela couvre de nombreuses utilisations, mais certains types de ressources incluent des blocs imbriqués répétables dans leurs arguments, qui représentent généralement des objets distincts liés à (ou intégrés dans) l'objet contenant.

