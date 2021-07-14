
sudo chmod -R 777 /home/arcade/shared/frontends
sudo cp -R /home/arcade/update/attract /home/arcade/shared/frontends


sudo cp -R /home/arcade/update/mame /home/arcade/shared/configs
sudo cp -r /home/arcade/update/attract/attract /usr/local/bin
sudo cp -r /home/arcade/update/attract/attract /usr/bin
sudo rm -R /home/arcade/update
sudo chmod -R 777 /home/arcade/shared/frontends/attract
sleep 6
