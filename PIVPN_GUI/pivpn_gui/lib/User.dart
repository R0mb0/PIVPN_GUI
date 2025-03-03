import 'dart:ffi';

class User {

  // Fields 
  // Using var type for consistency 
  String name; 
  DateTime startDate; 
  DateTime endDate; 
  bool isEnabled;
  bool isAlwaysAllowed; 

  // Constructor
  User(this.name, this.startDate, this.endDate, this.isEnabled, this.isAlwaysAllowed);

  // Methods
  String toString()
  {
    return "Name: ${this.name} Start Date: ${this.startDate} End Date: ${this.endDate} Is Disabled? ${this.isEnabled} Is Always Allowed? ${this.isAlwaysAllowed}";
  }

  String toDatabase()
  {
    return "${this.name} ${this.startDate} ${this.endDate} ${this.isEnabled} ${this.isAlwaysAllowed}";
  }
   
  String toFile()
  {
    return "${this.name} | ${this.startDate} | ${this.endDate} | ${this.isEnabled} | ${this.isAlwaysAllowed}";
  }
}