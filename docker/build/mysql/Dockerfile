FROM mysql:5.7

RUN chown -R mysql:root /var/lib/mysql/

ARG MYSQL_ROOT_PASSWORD

RUN /etc/init.d/mysql start && \
         mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';FLUSH PRIVILEGES;"

EXPOSE 3306
