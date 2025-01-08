import 'dart:io';

class CLI_Adapter 
{

  //Builder
  CLI_Adapter();

  // Methods
  
  // Add user 
  Future<String> AddUser(String name)
  async {
    var result = await Process.run('pivpn', ['-a', '-n', name]);
    return result.stdout;
  }

  // Remove user
  Future<String> RemoveUser(String name)
  async {
    var result = await Process.run('pivpn', ['-r', name]);
    return result.stdout;
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