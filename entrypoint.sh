#!/bin/bash

# Attendre que la base de données soit prête
# Exemple d'utilisation de wait-for-it ou similaire

# Exécuter les migrations et le seeding
php artisan migrate --force
php artisan db:seed --force

# Continuer avec le démarrage normal du conteneur
exec "$@"
