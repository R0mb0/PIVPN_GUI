Urbino`s University - Computing and digital innovation - Programming of mobile devices and user interfaces

# PIVPN GUI

<div align="center">
 <img width="90%"  height="90%" src="https://github.com/R0mb0/PIVPN_GUI/blob/main/Project_infos/Logo_pivpn.png">
</div>
 
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/1897688fc3874b3baeec1fc09a08799f)](https://app.codacy.com/gh/R0mb0/PIVPN_GUI/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/R0mb0/PIVPN_GUI)
[![Open Source Love svg3](https://badges.frapsoft.com/os/v3/open-source.svg?v=103)](https://github.com/R0mb0/PIVPN_GUI)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

[![Donate](https://img.shields.io/badge/PayPal-Donate%20to%20Author-blue.svg)](http://paypal.me/R0mb0)

## Description 

**PIVPN GUI** is a flutter application to simplify the manage of [`PIVPN`](https://github.com/pivpn/pivpn) service for most of commons users. It provide the "time to be enabled" functionality, in way to automatic disable clients that had terminated their "enabled time". For example this functionality is usefull if the vpn is used to distribute a subscription service.  

> Until the application is open, one time a day, the application will check all user statuses, disabling the users with their "time to be enabled" over. 

## How to install 

### 1. PIVPN installation

 <img style="float" align="right" width="20%"  height="20%" src="https://www.pivpn.io/images/pivpnlogo.png">

- [how to install PIVPN](https://github.com/pivpn/pivpn)

<br><br><br><br><br>

### 2. Flutter installation

 <img style="float" align="right"  width="20%"  height="20%" src="https://avatars.githubusercontent.com/u/14101776?s=200&v=4">

- [How to install flutter](https://flutter-ko.dev/get-started/install)

<br><br><br><br><br>

### 3. Download the application 

- ```bash
  git clone https://github.com/R0mb0/PIVPN_GUI.git
  ```

## How to run 

1. Enter into the working directory
   ```bash
   cd PIVPN_GUI/PIVPN_GUI/pivpn_gui/lib
   ```
2. Make executable `make_all_scripts_executable.sh` script
   ```bash
   chmod +x make_all_scripts_executable.sh
   ```
3. Run the script
   ```
   ./make_all_scripts_executable.sh
   ```
4. Create the `password.sh` file

   - Create with your favorite editor `password.sh`
     ```bash
     nano password.sh
     ```
   - Add this code inside the file
     ```bash
     #!/bin/bash
     PASSWORD = "your_sudo_password"
     ```
     Save the file

     `ctrl + o`   
     `ctrl + x`
 5. Run the application
    ```bash
    flutter run
    ```

## Interface description  

<div align="center">
 <img width="90%"  height="90%" src="https://github.com/R0mb0/PIVPN_GUI/blob/main/Project_infos/Pivpn_gui.png">
</div>
<br><br>

- `Name`, `Start Date`, `End Date` are "Text Fields"
- `ADD USER`, `REMOVE USER`, `ENABLE USER`, `DISABLE USER` are "Buttons"
- In the center, below the "Buttons" there's the section for the application's allerts
- In the center of the page there's a table where check all clients and client statuses

## How to use 

> `Name` field is used for all operations
> `Start Date`, `End Date`Fields are used only for "add new user" operation
> To create a "always allowed" user, insert a far away date as "End Date"

### Add a new user 

- Complete `Name`, `Start Date` and `End Date` fields
- Press `ADD USER` button 

### Remove an user 

- write the name of the user to remove in `name` field
- Press `REMOVE USER` button 

### Enable an user 

- write the name of the user to enable in `name` field
- Press `ENABLE USER` button
- **Is not possible enable a user the have his "End date" expired.**
  To do this, remove the user and adding it with updated dates.

### Disable an user 

- write the name of the user to disable in `name` field
- Press `DISABLE USER` button 



