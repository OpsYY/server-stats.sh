# server-stats.sh

 The script prints the following on linux based OS:
 CPU Usage: Retrieved using the top command.
 RAM Usage: Calculated in MB using the free -m command.
 Disk Usage: Checked using the df -h / command to monitor the system’s main disk.
 Top 5 Processes by CPU Usage: Listed using the ps command to find the highest CPU-consuming processes.
 Top 5 Processes by RAM Usage: Sorted using the ps command based on memory consumption.

Additional Information:

Operating system version
Server uptime
Load average
Number of active users
Failed SSH login attempts
You can automate this script with a cron job to receive regular reports!

How to run:
-Move it to your linux based host
- chmod 777 server-stats.sh
- bash server-stats.sh








https://roadmap.sh/projects/server-stats
