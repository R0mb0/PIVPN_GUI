import 'dart:io';
import 'package:process_run/shell.dart';

class CLI_Adapter 
{
  //Builder
  CLI_Adapter();

  // Methods
  
  // Add user 
  Future<void> AddUser(String name) async {
  var shell = Shell();

    try {
      var result = await shell.run("${Directory.current.path}/lib/addUser.sh ${name}");
      print(result.outText);
    } catch (e) {
      print('Error: $e');
    }
  }

  // Remove user
  Future<void> RemoveUser(String name) async {
  var shell = Shell();

    try {
      var result = await shell.run("${Directory.current.path}/lib/removeUser.sh ${name}");
      print(result.outText);
    } catch (e) {
      print('Error: $e');
    }
  }

  // Get All Users
 Future<void> GetAllUsers() async {
  var shell = Shell();

    try {
      var result = await shell.run("${Directory.current.path}/lib/listUsers.sh");
      print(result.outText);
    } catch (e) {
      print('Error: $e');
    }
  }

  // Enable user 
  Future<void> EnableUser(String name) async {
  var shell = Shell();

    try {
      var result = await shell.run("${Directory.current.path}/lib/enableUser.sh ${name}");
      print(result.outText);
    } catch (e) {
      print('Error: $e');
    }
  }

 // Disable user 
  Future<void> DisableUser(String name) async {
  var shell = Shell();

    try {
      var result = await shell.run("${Directory.current.path}/lib/disableUser.sh ${name}");
      print(result.outText);
    } catch (e) {
      print('Error: $e');
    }
  }
  // Update Client
  Future<void> Update() async {
  var shell = Shell();

    try {
      var result = await shell.run("${Directory.current.path}/lib/update.sh");
      print(result.outText);
    } catch (e) {
      print('Error: $e');
    }
  }
}