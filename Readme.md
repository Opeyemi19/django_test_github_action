# Django With GitHub Actions in Automated Test

## Usage de coverage pour le Test

* Installation de Coverage
    - pip install coverage
* Executer le Test:
    - coverage run .\manage.py test   (pour effectuer un test sans ignorer de contenue)
    - coverage run --omit='*/venv/*' .\manage.py test (Effectue le Test en ignorant notre venv)
    - coverage report  (Permet d'obtenir le résultat du rapport du Test dans notre Terminal)
    - coverage html  (Pour avoir le résultat du rapport du Test en HTML, Là il sera encore plus lisible)

## Pour la vérification de la Qualité de Code.

* Python Code Quality : Pour de vérifier les style de Code avec :

   - pep8
   - flake8
   - black

Ces packages vont nous permettre de respecter certains principes d'écriture de code dans Python. Lorsqu'on lance la commande **flake8** ou **black** ils vont nous retourner là où se trouve des problèmes.

## La configuration de GitHub Actions

On a la création de notre dossier **.github/worflows** pour éxecuter notre Test de façon automatique.

## La configuration de SonarQube plus précisement dans mon cas avec Sonarcloud

- Créer son compte avec les différents moyens mise à disposition tel que GitHub, Gitlag, etc
- Créer une **organization** si vous n'aviez pas encore crée
- Créer une nouveau projet, il y a deux options :
    * Soit vous importez un projet directement a parti de GitHub pour l'analyser dans le sonarcloud.
    * Ou soit par le moyen de création de projet de façon **manuel** et pour l'intégrer dans notre pipeline CI/CD, ce qui va nous permettre d'avoir les **SECRET_TOKEN**, le code d'intégration dans notre Pipeline GitHub Action, la creaction de **Project Key**


## Lors du déploiement sur Heroku
L'erreur au niveau du projet NodeJS et Python,Django était au niveau du port que devrait retourner l'application une fois éxecuter donc il faut le capter pour éviter l'erreur de : **Error R10 (Boot timeout) -> Web process failed to bind to $PORT within 60 seconds of launch**

- Lien qui me sont utile: 
    * https://github.com/AlbMej/Online-Loan-Application
    * https://blog.aniketmore.com/cd-heroku-docker
    * https://blog.devgenius.io/how-to-build-and-run-a-nodejs-app-with-docker-github-actions-59eb264dfef5
    * https://faun.pub/deploying-a-dockerized-angular-app-with-github-actions-7e89fdb9c2e8


## Les Badges

- C'est pour la branche Master

[![Django Tests Automation with GitHub Action](https://github.com/Opeyemi19/django_test_github_action/actions/workflows/testing-app.yml/badge.svg?branch=master)](https://github.com/Opeyemi19/django_test_github_action/actions/workflows/testing-app.yml)

- Pour l'analyse de code source avec Sonarcloud

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=pro-test-django&metric=alert_status)](https://sonarcloud.io/dashboard?id=pro-test-django)