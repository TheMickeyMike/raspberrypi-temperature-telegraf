# raspberrypi-temperature-telegraf
Collect RaspberryPi CPU and GPU temperature with telegraf

### How to use
1. Copy ```telegraf_pi_temp.sh``` to ```/usr/local/bin/telegraf_pi_temp.sh```
2. Modify file permissions ```chmod +x /usr/local/bin/telegraf_pi_temp.sh```
3. Add ```telegraf``` user to video group ```sudo usermod -G video telegraf```
4. Restart your RaspberryPi
5. Add to your telegraf.conf snippet from ```telegraf.conf```
6. Run test ```telegraf -config /etc/telegraf/telegraf.conf -test```

### Data format
To get human readable cpu temperture divide it by 10000 
```json
{"cpu":54768, "gpu":54.8}
```
