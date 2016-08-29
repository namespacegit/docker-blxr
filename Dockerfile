FROM php:5.6-apache
MAINTAINER jax777 "jax777@qq.com"
ADD BlueLotus_XSSReceiver /var/www/html/
chmod -R a+rw /var/www/html/
EXPOSE 80
CMD ["apache2-foreground"]
