import 'dart:async';
import '../models/user.dart';

class UserStream {
  final StreamController<User> _controller =
      StreamController<User>.broadcast();

  void notifyUser(User user) {
    _controller.add(user);
  }

  Stream<User> get stream {
    return _controller.stream;
  }

  void dispose() {
    _controller.close();
  }
}
