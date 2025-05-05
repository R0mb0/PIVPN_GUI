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
    //String AddUser(var name, var startDate, var endDate, var isEnabled, var isAlwaysAllowed)
    String AddUser(var name, var startDate, var endDate, var isEnabled)
    { 
      //String temp = this.myDatabase.AddUser(name, new User(name, startDate, endDate, isEnabled, isAlwaysAllowed));
      String temp = this.myDatabase.AddUser(name, new User(name, startDate, endDate, isEnabled));
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

      //if(temp?.isAlwaysAllowed == true){
      //  return("the user is unenabled!");
      //}

      if (temp?.isEnabled == false){

        if(DateTime.now().isBefore(temp!.endDate)){
          temp?.isEnabled = true as bool;

          this.myDatabase.AddUser(name, temp);
          this.cli_adapter.EnableUser(name);

        return("User has been enabled!");
        }else{
          return("The user could not be enabled!");
        }
      }else{
        return("The user is already enabled!");
      }
    }

    //Disable user 
    String DisableUser(String name)
    { 
      User? temp  = this.myDatabase.GetUser(name);

      //if(temp?.isAlwaysAllowed == true){
      //  return("The user is not deactivateable!");
      //}

      if (temp?.isEnabled == true){
        temp?.isEnabled = false as bool;

        this.myDatabase.AddUser(name, temp);
        this.cli_adapter.DisableUser(name);

        return("User has been disabled!");
      }else{
        return("The user is already disabled!");
      }
      
    }

    // Function to geto database for the table
    List<DataRow> GetDatabase()
    {
      return this.myDatabase.GetDatabase();
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