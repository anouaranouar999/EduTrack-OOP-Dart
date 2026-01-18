import 'Lib/models/user.dart';

class UserStorage {
  List<User> _users = [];
  Future<List<User>> loadUsers() async {
    await Future.delayed(Duration(seconds: 3));
    return _users;
  }

  Future<void> saveUsers(List<User> users) async {
    await Future.delayed(Duration(seconds: 3));
    _users = users;
    print("Users saved successfully");
  }
}
