import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';

import 'User.dart';
import 'dart:convert';

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

  // Not adding tests here because checking every interaction is heavy
  // Add a user into database
  void AddUser(String name, User? user)
  {
    this.database[name] = user;
  }

  // Remove user from database
  void RemoveUser(String name)
  {
    this.database.remove(name);
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
  List<DataRow> getDatabase()
  {
    this.database.forEach((i, value){
      this.myValue.add(DataRow(cells: [DataCell(Text(value!.name)), DataCell(Text(value.startDate.toString().split(" ")[0])), DataCell(Text(value.endDate.toString().split(" ")[0])), DataCell(Text(value.isDisabled.toString())), DataCell(Text(value.isAlwaysAllowed.toString()))]));
    });
    return myValue;
  }

 // Method to write informations from database into a file 
 String SaveDatabase()
 {
  //this.myDatabaseFile.writeAsString("Ciao Stronzo");
  this.database.forEach((i, value){
    this.myDatabaseFile.writeAsString("${i} ${value?.toDatabase()}\n");
    //print("${i} ${value?.toDatabase()}\n");
  });
  return ("Wrote database!");
 }

  // Method to load informations from database file
 Future<String> LoadDatabase()
 async {
  List<String> my_string_database = await this.myDatabaseFile.readAsLines();

  Future.forEach(my_string_database, (value){
    final List data = value.split(" ");
    this.database[data[0]] = new User(data[1], DateTime.parse(data[2]), DateTime.parse(data[4]), bool.parse(data[6]), bool.parse(data[7]));
  });

  return ("Loaded database!");
 }

}