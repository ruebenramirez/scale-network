#!/bin/sh

while true
do
  # Example of output
  # /sys/kernel/debug/ieee80211/phy1/netdev:wlan1/stations/14:1a:a3:9a:47:35/rc_stats
  CLIENTS=$(find /sys/kernel/debug/ieee80211/ -name rc_stats)
  echo $CLIENTS |sed -e s#/sys/kernel/debug/ieee80211/## -e s#/netdev:#' '# -e s#/stations/#' '# -e s#/rc_stats## -e s/:/-/g |while rea
  do
    /usr/bin/logger -t "stats-$net-$mac" $(cat $CLIENTS |sed -e :0 -e '/,.*,.*,/b' -e N -e 's/\n/#014/' -e b0)
  done

  # Wait a little
  sleep 1
done