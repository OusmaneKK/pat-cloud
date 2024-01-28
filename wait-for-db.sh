#!/bin/bash

# Remplacer db_host par le nom d'hôte réel ou l'adresse IP de votre serveur MySQL
DB_HOST=mysql
DB_USER=sail
DB_PASSWORD=passwd
DB_PORT=3306 # Habituellement 3306

# Boucle jusqu'à ce que MySQL soit prêt
until mysql -h "$DB_HOST" -P "$DB_PORT" -u "$DB_USER" -p"$DB_PASSWORD" -e 'SELECT 1'; do
  >&2 echo "MySQL is unavailable - sleeping"
  sleep 1
done

>&2 echo "MySQL is up - executing command"
php artisan migrate --seed
