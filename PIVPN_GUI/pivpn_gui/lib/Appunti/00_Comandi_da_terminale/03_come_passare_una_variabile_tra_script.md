Sure! Below are two shell scripts that accomplish this task:

1. The first script (`script1.sh`) contains a variable with a string value.
2. The second script (`script2.sh`) reads the variable from the first script and prints the value.

### Script 1: `script1.sh`
```bash name=script1.sh
#!/bin/bash

# Define a variable with a string value
MY_VARIABLE="Hello, this is a string from script1.sh"
```

### Script 2: `script2.sh`
```bash name=script2.sh
#!/bin/bash

# Source the first script to import the variable
source ./script1.sh

# Print the value of the variable
echo "The value of MY_VARIABLE is: $MY_VARIABLE"
```

### Instructions:
1. Save the above content into two separate files named `script1.sh` and `script2.sh`.
2. Make both scripts executable:
   ```sh
   chmod +x script1.sh script2.sh
   ```
3. Run the second script (`script2.sh`), which will source the first script and print the value of the variable:
   ```sh
   ./script2.sh
   ```

When you run `script2.sh`, it will output:
```
The value of MY_VARIABLE is: Hello, this is a string from script1.sh
```

This setup ensures that `script2.sh` reads the variable defined in `script1.sh` and prints its value.
