import 'Lib/models/user.dart';
import 'Lib/models/course.dart';

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

class CourseStorage {
  List<Course> _courses = [];
  Future<List<Course>> loadCourses() async {
    await Future.delayed(Duration(seconds: 3));
    return _courses;
  }

  Future<void> saveCoures(List<Course> courses) async {
    await Future.delayed(Duration(seconds: 3));
    _courses = courses;
    print("Courses saved successfully");
  }
}
