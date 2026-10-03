class QuizAttempt {
  final String id;
  final String quizId;
  final String userId;
  final Map<String, String> answers;
  final int score;
  final DateTime startedAt;
  final DateTime? completeAt;
  final int timeSpent;

  const QuizAttempt({
    required this.id,
    required this.quizId,
    required this.userId,
    required this.answers,
    required this.score,
    required this.startedAt,
    this.completeAt,
    required this.timeSpent,
  });

  factory QuizAttempt.fromJson(Map<String, dynamic> json) {
    return QuizAttempt(
      id: json['id'] ?? '',
      quizId: json['quizId'] ?? '',
      userId: json['userId'] ?? '',
      answers: Map<String, String>.from(json['answers'] ?? {}),
      score: json['score'] ?? 0,
      startedAt: DateTime.parse(json['startedAt']),
      timeSpent: json['timeSpent'] ?? 0,
      completeAt: json['completeAt'] != null
          ? DateTime.parse(json['completeAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quizId': quizId,
      'userId': userId,
      'answers': answers,
      'score': score,
      'startedAt': startedAt.toIso8601String(),
      'completeAt': completeAt?.toIso8601String(),
      'timeSpent': timeSpent,
    };
  }
}
