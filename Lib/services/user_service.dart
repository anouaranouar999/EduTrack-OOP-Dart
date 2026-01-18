import '../../repository.dart';
import '../models/user.dart';
import 'user_stream.dart';

mixin logGable {
  void log(String message) {
    print("[LOG] $message");
  }
}

class UserService with logGable {
  final Repository<User> _repository = Repository<User>();
  final UserStream _userStream;

  UserService(this._userStream);

  void addUser(User user) {
    _repository.add(user);
    _userStream.notifyUser(user);
    log("User ${user.name} added");
  }

  List<User> getUsers() {
    return _repository.getAll();
  }

  User? findUser(int id) {
    return _repository.find((user) => user.id == id);
  }
}
