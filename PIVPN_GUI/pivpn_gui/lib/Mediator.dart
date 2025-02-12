import 'Database.dart';
import 'User.dart';
import 'CLI_Adapter.dart';

class Mediator {
    // Fields
    Database myDatabase = Database.instance;
    CLI_Adapter cli_adapter = new CLI_Adapter();

    //Builder
    Mediator();

    // Methods 

    // Add Users 
    void AddUser(var name, var startDate, var endDate, var isDisabled, var isAlwaysAllowed)
    {
        this.myDatabase.AddUser(name, new User(name, startDate, endDate, isDisabled, isAlwaysAllowed));

        // Here the part where add user to PIVPN CLI 
        //this.cli_adapter.AddUser(name);
    }

    // Remove User 
    void RemoveUser(String name)
    {
        this.myDatabase.RemoveUser(name);

        // Here the part where reamove user to PIVPN CLI
        //this.cli_adapter.RemoveUser(name);
    }

    // Get User
    User? GetUser(String name)
    {
        return this.myDatabase.GetUser(name);
    }

    // Get All users 
    Set<User> GetAllUsers()
    {
        return this.myDatabase.GetAllUsers();
    }

    //Enable user 
    void EnableUser(String name)
    { 
      User? temp  = this.myDatabase.GetUser(name);
      temp?.SetIsDisabled(false as bool);

        this.myDatabase.AddUser(name, temp);

        //this.cli_adapter.EnableUser(name);
    }

    //Disable user 
    void DisableUser(String name)
    { 
      User? temp  = this.myDatabase.GetUser(name);
      temp?.SetIsDisabled(true as bool);

        this.myDatabase.AddUser(name, temp);

        //this.cli_adapter.DisableUser(name);
    }

    // Save database
    void SaveDatabase()
    {
      this.myDatabase.SaveDatabase();
    }

    // Load database
    void LoadDatabase()
    {
      this.myDatabase.LoadDatabase();
    }

}