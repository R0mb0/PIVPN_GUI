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

  // Methods
  String toString(){
    return "Name: ${this.name} Sub Name: ${this.subName} Start Date: ${this.startDate} End Date ${this.endDate} Is Disabled? ${this.isDisabled} Is Always Allowed? ${this.isAlwaysAllowed}";
  }
   
}