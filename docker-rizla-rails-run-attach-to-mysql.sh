docker run --name rizla-web -e SECRET_KEY_BASE=$SECRET_KEY_BASE -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD --link rizladb:mysql -p 80:3000 -d rizla-rails
