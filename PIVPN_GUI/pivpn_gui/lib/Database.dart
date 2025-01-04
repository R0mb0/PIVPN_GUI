import 'User.dart';

class Database {

  // Fields 
  var database = Map<String, User>();
  
  // Using singleton pattern 
  Database._privateConstructor();
  static final Database myDAtabase = Database._privateConstructor();
  // Static method 
  static Database get instance
  {
    return myDAtabase;
  }

  // Not adding tests here because checking every interaction is heavy
  // Add a user into database
  void AddUser(String name, User user)
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
  List GetAllUsers()
  {
    var temp = <User>{};
    this.database.forEach((name, user){
      temp.add(user);
    });

    return temp;
  }

}