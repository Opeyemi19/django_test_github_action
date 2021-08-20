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

* Python Code Quality : Va nous permettre de vérifier la qualité de Code avec :

   - pep8
   - flake8
   - black

Ces packages vont nous permettre de respecter certains principes d'écriture de code dans Python. Lorsqu'on lance la commande **flake8** ou **black** ils vont nous retourner là où se trouve des problèmes.

## La configuration de GitHub Actions

On a la création de notre dossier **.github/worflows** pour éxecuter notre Test de façon automatique.


[![Django Tests Automation with GitHub Action](https://github.com/Opeyemi19/django_test_github_action/actions/workflows/testing-app.yml/badge.svg?branch=main)](https://github.com/Opeyemi19/django_test_github_action/actions/workflows/testing-app.yml)