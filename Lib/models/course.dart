class Course {
  int? courseId;
  String? title;
  int? teacherId;
  List<String> studentsList = [];

  Course(String title, int teacherId, int courseId) {
    this.title = title;
    this.teacherId = teacherId;
    this.courseId = courseId;
  }

  @override
  String toString() {
    return "Course $title (Id:$courseId)";
  }
}
