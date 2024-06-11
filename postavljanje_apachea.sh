sudo cp /etc/apache2/sites-available/algebra_test.conf /etc/apache2/sites-available/osnove_mysql.conf
sudo a2dissite osnove_php.conf 
sudo a2ensite osnove_mysql.conf 
ll /etc/apache2/sites-enabled/
sudo service apache2 restart

sudo nano /etc/apache2/sites-available/osnove_mysql.conf
sudo service apache2 restart

sudo apt install -y phpmyadmin
sudo phpenmod -v ALL mbstring
sudo systemctl restart apache2