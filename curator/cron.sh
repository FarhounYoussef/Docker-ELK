#!/bin/bash

# Start the run once job.
echo "Docker container has been started"

# Setup a cron schedule
echo "0 0 * * * root /usr/bin/curator /config/curator-actions.yml" > scheduler.txt

crontab scheduler.txt
/usr/sbin/crond -f