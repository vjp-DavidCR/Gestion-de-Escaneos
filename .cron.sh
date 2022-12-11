#!/bin/bash
#sudo rm /var/spool/cron/crontabs/root
#sudo crontab -l -u root | cat - .cron.txt | crontab -u root -
#sudo cp .cron.txt /var/spool/cron/crontabs/proyecto
sudo service cron restart
