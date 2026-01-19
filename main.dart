import 'dart:io';
import 'Lib/models/user.dart';
import 'Lib/models/student.dart';
import 'Lib/models/teacher.dart';
import 'Lib/models/course.dart';
import 'Lib/services/user_service.dart';
import 'Lib/services/course_service.dart';
import 'Lib/services/user_stream.dart';
import 'storage.dart';

void main() async {
  // Storage
  UserStorage storage = UserStorage();

  // Stream
  UserStream userStream = UserStream();

  // Services
  UserService userService = UserService(userStream);
  CourseService courseService = CourseService();

  // Load users from storage
  List<User> loadedUsers = await storage.loadUsers();
  for (var user in loadedUsers) {
    userService.addUser(user);
  }

  // Listen to user stream
  userStream.stream.listen((user) {
    print("[STREAM] User ${user.name} added");
  });

  bool running = true;

  while (running) {
    print("\n=== EduTrack Menu ===");
    print("1. Add User");
    print("2. Show Users");
    print("3. Find User");
    print("4. Add Course");
    print("5. Enroll Student");
    print("6. Assign Grade");
    print("7. Show Student Statistics");
    print("0. Exit");

    stdout.write("Choose: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case "1":
        stdout.write("ID: ");
        int id = int.parse(stdin.readLineSync()!);

        stdout.write("Name: ");
        String name = stdin.readLineSync()!;

        stdout.write("Email: ");
        String email = stdin.readLineSync()!;

        stdout.write("Role (student / teacher): ");
        String role = stdin.readLineSync()!;

        try {
          User user = User.create(id, name, email, role);
          userService.addUser(user);
          await storage.saveUsers(userService.getUsers());
          print("User added successfully");
        } catch (e) {
          print("Error: $e");
        }
        break;

      case "2":
        var users = userService.getUsers();
        if (users.isEmpty) {
          print("No users found");
        } else {
          for (var u in users) {
            print("------------");
            u.displayInfo();
          }
        }
        break;

      case "3":
        stdout.write("Enter User ID: ");
        int id = int.parse(stdin.readLineSync()!);
        User? user = userService.findUser(id);
        if (user != null) {
          user.displayInfo();
        } else {
          print("User not found");
        }
        break;

      case "4":
        stdout.write("Course name: ");
        String name = stdin.readLineSync()!;
        stdout.write("Teacher's Id: ");
        int teacherId = int.parse(stdin.readLineSync()!);
        await courseService.addCourse(name, teacherId);
        print("Course added successfully (placeholder)");
        break;

      case "5":
        stdout.write("Student ID: ");
        int studentId = int.parse(stdin.readLineSync()!);

        stdout.write("Course ID: ");
        int courseId = int.parse(stdin.readLineSync()!);

        var student = userService.findUser(studentId);
        if (student == null || student.role != "Student") {
          print("Student not found");
          break;
        }

        // TODO: Uncomment after Adam finishes CourseService methods
        try {
          await courseService.enrollStudent(student as Student, courseId);
          print("${student.name} enrolled in course $courseId");
        } catch (e) {
          print("Error: $e");
        }
        print("${student.name} enrolled in course $courseId (placeholder)");
        break;

      case "6":
        stdout.write("Teacher ID: ");
        int teacherId = int.parse(stdin.readLineSync()!);

        stdout.write("Student ID: ");
        int studentId = int.parse(stdin.readLineSync()!);

        stdout.write("Course ID: ");
        int courseId = int.parse(stdin.readLineSync()!);

        stdout.write("Grade: ");
        double grade = double.parse(stdin.readLineSync()!);

        var teacher = userService.findUser(teacherId);
        var student = userService.findUser(studentId);

        if (teacher == null || teacher.role != "Teacher") {
          print("Teacher not found");
          break;
        }
        if (student == null || student.role != "Student") {
          print("Student not found");
          break;
        }

        // TODO: Uncomment after Adam finishes Teacher.assignGrade
        (teacher as Teacher).assignGrade(student as Student, courseId, grade);
        print("Grade assigned successfully (placeholder)");
        break;

      case "7":
        var students = userService.getUsers().where((u) => u.role == "Student");
        for (var student in students) {
          print(
            "${student.name} average: ${(student as Student).calculateScore()}",
          );
        }
        break;

      case "0":
        print("Bye 👋");
        running = false;
        userStream.dispose();
        break;

      default:
        print("Invalid choice");
    }
  }
}
