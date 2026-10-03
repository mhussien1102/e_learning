import 'package:e_learning/models/questions.dart';

class Quiz {
  final String id;
  final String title;
  final String description;
  final List<Question> questions;
  final int timeLimit;
  final bool isActive;
  final DateTime createdAt;

  const Quiz({
    required this.id,
    required this.title,
    required this.description,
    required this.questions,
    required this.timeLimit,
    this.isActive = true,
    required this.createdAt,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      questions: (json['questions'] as List<dynamic>)
          .map((q) => Question.fromMap(q))
          .toList(),
      timeLimit: json['timeLimit'] ?? 30,
      createdAt: DateTime.parse(json['createdAt']),
      isActive: json['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'timeLimit': timeLimit,
      'questions': questions.map((q) => q.toMap()).toList(),
      'createdAt': createdAt.toIso8601String(),
      'isActive': isActive,
    };
  }
}
