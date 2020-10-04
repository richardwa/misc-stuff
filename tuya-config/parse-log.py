#!/usr/bin/python3
import json
import dateutil.parser as dp
import pytz 

# read input from stdin
import fileinput

# sample line
# tele/power1/SENSOR {"Time":"2020-10-04T04:02:35","ENERGY":{"TotalStartTime":"2020-09-30T02:29:05","Total":8.315,"Yesterday":1.717,"Today":0.350,"Period":8,"Power":87,"ApparentPower":89,"ReactivePower":22,"Factor":0.97,"Voltage":121,"Current":0.736}}

format = "%Y-%m-%d %H:%M:%S %Z%z"

prev = {}
for line in fileinput.input():
  [name_str, json_str] = line.split(" ", 1)
  if ("SENSOR" in name_str):
    data = json.loads(json_str)

    name = name_str.split("/")[1]
    time = dp.isoparse(data["Time"]+"Z")
    total = int(data["ENERGY"]["Total"] * 1000) # kWh -> Wh
    power = int(data["ENERGY"]["Power"]) # Watts
    
    if (name not in prev):
      prev[name] = total
    else:
      delta = total - prev[name]
      mytime = time.astimezone().strftime(format)
      print("{0} {1} {2} {3}".format( name, mytime, delta, power))
      prev[name] = total
