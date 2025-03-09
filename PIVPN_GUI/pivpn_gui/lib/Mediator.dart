import 'package:flutter/material.dart';

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
    String AddUser(var name, var startDate, var endDate, var isEnabled, var isAlwaysAllowed)
    { 
      String temp = this.myDatabase.AddUser(name, new User(name, startDate, endDate, isEnabled, isAlwaysAllowed));
      if(temp != "The username has already been used!"){
        this.cli_adapter.AddUser(name);
      }
      return temp;        
    }

    // Remove User 
    String RemoveUser(String name)
    { 
      String temp =this.myDatabase.RemoveUser(name);
      if(temp != "The user doesn't exist!"){
          this.cli_adapter.RemoveUser(name);
      }
      return temp;
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
    String EnableUser(String name)
    { 
      User? temp  = this.myDatabase.GetUser(name);
      temp?.isEnabled = true as bool;

      this.myDatabase.AddUser(name, temp);

      return("User has been enabled!");

        //this.cli_adapter.EnableUser(name);
    }

    //Disable user 
    String DisableUser(String name)
    { 
      User? temp  = this.myDatabase.GetUser(name);
      temp?.isEnabled = false as bool;

      this.myDatabase.AddUser(name, temp);

     return("User has been disabled!");
    }

    // Function to geto database for the table
    List<DataRow> getDatabase()
    {
      return this.myDatabase.getDatabase();
    }

    // Save database
    String SaveDatabase()
    {
      return this.myDatabase.SaveDatabase();
    }

    // Load database
    Future<String> LoadDatabase()
    {
      return this.myDatabase.LoadDatabase();
    }

}