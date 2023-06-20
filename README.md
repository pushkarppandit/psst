# PSST

Script for recurring reminders, displayed via a macOS notification/alert. Slack does not allow recurring reminders at a rate higher than daily, so I wrote this script.

## Usage

You can directly run the script to test your reminder out.

```man
psst.sh [-I] [Message]
Option:
    -I Flag to set level of reminder. Default is notification, if this flag is passed it becomes an alert
Argument:
    Message to be shown in the reminder. If there are spaces in the message use double quotes
```

## How to setup

Once you have tested the script and are satisfied with the reminder level

1. Make `psst.sh` executable. You can do this by `chmod +x psst.sh`
2. Open crontab config for editing by entering the command `crontab -e`
3. Copy the below into the opened file. The initial expression denotes the frequency of the cronjob. In this example, this runs the script every 2 hrs between 10 am and 6 pm on weekdays. Refer to reference 2 to test yours out.

    ```bash
    0 10-18/2 * * 1-5 <path to script>/psst.sh [-I] [Message]
    ```

4. Save and exit

Multiple crons can be added for multiple alerts with their own messages and reminder levels.

## References

1. [How to send macOS notification from the command line](https://code-maven.com/display-notification-from-the-mac-command-line)
2. For testing your cron expressions [Crontab guru](https://crontab.guru/)
3. [Getopts tutorial](https://wiki.bash-hackers.org/howto/getopts_tutorial)
