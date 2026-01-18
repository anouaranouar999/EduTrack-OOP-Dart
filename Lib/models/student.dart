import 'user.dart';

class Student extends User {
  List<int> _courseIds = [];
  Map<int, double> _grades = {};

  Student(int id, String name, String email) : super(id, name, email);
  @override
  get role => "Student";

  @override
  void displayInfo() {
    print("Id : $id");
    print("Name : $name");
    print("Email : $email");
    print("Role : $role");
    for (var courseId in _courseIds) {
      print("Course : $courseId, Grades :${_grades[courseId]}");
    }

    print("Average score : ${calculateScore()}");
  }

  @override
  double calculateScore() {
    if (_grades.isNotEmpty) {
      double total = _grades.values.reduce((sum, value) => sum + value);
      int count = _courseIds.length;
      return total / count;
    } else {
      return 0.0;
    }
  }

  void enroll(int courseId) {
    if (_courseIds.contains(courseId)) {
      print("this already exists");
    } else {
      _courseIds.add(courseId);
      _grades[courseId] = 0.0;
    }
  }

  void addGrade(int courseId, double grade) {
    if (_courseIds.contains(courseId)) {
      _grades[courseId] = grade;
    } else {
      print("Student not enrolled in this course");
    }
  }
}
