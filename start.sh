
sudo chmod -R 777 /home/arcade/shared/frontends
sudo cp -R attract /home/arcade/shared/frontends

cd attract
sudo cp -R /home/arcade/update/mame /home/arcade/shared/configs
sudo cp -r /home/arcade/update/mame/attract /usr/local/bin
sudo cp -r /home/arcade/update/mame/attract /usr/bin
sudo rm -R /home/arcade/update
sudo chmod -R 777 /home/arcade/shared/frontends/attract
sleep 3
