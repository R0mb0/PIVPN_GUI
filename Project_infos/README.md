# Application modules UML

At the moment the project doesn't involves to manage a lot of users, for this reason, will not be 
used a database to archieve them.

## Functionality implemented

From the GUI is possible to:

- Add new users and set a "time to be enabled" for their connections (for example: Marco
   can use the VPN for 20 days)
- Retreive user vpn connection qr-code
- Automatcly disable users with time to be enabled = 0
- Display users status
- Manualy remove/disable Users

 ## UML scheme

 ``` mermaid

 ---
 title: PIVPN_GUI
 ---
 classDiagram

note for Mediator "myValue is a temp varaible used to save the database state to file"
Mediator <|-- GUI
note for TimeModule "It disable users that have terminated their time to be enabled. It is a thread inside the main file"
TimeModule <|-- GUI
CLI_Adapter <|-- Mediator
Database <|-- Mediator
User <|-- Database

  class User{
        +String name
        +Date startDate
        +Date endDate
        +Boolean isEnabled
        +Boolean isAlwaysAllowed
        +User()
        +toString()
        +toDatabase()
        +toFile() 
    }

     class Database{
        -Database database
        -File myDatabaseFile
        -List<DataRow> myValue
        +Database._privateConstructor()
        +AddUser(String name, User? user)
        +RemoveUser(String name)
        +GetUser(String name)
        +GetAllUsers()
        +GetDatabase()
        +SaveDatabase()
        +LoadDatabase()
    }

     class CLI_Adapter{
        +CLI_Adapter()
        +AddUser(String name)
        +RemoveUser(String name)
        +GetAllusers()
        +EnableUser(String name)
        +DisableUser(String name)
        +Update()
    }

    class Mediator{
        +Mediator()
        +AddUser(var name, var startDate, var endDate, var isEnabled, var isAlwaysAllowed)
        +RemoveUser(String name)
        +GetUser(String name)
        +GetAllusers()
        +EnableUser(String name)
        +DisableUser(String name)
        +GetDatabase()
        +SaveDatabase()
        +LoadDatabase()
    }

    class TimeModule{
        +Start()
        +Stop()
    }

    class GUI{
    }

 ```

## Libraries used
- `package:flutter/material.dart` -> default
- `dart:async` -> for thread manage
- `dart:isolate` -> for thread manage
- `dart:io` -> for saving to file 
- `package:process_run/shell.dart` -> to interact with shell
- `dart:ffi` -> for memory allocation 

## Interface description  

<div align="center">
 <img width="90%"  height="90%" src="https://github.com/R0mb0/PIVPN_GUI/blob/main/Project_infos/Pivpn_gui.png">
</div>
<br><br>

- `Name`, `Start Date`, `End Date` are "Text Fields"
- `Is always allowed?` is a "Check Box" (false as default)
- `ADD USER`, `REMOVE USER`, `ENABLE USER`, `DISABLE USER`, `SAVE DATABASE`, `LOAD DATABASE` are "Buttons"
- In the center, below the "Buttons" there's the section for the application's allerts
- In the center of the page there's a table where check all clients and client statuses

## Last added functionality

- Every user operation trigger the saving database event. 
-  Remove "always enabled" user, because this condiction could be reached with a far away date
  - Remove "is always enabled checkbox" and the table column
- A user with "not time to live" could not be enabled
