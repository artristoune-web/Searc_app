# Application de Recherche d'Adresses Postales

Cette application mobile, développée en Flutter, permet à l'utilisateur de rechercher des adresses postales et de les enregistrer en tant que favoris. De plus, l'application permet de définir des informations supplémentaires pour chaque adresse, telles que le type de lieu (mairie, magasin, etc.) en utilisant des mots-clés.

## Fonctionnalités principales

- **Recherche d'adresses postales**: L'application permet à l'utilisateur de rechercher des adresses postales en entrant des informations telles que le nom de la rue, la ville, le code postal, etc.

- **Enregistrement de favoris**: Une fois qu'une adresse est trouvée, l'utilisateur peut l'enregistrer en tant que favori pour un accès facile ultérieur.

- **Définition du type de lieu**: L'utilisateur a la possibilité de définir le type de lieu associé à chaque adresse, par exemple, mairie, magasin, restaurant, etc.

- **Utilisation de mots-clés**: L'application permet d'associer des mots-clés personnalisés à chaque adresse, ce qui facilite la recherche ultérieure et la classification des adresses.

- **Gestion des favoris**: L'utilisateur peut gérer sa liste de favoris en les visualisant, les modifiant ou les supprimant selon ses besoins.

## Captures d'écran

Insérez ici quelques captures d'écran illustrant l'interface utilisateur de l'application.

## Configuration du projet

1. Assurez-vous d'avoir installé Flutter sur votre système. Si ce n'est pas le cas, suivez les instructions de [Flutter Installation](https://flutter.dev/docs/get-started/install) pour l'installer.

2. Clonez ce dépôt sur votre machine locale: 
```git clone https://github.com/yoshiTorisutan-web/search_app_flutter.git```

3. Accédez au répertoire du projet:
```cd search_app_flutter```

4. Exécutez la commande suivante pour télécharger les dépendances nécessaires:
```flutter pub get```

5. Connectez un périphérique ou émulateur Android/iOS à votre ordinateur.

6. Lancez l'application en exécutant la commande:

## Configuration supplémentaire

L'application utilise certaines API pour la recherche d'adresses et la récupération des informations supplémentaires. Assurez-vous de configurer les clés d'API nécessaires en créant un fichier `config.dart` dans le répertoire `lib` et en y ajoutant les clés d'API suivantes:

```
class Config {
static const String addressSearchApiKey = 'VOTRE_CLE_API_DE_RECHERCHE_D_ADRESSE';
static const String geocodingApiKey = 'VOTRE_CLE_API_DE_GEOCODAGE';
}

```

## Contributions

Les contributions sont les bienvenues ! Si vous souhaitez contribuer à ce projet, veuillez suivre les étapes suivantes:

Forkez ce dépôt et clonez-le sur votre machine locale.

Créez une branche pour vos modifications:
```git checkout -b ma-branche```

Effectuez les modifications souhaitées et committez-les:
```git commit -m "Mes modifications"```


7. Poussez les modifications vers votre dépôt distant:
```git push origin ma-branche```


8. Ouvrez une pull request vers ce dépôt principal.

9. Votre contribution sera examinée et fusionnée une fois approuvée.

## Remarques

- Assurez-vous d'avoir une connexion Internet active pour utiliser toutes les fonctionnalités de l'application.
- Veillez à respecter les règles d'utilisation des API externes et à obtenir les clés d'API nécessaires.
- Cette application est développée en utilisant Flutter, ce qui permet de la déployer sur les plateformes Android et iOS.




