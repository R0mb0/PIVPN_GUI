import 'dart:ffi';

class User {

  // Fields 
  // Using var type for consistency 
  String name; 
  DateTime startDate; 
  DateTime endDate; 
  bool isDisabled;
  bool isAlwaysAllowed; 

  // Constructor
  User(this.name, this.startDate, this.endDate, this.isDisabled, this.isAlwaysAllowed);

  // Set and Get Methods 

  String GetName()
  {
    return this.name;
  }

  void SetName(String name)
  {
    this.name = name;
  }

  DateTime GetStartDate()
  {
    return this.startDate;
  }

  void SetStartDate(DateTime startDate)
  {
    this.startDate = startDate;
  }

  DateTime GetEndDate()
  {
    return this.endDate;
  }

  void SetEndDate(DateTime endDate)
  {
    this.endDate = endDate;
  }

  bool GetIsDisabled()
  {
    return this.isDisabled;
  }

  void SetIsDisabled(bool isDisabled)
  {
    this.isDisabled = isDisabled;
  }

  bool GetIsAlwaysAllowed()
  {
    return this.isAlwaysAllowed;
  }

  void SetIsAlwaysAllowed(bool isAlwaysAllowed)
  {
    this.isAlwaysAllowed = isAlwaysAllowed;
  }

  // Methods
  String toString()
  {
    return "Name: ${this.name} Start Date: ${this.startDate} End Date: ${this.endDate} Is Disabled? ${this.isDisabled} Is Always Allowed? ${this.isAlwaysAllowed}";
  }
   
  String toFile()
  {
    return "${this.name} | ${this.startDate} | ${this.endDate} | ${this.isDisabled} | ${this.isAlwaysAllowed}";
  }
}