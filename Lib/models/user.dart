import 'student.dart';
import 'teacher.dart';

abstract class User {
  int _id;
  String _name;
  String _email;

  User(this._id, this._name, this._email);

  factory User.create(int id, String name, String email, String role) {
    if (role.toLowerCase() == "teacher") {
      return Teacher(id, name, email, []);
    } else if (role.toLowerCase() == "student") {
      return Student(id, name, email);
    } else {
      throw Exception("Unknown role");
    }
  }

  String get role;

  // Public getters for private fields
  int get id => _id;
  String get name => _name;
  String get email => _email;

  set name(String value) {
    if (value.trim().isEmpty) {
      throw Exception("Name cannot be empty");
    } else {
      _name = value;
    }
  }

  set email(String value) {
    if (value.contains("@")) {
      _email = value;
    } else {
      throw Exception("Email must contain '@'");
    }
  }

  void displayInfo() {
    print("Name : $name");
    print("Id : $id");
    print("Email : $email");
    print("Role : $role");
  }

  double calculateScore();
}
