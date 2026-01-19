import 'base_service.dart';
import '../models/course.dart';
import '../../repostry.dart';

class CourseSevice extends BaseService<Course> {
  @override
  add(Course item) {
    final Repository<Course> _repository = Repository<Course>();
    _repository.add(item);
  }

  @override
  find(item) {}

  @override
  getAll() {}

  @override
  remove(Course item) {}
}
