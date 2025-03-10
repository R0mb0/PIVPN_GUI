# Application modules UML

At the moment the project doesn't involves to manage a lot of users, for this reason, will not be 
used a database to archieve them.

## Functionality implemented

From the GUI is possible to:

- Add new users and set a "time to be enabled" for their connections (for example: Marco
   can use the VPN for 20 days)
- Retreive for every user the configuration file for the VPN
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
