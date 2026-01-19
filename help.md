# Adam's Tasks - EduTrack Project

## 📁 File 1: `lib/models/course.dart`

**Class:** `Course`

**Functions to implement:**
- Constructor with parameters: `id`, `title`, `description`, `teacherId`
- `toString()` - returns course info as string

---

## 📁 File 2: `lib/services/base_service.dart`

**Abstract Class:** `BaseService<T>`

**Functions to implement:**
- `add(T item)` - add item to repository
- `remove(T item)` - remove item from repository
- `getAll()` - get all items
- `find(predicate)` - find specific item using predicate

---

## 📁 File 3: `lib/services/course_service.dart`

**Class:** `CourseService extends BaseService<Course>`

**Functions to implement:**
- `add(Course)` - override from BaseService
- `remove(Course)` - override from BaseService
- `getAll()` - override from BaseService
- `find(predicate)` - override from BaseService
- `addCourse(Course)` - add new course
- `enrollStudent(studentId, courseId)` - enroll student in course
- `findCourse(courseId)` - find course by ID

---

## 📁 File 4: `lib/storage/course_storage.dart`

**Class:** `CourseStorage`

**Functions to implement:**
- `saveCourses(List<Course>)` - async function to save courses (use Future.delayed)
- `loadCourses()` - async function to load courses (use Future.delayed)

---

## 📁 File 5: `lib/utils/enrollment_exception.dart`

**Class:** `EnrollmentException implements Exception`

**Functions to implement:**
- Constructor with `message` parameter
- `toString()` - return error message

---

## 📁 File 6: `lib/utils/statistics.dart`

**Class:** `Statistics`

**Functions to implement:**
- `calculateAverageGrade(List<double>)` - static function to calculate average
- `getCourseStatistics(Course, List<Student>)` - static function to get course statistics
- `displayStatistics()` - static function to display system statistics

---

## Summary

**Total Files:** 6
**Total Functions:** ~15

**Note:** Remember to use `@override` annotation when overriding methods from parent classes!