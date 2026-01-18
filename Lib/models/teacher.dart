import 'user.dart';
import 'student.dart';

class Teacher extends User {
  List<int> _teachingCourses = [];
  Teacher(int id, String name, String email, this._teachingCourses)
    : super(id, name, email);

  @override
  String get role => "Teacher";

  @override
  void displayInfo() {
    print("Id : $id");
    print("Name : $name");
    print("Email : $email");
    print("Role : $role");
    for (var c in _teachingCourses) {
      print("Course: $c");
    }

  }

  @override
  double calculateScore() {
  return 0;
  }


  void assignGrade(Student student, int courseId, double grade) {
    if (_teachingCourses.contains(courseId)) {
      student.addGrade(courseId, grade);
    } else {
      print("You don't teach this course");
    }
  }

  void addCourse(int teachingCourse) {
      if (_teachingCourses.contains(teachingCourse)) {
        print("Course already exists");
      } else {
        _teachingCourses.add(teachingCourse);
      }
    }
}
