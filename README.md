# raspberrypi-temperature-telegraf
Collect RaspberryPi CPU and GPU temperature with telegraf

### How to use
1. Add this to you telegraf.conf
```
[[inputs.file]] 
  files = ["/sys/class/thermal/thermal_zone0/temp"]
  name_override = "cpu_temperature"
  data_format = "value"
  data_type = "integer"
  
[[inputs.exec]]                                                                                                                                                                       #   ## Commands array
   commands = [ "/opt/vc/bin/vcgencmd measure_temp" ]                                                                                                                                     name_override = "gpu_temperature"
   data_format = "grok"
   grok_patterns = ["%{NUMBER:value:float}"]

```
2. Add telegraf user to video group ```sudo usermod -G video telegraf```
3. ```sudo service telegraf stop;sudo service telegraf start```
4. Run test ```telegraf -config /etc/telegraf/telegraf.conf -test```

### Data format
To get a human readable *cpu* temperature divide it by 1000 (in grafana use the math(/ 1000) function
```json
{"cpu":54768, "gpu":54.8}
```
<img src="http://i.imgur.com/tnenohv.png" width="700">
