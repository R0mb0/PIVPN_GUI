import 'dart:ffi';

class User {

  // Fields 
  // Using var type for consistency 
  String name; 
  String subName; 
  DateTime startDate; 
  DateTime endDate; 
  Bool isDisabled;
  Bool isAlwaysAllowed; 

  // Constructor
  User(this.name, this.subName, this.startDate, this.endDate, this.isDisabled, this.isAlwaysAllowed);

  // Set and Get Methods 

  String GetName()
  {
    return this.name;
  }

  void SetName(String name)
  {
    this.name = name;
  }

  String GetSubName()
  {
    return this.subName;
  }

  void SetSubName(String subname)
  {
    this.subName = subname; 
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

  Bool GetIsDisabled()
  {
    return this.isDisabled;
  }

  void SetIsDisabled(Bool isDisabled)
  {
    this.isDisabled = isDisabled;
  }

  Bool GetIsAlwaysAllowed()
  {
    return this.isAlwaysAllowed;
  }

  void SetIsAlwaysAllowed(Bool isAlwaysAllowed)
  {
    this.isAlwaysAllowed = isAlwaysAllowed;
  }

  // Methods
  String toString(){
    return "Name: ${this.name} Sub Name: ${this.subName} Start Date: ${this.startDate} End Date ${this.endDate} Is Disabled? ${this.isDisabled} Is Always Allowed? ${this.isAlwaysAllowed}";
  }
   
}