import 'Database.dart';
import 'User.dart';

class Mediator {
    // Fields
    Database myDatabase = Database.instance;

    // Methods 

    // Add Users 
    void AddUser(var name, var subName, var startDate, var endDate, var isDisabled, var isAlwaysAllowed)
    {
        this.myDatabase.AddUser(name + "-" + subName, new User(name, subName, startDate, endDate, isDisabled, isAlwaysAllowed));

        // Here the part where add user to PIVPN CLI 
    }

    // Remove User 
    void RemoveUser(String name)
    {
        this.myDatabase.RemoveUser(name);

        // Here the part where reamove user to PIVPN CLI
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
        this.myDatabase.AddUser(name, this.myDatabase.GetUser(name.))
    }

}