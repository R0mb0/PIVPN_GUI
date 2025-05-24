import 'dart:io';
import 'package:flutter/material.dart';

import 'User.dart';
class Database {

  // Fields 
  var database = Map<String, User?>();
  var myDatabaseFile = File('database.txt');
  List<DataRow> myValue = [DataRow(cells: [DataCell(Text("")), DataCell(Text("")), DataCell(Text("")), DataCell(Text("")), DataCell(Text(""))])];
  
  // Using singleton pattern 
  Database._privateConstructor();
  static final Database myDatabase = Database._privateConstructor();
  // Static method 
  static Database get instance
  {
    return myDatabase;
  }

  // Add a user into database
  String AddUser(String name, User? user)
  { 
    if(name.contains(RegExp(r"\s")))
    {
        return "Invalid name, it containing spaces!";
    }else{
      if(this.database.containsKey(name))
      {
        return "The username has already been used!";
      }else{
        this.database[name] = user;
        return "User added!";
      }
    }
  }

  // Remove user from database
  String RemoveUser(String name)
  {
    if(this.database.containsKey(name))
    {
      this.database.remove(name);
      return "User removed!";
    }else{
      return "The user doesn't exist!";
    }
  }

  // Get user 
  User? GetUser(String name) // Nullable type to avoid errors
  {
    return this.database[name];
  }

  // Get all users
  Set<User> GetAllUsers()
  {
    var temp = <User>{};
    this.database.forEach((name, user){
      temp.add(user!);
    });

    return temp;
  }

  // Fucntion to add data to table 
  List<DataRow> GetDatabase()
  {
    int i = 0;
    this.myValue = []; // Reset last state 
    this.database.forEach((i, value){
      this.myValue.add(DataRow(cells: [DataCell(Text(value!.name)), DataCell(Text(value.startDate.toString().split(" ")[0])), DataCell(Text(value.endDate.toString().split(" ")[0])), DataCell(Text(value.isEnabled.toString()))]));
    });
    return myValue;
  }

 // Method to write informations from database into a file 
 String SaveDatabase()
 {
  String tempString = "";
  this.database.forEach((i, value){
    tempString = tempString + "${i} ${value?.toDatabase()}\n";
  });
  this.myDatabaseFile.writeAsString(tempString);
  return ("Wrote database!");
 }

  // Method to load informations from database file
 Future<String> LoadDatabase()
 async {
  List<String> my_string_database = await this.myDatabaseFile.readAsLines();

  Future.forEach(my_string_database, (value){
    final List data = value.split(" ");
    //this.database[data[0]] = new User(data[1], DateTime.parse(data[2]), DateTime.parse(data[4]), bool.parse(data[6]), bool.parse(data[7]));
    this.database[data[0]] = new User(data[1], DateTime.parse(data[2]), DateTime.parse(data[4]), bool.parse(data[6]));
  });

  return ("Loaded database!");
 }

}