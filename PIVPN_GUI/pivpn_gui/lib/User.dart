class User {

  // Fields 
  // Using var type for consistency 
  var name; 
  var subName; 
  var startDate; 
  var endDate; 
  var isDisabled;
  var isAlwaysAllowed; 

  // Constructor
  User(this.name, this.subName, this.startDate, this.endDate, this.isDisabled, this.isAlwaysAllowed);

  // Methods
  String toString(){
    return "Name: ${this.name} Sub Name: ${this.subName} Start Date: ${this.startDate} End Date ${this.endDate} Is Disabled? ${this.isDisabled} Is Always Allowed? ${this.isAlwaysAllowed}";
  }
   
}