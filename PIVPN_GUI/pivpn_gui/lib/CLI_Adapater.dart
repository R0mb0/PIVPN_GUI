import 'dart:io';

class CliAdapater 
{
  

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
    var result = await Process.run('pivpn', ['-r', '-n', name]);
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
    var result = await Process.run('pivpn', ['-on', '-n', name]);
    return result.stdout;
  }

  // Disable user 
  Future<String> DisableUser(String name)
  async {
    var result = await Process.run('pivpn', ['-off', '-n', name]);
    return result.stdout;
  }

  // Update Client
  Future<String> Update(String name)
  async {
    var result = await Process.run('pivpn', ['-up']);
    return result.stdout;
  }
}