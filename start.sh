
sudo chmod -R 777 /home/arcade/shared/frontends
sudo cp -R attract /home/arcade/shared/frontends

cd attract
sudo cp -r mame.ini /home/arcade/.mame
sudo cp -r attract /usr/local/bin
sudo cp -r attract /usr/bin
sudo rm -R /home/arcade/update
sudo chmod -R 777 /home/arcade/shared/frontends/attract
sleep 3
