class Course {
  static int courseId = 0;
  String? title;
  int? teacherId;
  List<String> studentsList = [];

  Course(String title, int teacherId) {
    this.title = title;
    this.teacherId = teacherId;
    courseId++;
  }

  @override
  String toString() {
    return "Course $title (Id:$courseId)";
  }
}
