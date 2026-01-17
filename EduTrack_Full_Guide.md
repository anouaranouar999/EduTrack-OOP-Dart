# EduTrack --- OOP Team Project Guide

# دليل مشروع EduTrack لتعلم OOP

------------------------------------------------------------------------

# 🇬🇧 English Version

## 1. Project Idea

EduTrack is a mini school management system built using Dart and OOP
principles.\
The goal is to learn OOP by building a real system, not just watching
tutorials.

The system manages: - Users (Students, Teachers) - Courses -
Enrollment - Grades - Notifications - Async Storage - Streams

------------------------------------------------------------------------

## 2. Architecture

    lib/
     ├── models/
     ├── repositories/
     ├── services/
     ├── streams/
     ├── storage/
     ├── utils/
     └── main.dart

------------------------------------------------------------------------

## 3. User System

### abstract class User

Represents any person in the system.

Fields: - \_id : unique identifier. - \_name : user name. - \_email :
email address.

Methods:

-   String get role\
    Returns the role of the user (Student / Teacher).\
    Used in menu and display logic.

-   void displayInfo()\
    Prints formatted user information.\
    Used when listing users or searching.

-   double calculateScore()\
    Calculates the user score.\
    For students: average grades.\
    For teachers: can return 0 or statistics.

------------------------------------------------------------------------

### class Student extends User

Fields: - \_courseIds : list of enrolled courses. - \_grades :
map(courseId -\> grade).

Methods:

-   enroll(courseId)\
    Registers the student in a course and prevents duplicates.

-   addGrade(courseId, grade)\
    Adds or updates the grade of a course.

-   calculateScore()\
    Returns the average of all grades.

-   displayInfo()\
    Shows student info + average.

------------------------------------------------------------------------

### class Teacher extends User

Fields: - \_teachingCourses

Methods:

-   assignGrade(Student s, courseId, grade)\
    Calls s.addGrade() to assign grades.

-   displayInfo()\
    Shows teacher info and number of courses.

------------------------------------------------------------------------

## 4. Factory Constructor

factory User.create(type, data)

Creates objects dynamically: - student -\> Student - teacher -\> Teacher

Used when loading data or menu creation.

------------------------------------------------------------------------

## 5. Repository`<T>`{=html}

Generic storage system.

Methods: - add(item) - remove(item) - getAll() - find(predicate)

Used by services to avoid direct list management.

------------------------------------------------------------------------

## 6. Services

Services control logic between models and UI.

UserService: - addUser() - findUser() - getUsers()

CourseService: - addCourse() - enrollStudent() - findCourse()

Controllers decide how data flows.

------------------------------------------------------------------------

## 7. Async Storage

Fake database using Future.

Example: - loadUsers() - saveUsers()

Uses Future.delayed to simulate IO.

------------------------------------------------------------------------

## 8. Stream System

StreamController used to notify: - user added - course added

Used for real-time events.

------------------------------------------------------------------------

## 9. Controller Concept

Controller manages the app flow.

AppController: - start() - seedData() - handleMenu()

It connects menu with services and logic.

------------------------------------------------------------------------

## 10. Task Division

### Anouar

-   User, Student, Teacher
-   Factory Constructor
-   Repository`<T>`{=html}
-   UserService
-   UserStream
-   UserStorage

### Adam

-   Course
-   BaseService
-   CourseService
-   CourseStorage
-   EnrollmentException
-   Statistics

### Shared

-   Menu
-   AppController
-   main.dart

------------------------------------------------------------------------

# 🇲🇦 النسخة العربية

## 1. فكرة المشروع

EduTrack هو نظام مصغر لإدارة مدرسة باستعمال Dart و OOP.\
الهدف هو التعلم بالتطبيق وليس فقط بالمشاهدة.

النظام يدير: - المستخدمين - المواد - التسجيل - النقاط - الإشعارات -
التخزين غير المتزامن - Stream

------------------------------------------------------------------------

## 2. المعمارية

    lib/
     ├── models/
     ├── repositories/
     ├── services/
     ├── streams/
     ├── storage/
     ├── utils/
     └── main.dart

------------------------------------------------------------------------

## 3. نظام المستخدمين

### abstract class User

يمثل أي شخص داخل النظام.

Attributes: - \_id : رقم فريد. - \_name : اسم المستخدم. - \_email :
البريد الإلكتروني.

Methods:

-   String get role\
    ترجع نوع المستخدم (طالب أو أستاذ).\
    تستعمل في menu والعرض.

-   void displayInfo()\
    تعرض معلومات المستخدم بشكل منظم.

-   double calculateScore()\
    تحسب معدل الطالب أو قيمة افتراضية للأستاذ.

------------------------------------------------------------------------

### class Student extends User

Fields: - \_courseIds : المواد المسجل فيها. - \_grades : ربط المادة
بالنقطة.

Methods:

-   enroll(courseId)\
    تسجيل الطالب في مادة ومنع التكرار.

-   addGrade(courseId, grade)\
    إضافة أو تحديث نقطة.

-   calculateScore()\
    حساب المتوسط العام.

-   displayInfo()\
    عرض معلومات الطالب والمعدل.

------------------------------------------------------------------------

### class Teacher extends User

Fields: - \_teachingCourses

Methods:

-   assignGrade(Student s, courseId, grade)\
    إعطاء نقطة لطالب.

-   displayInfo()\
    عرض معلومات الأستاذ.

------------------------------------------------------------------------

## 4. Factory Constructor

User.create(type, data)

يصنع object حسب النوع تلقائياً.

------------------------------------------------------------------------

## 5. Repository`<T>`{=html}

نظام تخزين عام باستعمال Generics.

Methods: - add - remove - getAll - find

يساعد على تنظيم البيانات.

------------------------------------------------------------------------

## 6. Services

الـ Service يتحكم في منطق النظام.

UserService: - إضافة مستخدم - البحث - العرض

CourseService: - إضافة مادة - تسجيل طالب - البحث

------------------------------------------------------------------------

## 7. Async Storage

تخزين وهمي باستعمال Future.

مثل: - loadUsers - saveUsers

يمثل التعامل مع قواعد البيانات.

------------------------------------------------------------------------

## 8. Stream

يستعمل لإرسال إشعار عند: - إضافة مستخدم - إضافة مادة

------------------------------------------------------------------------

## 9. مفهوم Controller

Controller هو عقل التطبيق.

AppController: - start() - seedData() - handleMenu()

يربط menu بالخدمات.

------------------------------------------------------------------------

## 10. تقسيم المهام

### أنور

-   User, Student, Teacher
-   Factory
-   Repository`<T>`{=html}
-   UserService
-   UserStream
-   UserStorage

### آدم

-   Course
-   BaseService
-   CourseService
-   CourseStorage
-   EnrollmentException
-   Statistics

### مشترك

-   Menu
-   AppController
-   main.dart

------------------------------------------------------------------------
