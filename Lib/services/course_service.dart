import '../models/student.dart';
import '../models/user.dart';
import 'base_service.dart';
import '../models/course.dart';
import '../../repository.dart';

class CourseService extends BaseService<Course> {
  final Repository<Course> _repository = Repository<Course>();

  @override
  add(Course item) {
    _repository.add(item);
    print("Course ${item.title} added.");
  }

  @override
  Course? find(int id) {
    return _repository.find((course) => course.courseId == id);
  }

  @override
  List<Course> getAll() {
    return _repository.getAll();
  }

  @override
  remove(Course item) {
    _repository.remove(item);
  }

  int courseId = 0;
  addCourse(String name, int teacherId) {
    Course course = Course(name, teacherId, courseId);
    add(course);
    courseId++;
  }

  enrollStudent(Student student, int courseId) {
    student.enroll(courseId);
  }

  Course? findCourse(int courseId) {
    return find(courseId);
  }
}
