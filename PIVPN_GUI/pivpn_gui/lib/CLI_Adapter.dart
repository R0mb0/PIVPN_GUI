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
  print(name);

    try {
      var result = await shell.run("${Directory.current.path}/lib/addUser.sh ${name}"); // Example command
      print(result.outText);
    } catch (e) {
      print('Error: $e');
    }
  }

  // Remove user
  Future<void> RemoveUser(String name) async {
  var shell = Shell();
  print(name);

    try {
      var result = await shell.run("${Directory.current.path}/lib/removeUser.sh ${name}"); // Example command
      print(result.outText);
    } catch (e) {
      print('Error: $e');
    }
  }

  // Get All Users
  Future<String> GetAllUsers()
  async {
    var result = await Process.run('pivpn', ['-l']);
    return result.stdout;
  }

  // Enable user 
  Future<String> EnableUser(String name)
  async {
    var result = await Process.run('pivpn', ['-on', name]);
    return result.stdout;
  }

  // Disable user 
  Future<String> DisableUser(String name)
  async {
    var result = await Process.run('pivpn', ['-off', name]);
    return result.stdout;
  }

  // Update Client
  Future<String> Update(String name)
  async {
    var result = await Process.run('pivpn', ['-up']);
    return result.stdout;
  }
}