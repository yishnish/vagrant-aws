docker run --name rizla-web -e VIRTUAL_HOST=$HOST_NAME -e SECRET_KEY_BASE=$SECRET_KEY_BASE -e MYSQL_ROOT_PASSWORD=$MYSQL_ROOT_PASSWORD --link rizladb:mysql -d rizla-rails
