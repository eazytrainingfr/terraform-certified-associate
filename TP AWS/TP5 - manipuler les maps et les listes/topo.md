#### https://developer.hashicorp.com/terraform/language/expressions/type-constraints#collection-types

"Complex Types" se réfère à des types complexes qui regroupent plusieurs valeurs en une seule valeur. Les types complexes sont représentés par des constructeurs de types, mais plusieurs d'entre eux ont également des versions abrégées de mots-clés.

Il existe deux catégories de types complexes : les types de collection (pour regrouper des valeurs similaires) et les types structurels (pour regrouper des valeurs potentiellement différentes).

Les types de collection permettent de regrouper plusieurs valeurs d'un autre type en une seule valeur. Le type de valeur à l'intérieur d'une collection est appelé son type d'élément. Tous les types de collection doivent avoir un type d'élément, qui est fourni en tant qu'argument à leur constructeur.

Par exemple, le type list(string) signifie "liste de chaînes de caractères", qui est un type différent de list(number), une liste de nombres. Tous les éléments d'une collection doivent toujours être du même type.

Les trois types de collections dans le langage Terraform sont :

list(...) : une séquence de valeurs identifiées par des nombres entiers consécutifs commençant par zéro.
Le mot-clé list est une abréviation pour list(any), qui accepte n'importe quel type d'élément tant que chaque élément est du même type. Cela est pour la compatibilité avec les configurations plus anciennes ; pour le nouveau code, nous vous recommandons d'utiliser la forme complète.

map(...) : une collection de valeurs où chacune est identifiée par une étiquette de chaîne de caractères.
Le mot-clé map est une abréviation pour map(any), qui accepte n'importe quel type d'élément tant que chaque élément est du même type. Cela est pour la compatibilité avec les configurations plus anciennes ; pour le nouveau code, nous vous recommandons d'utiliser la forme complète.
Les maps peuvent être créées avec des accolades ({}) et des deux-points (:) ou des signes égal (=) : { "foo": "bar", "bar": "baz" } OU { foo = "bar", bar = "baz" }. Les guillemets peuvent être omis sur les clés, sauf si la clé commence par un nombre, auquel cas les guillemets sont nécessaires. Les virgules sont nécessaires entre les paires clé/valeur pour les maps sur une seule ligne. Un saut de ligne entre les paires clé/valeur est suffisant pour les maps sur plusieurs lignes.

set(...) : une collection de valeurs uniques qui n'ont pas d'identifiant secondaire ou d'ordre.