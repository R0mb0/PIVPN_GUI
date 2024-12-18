# Application modules UML

I wanna treat the graphic part as a layer that interact with the others modules of the application,
for this reason it will not be analyzed in this paper.

At the moment the project doesn't involves to manage a lot of users, for this reason, will not be 
used a database to archieve them.

## Functionality to implement

From the GUI I must be able to:

- Add new users and set a Time-To-Live for their connections (for example: Marco
   can use the VPN for 20 days)
- Retreive for every user the configuration file for the VPN
- Automatcly disable users with Time-To-Live = 0
- Display users status
- Manualy remove/disable Users

 ## UML scheme

 ``` mermaid

 ---
 title: PIVPN_GUI
 ---
 classDiagram

GUI <|-- Mediator
note for TimeModule "It disable users that have terminated their Time-To-Live. It could be a thread"
GUI <|-- TimeModule
CLI_Adapter <|-- Mediator
Database <|-- Mediator
User <|-- Database

  class User{
        +String name
        +String subName
        +Date startDate
        +Date endDate
        +Boolean isDisabled
        +Boolean isAlwaysAllowed
        +GetInfos()
    }

     class Database{
        +AddUser()
        +RemoveUser()
        +GetUser()
        +GetAllUsers()
        +SaveDatabase()
        +LoadDatabase()
        -Dictionary users
        -Serialize()
        -Deserialize()
    }

     class CLI_Adapter{
        +AddUser()
        +RemoveUser()
        +GetAllusers()
        +EnableUser()
        +DisableUser()
    }

    class Mediator{
        +AddUser()
        +RemoveUser()
        +GetUser()
        +GetAllusers()
        +EnableUser()
        +DisableUser()
        +SaveDatabase()
        +LoadDatabase()
    }

    class TimeModule{
        +Start()
        +Stop()
        +End()
    }

    class GUI{
    }

 ```
