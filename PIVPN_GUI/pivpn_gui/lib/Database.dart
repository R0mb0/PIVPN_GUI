import 'dart:io';
import 'User.dart';
import 'dart:convert';

class Database {

  // Fields 
  var database = Map<String, User?>();
  var myDatabaseFile = File('database.txt');
  
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

 //-------------------------------------------------------------------------------------
 //Functions to write a file 
  
 //
 // -------------------------------------------------------------------------------------

 // Method to write informations from database into a file 
 void SaveDatabase()
 {
  this.myDatabaseFile.writeAsString("Ciao Stronzo");
  print("Ho scritto nel database");
 }

  // Method to load informations from database file
 Future<void> LoadDatabase()
 async {
  //this.database = json.decode(myDatabaseFile.readAsString() as String);
  print(await this.myDatabaseFile.readAsString());
 }

}