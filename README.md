### Step 1: Scheduling the Script
You can schedule the script using `cron` for Unix-based systems.

1. **Edit the crontab file**:
   ```bash
   crontab -e
   ```

2. **Add a cron job to enable or disable ACL at a specified time**:
   - For example, to enable ACL every day at 11:00 PM:
     ```
     0 23 * * * /path/to/your/script.sh enable
     ```
   - To disable ACL every day at 1:20 AM:
     ```
     20 1 * * * /path/to/your/script.sh disable
     ```

### Step 2: Make the Script Executable
Ensure the script has execute permissions:
```bash
chmod +x /path/to/your/script.sh
```