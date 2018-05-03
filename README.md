# speedtest-logger
A small script which loggs the results of speedtest-cli in a log file

# Installation
Put `speedlog.sh` somewhere and make sure it is executable (`chmod +x speedlog.sh`). If you run it now, it will create a file in working directory and put its results into it.

## Automation
I used systemd timers to run this script every 15 minutes. Copy `speedtest.timer` and `speedtest.service` to `/etc/systemd/system/`. Fix the path to `speedlog.sh` in `speedtest.service`. Then run:

```
systemctl enable speedtest.service
systemctl enable --now speedtest.timer
```

Check the status:
```
$ systemctl status speedtest.timer
● speedtest.timer - Test the internet connection speed
   Loaded: loaded (/etc/systemd/system/speedtest.timer; enabled; vendor preset: disabled)
   Active: active (waiting) since Wed 2018-05-02 13:21:05 CEST; 20h ago
  Trigger: Thu 2018-05-03 09:30:00 CEST; 4min 44s left
```
