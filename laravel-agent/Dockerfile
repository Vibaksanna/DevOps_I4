FROM jenkins/ssh-agent:latest

RUN apt update && apt install -y git php8.2 php-xml
RUN apt install -y php-curl php-mbstring php-zip
RUN apt install -y php-bcmath
RUN apt install -y php-gd php-pdo php-fileinfo 
RUN apt install -y npm  php-sqlite3
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'.PHP_EOL; } else { echo 'Installer corrupt'.PHP_EOL; unlink('composer-setup.php'); exit(1); }"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer