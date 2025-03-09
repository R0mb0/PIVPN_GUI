Certainly! Below is a shell script that opens a new terminal window and executes the `pivpn -qr` command. This example uses `gnome-terminal`, which is commonly used in GNOME desktop environments. If you are using a different terminal emulator, you may need to adjust the script accordingly.

```bash name=open_pivpn_terminal.sh
#!/bin/bash

# Open a new terminal window and execute the pivpn -qr command
gnome-terminal -- bash -c "pivpn -qr; exec bash"
```

### Instructions:
1. Save the script to a file named `open_pivpn_terminal.sh`.
2. Make the script executable:
   ```sh
   chmod +x open_pivpn_terminal.sh
   ```
3. Run the script:
   ```sh
   ./open_pivpn_terminal.sh
   ```

This script uses `gnome-terminal` to open a new terminal window, runs the `pivpn -qr` command, and then keeps the terminal open (`exec bash`). If you are using a different terminal emulator like `xterm`, `konsole`, or `xfce4-terminal`, you can replace `gnome-terminal` with the appropriate command for your terminal.

For example, using `xterm`:
```bash name=open_pivpn_terminal.sh
#!/bin/bash

# Open a new xterm window and execute the pivpn -qr command
xterm -hold -e "pivpn -qr"
```

Or using `konsole`:
```bash name=open_pivpn_terminal.sh
#!/bin/bash

# Open a new konsole window and execute the pivpn -qr command
konsole --noclose -e "pivpn -qr"
```

Make sure to choose the terminal emulator that matches your desktop environment.
