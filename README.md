# raspberrypi-temperature-telegraf
Collect RaspberryPi CPU and GPU temperature with telegraf

### How to use (No script required :fire:)
1. Locate `vcgencmd` binary by executing shell command `/usr/bin/which vcgencmd`. Location may vary depending on `libraspberrypi-bin` package version.
2. Before adding this to your _telegraf.conf_, replace `replace_with_vcgencmd_location` with real path returned in previous step. (ex.`/usr/bin/vcgencmd`).
```shell
[[inputs.file]] 
  files = ["/sys/class/thermal/thermal_zone0/temp"]
  name_override = "cpu_temperature"
  data_format = "value"
  data_type = "integer"
  
[[inputs.exec]]
  commands = [ "replace_with_vcgencmd_location measure_temp" ]
  name_override = "gpu_temperature"
  data_format = "grok"
  grok_patterns = ["%{NUMBER:value:float}"]

```
3. Add telegraf user to video group ```sudo usermod -a -G video telegraf```
4. ```sudo service telegraf stop;sudo service telegraf start```
5. Run test ```telegraf -config /etc/telegraf/telegraf.conf -test```

### How to use (Old way)
1. Copy ```telegraf_pi_temp.sh``` to ```/usr/local/bin/telegraf_pi_temp.sh```
2. Modify file permissions ```chmod +x /usr/local/bin/telegraf_pi_temp.sh```
3. Add ```telegraf``` user to video group ```sudo usermod -a -G video telegraf```
4. ```sudo service telegraf restart``` or ```sudo reboot```
5. Add to your telegraf.conf snippet from ```telegraf.conf```
6. Run test ```telegraf -config /etc/telegraf/telegraf.conf -test```

### Data format
To get a human readable *cpu* temperature divide it by 1000 (in grafana use the math(/ 1000) function
```json
{"cpu":54768, "gpu":54.8}
```
<img src="http://i.imgur.com/tnenohv.png" width="700">
