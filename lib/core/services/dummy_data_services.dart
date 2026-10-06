import 'package:e_learning/models/lessons.dart';
import 'package:e_learning/models/questions.dart';
import 'package:e_learning/models/quiz.dart';
import 'package:e_learning/models/quiz_attemps.dart';

import '../../models/chat_message.dart';
import '../../models/course.dart';

class DummyDataServices {
  static final List<Course> courses = [
    Course(
      id: '1',
      title: 'Flutter Developer Bootcamp',
      description: 'Master Flutter and Dart from Scratch. build real-world cross platform apps',
      imageUrl: 'https://i.ytimg.com/vi/z9kOcyk5t8s/maxresdefault.jpg',
      instructorId: 'inst_1',
      catergoryId: '1',
      // programmming
      price: 99.99,
      lessons: _createFlutterLessons(),
      level: 'Intermediate',
      requirements: [
        'Basic Programming',
        'Computer With internet connection',
        'Dedication to learn',
      ],
      whatYouWillLearn: [
        'build beautiful native apps',
        'Master Dart programming',
        'State Management with GetX',
        'Rest Api Integration',
        'Local Data Storage',
      ],
      createdAt: DateTime.now().subtract(Duration(days: 30)),
      updateAt: DateTime.now(),
      rating: 4.8,
      reviewCount: 245,
      enrollmentCount: 1200,
    ),
    Course(
      id: '2',
      title: 'UI/UX Design Masterclass',
      description: 'Learn professional UI/UX design from scratch using figma and Adobe XD',
      imageUrl: 'https://img.magnific.com/free-vector/gradiant-ui-ux-background_23-2149024129.jpg',
      instructorId: 'inst_2',
      catergoryId: '2',
      // Design
      price: 79.99,
      lessons: _createDesignLessons(),
      level: 'Beginner',
      requirements: [
        'No prior experience needed',
        'figma (free account)',
        'creative mindset',
      ],
      whatYouWillLearn: [
        'Design personal and theory',
        'User research methods',
        'Wireframing and prototyping',
        'Design System',
        'Protifiolo building',
      ],
      createdAt: DateTime.now().subtract(Duration(days: 45)),
      updateAt: DateTime.now(),
      rating: 4.6,
      reviewCount: 189,
      enrollmentCount: 890,
      isPremium: true,
    ),
    Course(
      id: '3',
      title: 'Digital Marketing Essentials',
      description: 'Master digital marketing strategies for business growth',
      imageUrl: 'https://img.magnific.com/free-vector/language-learning-conecpt-illustration_114360-6565.jpg',
      instructorId: 'inst_3',
      catergoryId: '3',
      // bussiness
      price: 89.99,
      lessons: _createMarketingLessons(),
      level: 'Intermediate',
      requirements: [
        'Basic Marketing Knowledge',
        'Social media marketing',
        'Google analytics account',
      ],
      whatYouWillLearn: [
        'SEO optimization',
        'social media marketing ',
        'Email campaius ',
        'Google analytics',
        'Content marketing',
      ],
      createdAt: DateTime.now().subtract(Duration(days: 15)),
      updateAt: DateTime.now(),
      rating: 4.7,
      reviewCount: 156,
      enrollmentCount: 750,
    ),
    Course(
      id: '4',
      title: 'Advanced Mobile App Architure',
      description: 'Learn advanced architectural patterns and best practices for mobile app development',
      imageUrl: 'https://i.ytimg.com/vi/z9kOcyk5t8s/maxresdefault.jpg',
      instructorId: 'inst_4',
      catergoryId: '1',
      // programmming
      price: 129.99,
      lessons: _createArchitectureLessons(),
      level: 'Advanced',
      requirements: [
        'Intermediate Programming Knowledge',
        'Basic Mobile Development experience',
        'Understanding of design patterns',
      ],
      whatYouWillLearn: [
        'clean architectural principles',
        'Solid principle in mobile development',
        'State Management patterns',
        'Dependency Integration',
        'Unit testing and TDD',
      ],
      createdAt: DateTime.now().subtract(Duration(days: 10)),
      updateAt: DateTime.now(),
      rating: 4.9,
      reviewCount: 178,
      enrollmentCount: 560,
    ),
    Course(
      id: '5',
      title: 'Motion Desgin with After Effects',
      description: 'Create stunning motion graphics and visual effects using Adobe after effects',
      imageUrl: 'https://img.magnific.com/free-vector/gradiant-ui-ux-background_23-2149024129.jpg',
      instructorId: 'inst_5',
      catergoryId: '2',
      // Design
      price: 89.99,
      lessons: _createMotionDesignLessons(),
      level: 'Intermediate',
      requirements: [
        'Basic Adobe After Effects',
        'understanding of design principles',
        'creative mindset',
      ],
      whatYouWillLearn: [
        'Advanced animation ',
        'Charachter anaimation ',
        'visual create effects',
        'Motion grapichs principle',
        'Project WorkFlow optimaztion',
      ],
      createdAt: DateTime.now().subtract(Duration(days: 20)),
      updateAt: DateTime.now(),
      rating: 4.7,
      reviewCount: 145,
      enrollmentCount: 420,
      isPremium: true,
    ),
    Course(
      id: '6',
      title: 'Finical Managament Fundmatial ',
      description: 'Master basic  Finical managament',
      imageUrl: 'https://img.freepik.com/free-vector/gradiant-stock-market-concept_23-2149166910.jpg',
      instructorId: 'inst_6',
      catergoryId: '3',
      // bussiness
      price: 74.99,
      lessons: _createFinanceLessons(),
      level: 'Beginner',
      requirements: [
        'Basic Math skills',
        'Internet in finance',
        'No Prior expernince neede',
      ],
      whatYouWillLearn: [
        'financel analysis',
        'Investment basics',
        'Risk Management',
        'Budgeting techniques',
        'Business valuation',
      ],
      createdAt: DateTime.now().subtract(Duration(days: 25)),
      updateAt: DateTime.now(),
      rating: 4.6,
      reviewCount: 98,
      enrollmentCount: 340,
    ),
    Course(
      id: '7',
      title: 'Professional Photography',
      description: 'Learn professional Photography techniques from compostion to post-process',
      imageUrl: 'https://img.freepik.com/free-vector/professional-camera-blurred-background_169016-10249.jpg',
      instructorId: 'inst_7',
      catergoryId: '5',
      // Design
      price: 84.99,
      lessons: _createPytographyLessons(),
      level: 'Beginner',
      requirements: [
        'Digiatl camera',
        'Basic computer skills',
        'Adobe Lightroom',
      ],
      whatYouWillLearn: [
        'Camera basics and setting',
        'Compstion techincque',
        'Lighting fundamentals',
        'Post-processing',
        'Building a protiflio',
      ],
      createdAt: DateTime.now().subtract(Duration(days: 25)),
      updateAt: DateTime.now(),
      rating: 4.7,
      reviewCount: 132,
      enrollmentCount: 450,
      isPremium: true,
    ),
    Course(
      id: '8',
      title: 'English Bussiness commencation',
      description: 'Master English for Success',
      imageUrl: 'https://img.freepik.com/free-vector/online-english-lessons-youtube-thumbnail_23-2149291956.jpg',
      instructorId: 'inst_8',
      catergoryId: '6',
      // Design
      price: 69.99,
      lessons: _createLanaguageLessons(),
      level: 'intermediate',
      requirements: [
        'Basic English Knowledge',
        'Dectation practice',
        'Internet connection',
      ],
      whatYouWillLearn: [
        'Bussiness vocablary',
        'Email writing',
        'prsentation skills',
        'Nagation techinques',
        'Professional communication',
      ],
      createdAt: DateTime.now().subtract(Duration(days: 18)),
      updateAt: DateTime.now(),
      rating: 4.8,
      reviewCount: 167,
      enrollmentCount: 580,
    ),
  ];
  static final List<Quiz> quizzes = [
    Quiz(
      id: '1',
      title: "Flutter Basic Quiz",
      description: 'Test Your Knowledge of flutter fundamental ',
      questions: _createFlutterQuizQuestions(),
      timeLimit: 30,
      createdAt: DateTime.now().subtract(Duration(days: 5)),
      isActive: true,
    ),
    Quiz(
      id: '2',
      title: "Dart Programming Quiz",
      description: 'check your understanding of dart programming concepts ',
      questions: _createDartQuizQuestions(),
      timeLimit: 25,
      createdAt: DateTime.now().subtract(Duration(days: 3)),
      isActive: true,
    ),
    Quiz(
      id: '3',
      title: "State Maagment Quiz",
      description: 'check your understanding of State MAnagment ',
      questions: _createStateManagamentQuizQuestions(),
      timeLimit: 20,
      createdAt: DateTime.now().subtract(Duration(days: 1)),
      isActive: true,
    ),
  ];

  static final List<QuizAttempt> quizAttempts = [];

  static List<Lesson> _createFlutterLessons() {
    return [
      Lesson(
        id: '1',
        title: 'introducation to flutter',
        description: 'this deatiled of the flutter',
        videoUrl: 'https://drive.google.com/file/d/1VLqmXem7_Zex-NMjR6fBarTXl3_6CwEI/view?usp=sharing',
        duration: 30,
        resources: _createDummyResources(),
        isPreview: true,
        isLocked: false,
      ),
      _createLesson('2', 'Dart Programming', false, false),
      _createLesson('3', 'Building UI with widget', false, false),
      _createLesson('4', 'State management', false, false),
      _createLesson('5', 'Working With Apis', false, false),
      _createLesson('6', 'Local Data Storage', false, false),
    ];
  }

  static List<Lesson> _createDesignLessons() {
    return [
      _createLesson('1', 'Design Fundmantels', true, false),
      _createLesson('2', 'Color theory', false, false),
      _createLesson('3', 'Typographyyy Basics', false, false),
      _createLesson('4', 'Layout Design', false, false),
      _createLesson('5', 'Analytics Repoert', false, false),
    ];
  }

  static List<Lesson> _createArchitectureLessons() {
    return [
      _createLesson('1', 'Clean Architecture Overview', true, true),
      _createLesson('2', 'Solid Principle', false, true),
      _createLesson('3', 'Repo Pattern', false, true),
      _createLesson('4', 'Dependency Injection', false, false),
      _createLesson('5', 'Unit Testing', false, false),
    ];
  }

  static List<Lesson> _createMotionDesignLessons() {
    return [
      _createLesson('1', 'Animation Basics', true, false),
      _createLesson('2', 'Key frame Animation', false, false),
      _createLesson('3', 'Character Rigging', false, false),
      _createLesson('4', 'Visual Effect', false, false),
      _createLesson('5', 'Project WorkFlow', false, false),
    ];
  }

  static List<Lesson> _createFinanceLessons() {
    return [
      _createLesson('1', 'intro to Finance', true, false),
      _createLesson('2', 'Finance Statment', false, false),
      _createLesson('3', 'Investmant Basic', false, false),
      _createLesson('4', 'Risk Managament', false, false),
      _createLesson('5', 'Bussiness Valutaion', false, false),
    ];
  }

  static List<Lesson> _createPytographyLessons() {
    return [
      _createLesson('1', 'UnderStanding Your Camera', true, false),
      _createLesson('2', 'Compostion Basic', false, false),
      _createLesson('3', 'LightPTechniques', false, false),
      _createLesson('4', 'Protrait Photograpy', false, false),
      _createLesson('5', 'Post-Processing', false, false),
    ];
  }

  static List<Lesson> _createLanaguageLessons() {
    return [
      _createLesson('1', 'Bussiness Vocuablary', true, false),
      _createLesson('2', 'Email Writing', false, false),
      _createLesson('3', 'Presentation Skills', false, false),
      _createLesson('4', 'Negotiation Language', false, false),
      _createLesson('5', 'Professional Communication', false, false),
    ];
  }

  static List<Lesson> _createMarketingLessons() {
    return [
      _createLesson('1', 'Digital Marketing Overview', true, true),
      _createLesson('2', 'SEO Fundmantal', false, false),
      _createLesson('3', 'Social Media Startegy', false, false),
      _createLesson('4', 'Email Marketing', false, false),
      _createLesson('5', 'Analytics & Reporting', false, false),
    ];
  }

  static Lesson _createLesson(
    String id,
    String title,
    bool isPreview,
    bool isCompleted,
  ) {
    return Lesson(
      id: 'lesson_$id',
      title: title,
      description: 'this is deatiled of the $title',
      videoUrl: 'https://drive.google.com/file/d/1VLqmXem7_Zex-NMjR6fBarTXl3_6CwEI/view?usp=sharing',
      duration: 30,
      resources: _createDummyResources(),
      isPreview: isPreview,
      isLocked: !isPreview,
      isCompleted: isCompleted,
    );
  }

  static List<Resource> _createDummyResources() {
    return [
      Resource(
        id: 'res_1',
        title: 'Lesson Slides',
        type: 'PDF',
        url: 'https://example.com/slides.pdf',
      ),
      Resource(
        id: 'res_2',
        title: 'Exercies files',
        type: 'Zip',
        url: 'https://example.com/exercies.zip',
      ),
    ];
  }

  static Course getCourseById(String id) {
    return courses.firstWhere(
      (course) => course.id == id,
      orElse: () => courses.first,
    );
  }

  static List<Course> getCourseByCategory(String categoryId) {
    return courses.where((course) => course.catergoryId == categoryId).toList();
  }

  static List<Course> getInstructorCourse(String instructorId) {
    return courses
        .where((course) => course.instructorId == instructorId)
        .toList();
  }

  static bool isCourseCompleted(String courseID) {
    final course = getCourseById(courseID);
    return course.lessons.every((lesson) => lesson.isCompleted);
  }

  static List<Question> _createFlutterQuizQuestions() {
    return [
      Question(
        id: '1',
        text: 'what is flutter',
        correctOptionId: 'a',
        options: [
          Option(id: 'a', text: 'UI frameWork'),
          Option(id: 'b', text: 'A programming Language'),
          Option(id: 'c', text: 'database managment'),
          Option(id: 'd', text: 'design tool'),
        ],
        points: 1,
      ),
      Question(
        id: '2',
        text: 'which is the programming language used in flutter',
        correctOptionId: 'b',
        options: [
          Option(id: 'a', text: 'c++'),
          Option(id: 'b', text: 'dart'),
          Option(id: 'c', text: 'C#'),
          Option(id: 'd', text: 'JAVA'),
        ],
        points: 1,
      ),
    ];
  }

  static List<Question> _createDartQuizQuestions() {
    return [
      Question(
        id: '1',
        text: 'What is Dart',
        correctOptionId: 'b',
        options: [
          Option(id: 'a', text: 'markup Langauage'),
          Option(id: 'b', text: 'programming Langauage'),
          Option(id: 'c', text: 'OOP'),
          Option(id: 'd', text: 'database'),
        ],
        points: 1,
      ),
    ];
  }

  static List<Question> _createStateManagamentQuizQuestions() {
    return [
      Question(
        id: '1',
        text: 'What is Statemanagment in flutter ',
        correctOptionId: 'a',
        options: [
          Option(id: 'a', text: "Managinag App data and UI updates"),
          Option(id: 'b', text: "Lang Progranning"),
          Option(id: 'c', text: "Network"),
          Option(id: 'd', text: "CPP"),
        ],
        points: 1,
      ),
    ];
  }

  static Quiz getQuizById(String id) {
    return quizzes.firstWhere(
      (quiz) => quiz.id == id,
      orElse: () => quizzes.first,
    );
  }

  static void saveQuizAttempt(QuizAttempt attempt) {
    quizAttempts.add(attempt);
  }

  static List<QuizAttempt> getQuizAttempts(String userId) {
    return quizAttempts.where((attempt) => attempt.userId == userId).toList();
  }

  static final Set<String> _purchasedCourseIds = {};

  static void addPurchasedCourse(String courseId) {
    _purchasedCourseIds.add(courseId);
  }

  static bool isCourseUnlocked(String courseId) {
    final course = getCourseById(courseId);
    return !course.isPremium || _purchasedCourseIds.contains(courseId);
  }

  static final Map<String, TeacherStats> teacherStats = {
    "inst1": TeacherStats(
      totalStudents: 1234,
      activeCourses: 8,
      totalRevenue: 1234.67,
      averageRating: 4.8,
      monthlyEnrollments: [156, 189, 234, 278, 312, 289],
      monthlyRevenue: [1234, 12345, 1500, 1600, 1897, 2000],
      studentEngagement: StudentEngagement(
        averageCompletionRate: 0.78,
        averageTimePerLesson: 45,
        activeStudentsThisWeek: 156,
        courseCompletionRates: {
          'Flutter Development Bootcamp': 0.85,
          'Advanced Flutter': 0.72,
          'Flutter State Managment': 0.68,
        },
      ),
    ),
  };

  static final Map<String, List<StudentProgress>> studentProgress = {
    'inst_1': [
      StudentProgress(
        studentId: 'student_1',
        studentName: 'Mohamed Hussien',
        courseId: "1",
        courseName: 'Flutter Development Bootcamp',
        progress: 0.75,
        lastActive: DateTime.now().subtract(Duration(hours: 2)),
        quizScores: [85, 92, 78, 88],
        completedLessons: 12,
        totalLessons: 16,
        averageTimePerLesson: 45,
      ),
      StudentProgress(
        studentId: "student_2",
        studentName: "Ali Mohammed",
        courseId: '2',
        courseName: 'Flutter Development Bootcamp',
        progress: 0.60,
        lastActive: DateTime.now().subtract(Duration(days: 1)),
        quizScores: [95, 88, 82],
        completedLessons: 9,
        averageTimePerLesson: 38,
        totalLessons: 16,
      ),
    ],
  };

  static TeacherStats getTeacherStats(String instructorId) {
    final instrcutorCourses = getInstructorCourse(instructorId);
    final stats = teacherStats[instructorId] ?? TeacherStats.empty();

    return TeacherStats(
      totalStudents: instrcutorCourses.fold(
        0,
        (sum, course) => sum + course.enrollmentCount,
      ),
      activeCourses: instrcutorCourses.length,
      totalRevenue: instrcutorCourses.fold(
        0.0,
        (sum, course) => sum + (course.price * course.enrollmentCount),
      ),
      averageRating: instrcutorCourses.isEmpty
          ? 0.0
          : instrcutorCourses.fold(0.0, (sum, course) => sum + course.rating) /
                instrcutorCourses.length,
      monthlyEnrollments: stats.monthlyEnrollments,
      monthlyRevenue: stats.monthlyRevenue,
      studentEngagement: stats.studentEngagement,
    );
  }

  static List<StudentProgress> getStudentProgress(String instructorId) {
    final instructorCourses = getInstructorCourse(instructorId);
    final courseIds = instructorCourses.map((c) => c.id).toSet();

    return studentProgress[instructorId]
            ?.where((progress) => courseIds.contains(progress.courseId))
            .toList() ??
        [];
  }

  static Stream<List<ChatMessage>> getChatMessages(String courseId) {
    return Stream.value(
      _dummyChats.values
          .expand((messages) => messages)
          .where((msg) => msg.courseId == courseId)
          .toList(),
    );
  }

  static Stream<List<ChatMessage>> getTeacherChats(String instructorId) {
    return Stream.value(_dummyChats[instructorId] ?? []);
  }

  static Map<String, List<ChatMessage>> getTeacherChatsByCourse(
    String instructorId,
  ) {
    final Map<String, List<ChatMessage>> chatsByCourse = {};
    final messages = _dummyChats[instructorId] ?? [];
    for (var message in messages) {
      if (!chatsByCourse.containsKey(message.courseId)) {
        chatsByCourse[message.courseId] = [];
      }
      chatsByCourse[message.courseId]!.add(message);
    }
    return chatsByCourse;
  }

  static final Map<String, List<ChatMessage>> _dummyChats = {
    'inst_1': [
      ChatMessage(
        id: '1',
        senderId: 'student_1',
        receiverId: 'inst_1',
        courseId: '1',
        message: 'Hi, I have the question',
        timestamp: DateTime.now().subtract(Duration(minutes: 5)),
      ),
      ChatMessage(
        id: '2',
        senderId: 'student_2',
        receiverId: 'inst_1',
        courseId: '1',
        message: 'When the next session',
        timestamp: DateTime.now().subtract(Duration(hours: 1)),
      ),
      ChatMessage(
        id: '3',
        senderId: 'student_3',
        receiverId: 'inst_1',
        courseId: '2',
        message: 'Could you review your last design',
        timestamp: DateTime.now().subtract(Duration(minutes: 30)),
      ),
    ],
  };

  static void updateLessonStatus(
    String courseId,
    String lessonId, {
    bool? isCompleted,
    bool? isLocked,
  }) {
    final courseIndex = courses.indexWhere((c) => c.id == courseId);
    if (courseIndex != -1) {
      final course = courses[courseIndex];
      final lessonIndex = course.lessons.indexWhere((l) => l.id == lessonId);
      if (lessonIndex != -1) {
        var updateLesson = course.lessons[lessonIndex].copyWith(
          isCompleted: isCompleted ?? course.lessons[lessonIndex].isCompleted,
          isLocked: isLocked ?? course.lessons[lessonIndex].isLocked,
        );
        courses[courseIndex].lessons[lessonIndex] = updateLesson;
      }
    }
  }

  static bool isLessonCompleted(String courseId, String lessonId) {
    final course = getCourseById(courseId);
    return course.lessons
        .firstWhere(
          (l) => l.id == lessonId,
          orElse: () => Lesson(
            id: '',
            title: '',
            description: '',
            videoUrl: '',
            duration: 0,
            resources: [],
          ),
        )
        .isCompleted;
  }
}

class TeacherStats {
  final int totalStudents;
  final int activeCourses;
  final double totalRevenue;
  final double averageRating;

  final List<int> monthlyEnrollments;

  final List<double> monthlyRevenue;
  final StudentEngagement studentEngagement;

  TeacherStats({
    required this.totalStudents,
    required this.activeCourses,
    required this.totalRevenue,
    required this.averageRating,
    required this.monthlyEnrollments,
    required this.monthlyRevenue,
    required this.studentEngagement,
  });

  factory TeacherStats.empty() => TeacherStats(
    totalStudents: 0,
    activeCourses: 0,
    totalRevenue: 0,
    averageRating: 0,
    monthlyEnrollments: [],
    monthlyRevenue: [],
    studentEngagement: StudentEngagement.empty(),
  );
}

class StudentEngagement {
  final double averageCompletionRate;
  final int averageTimePerLesson;
  final int activeStudentsThisWeek;
  final Map<String, double> courseCompletionRates;

  StudentEngagement({
    required this.averageCompletionRate,
    required this.averageTimePerLesson,
    required this.activeStudentsThisWeek,
    required this.courseCompletionRates,
  });

  factory StudentEngagement.empty() => StudentEngagement(
    averageCompletionRate: 0,
    averageTimePerLesson: 0,
    activeStudentsThisWeek: 0,
    courseCompletionRates: {},
  );
}

class StudentProgress {
  final String studentId;
  final String studentName;
  final String courseId;
  final String courseName;
  final double progress;
  final DateTime lastActive;
  final List<int> quizScores;
  final int completedLessons;
  final int totalLessons;
  final int averageTimePerLesson;

  double get averageScore {
    if (quizScores.isEmpty) return 0.0;
    return quizScores.reduce((a, b) => a + b) / quizScores.length / 100;
  }

  StudentProgress({
    required this.studentId,
    required this.studentName,
    required this.courseId,
    required this.courseName,
    required this.progress,
    required this.lastActive,
    required this.quizScores,
    required this.completedLessons,
    required this.averageTimePerLesson,
    required this.totalLessons,
  });
}
