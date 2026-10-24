import 'dart:async';

import 'package:e_learning/core/services/dummy_data_services.dart';
import 'package:e_learning/core/theme/app_colors.dart';
import 'package:e_learning/models/quiz_attemps.dart';
import 'package:e_learning/views/quiz/quiz_attempt/widget/quiz_attempt_app_bar.dart';
import 'package:e_learning/views/quiz/quiz_attempt/widget/quiz_navigation_bat.dart';
import 'package:e_learning/views/quiz/quiz_attempt/widget/quiz_question_page.dart';
import 'package:e_learning/views/quiz/quiz_attempt/widget/quiz_submit_dialog.dart';
import 'package:flutter/material.dart';

import '../../../models/quiz.dart';

class QuizAttemptScreen extends StatefulWidget {
  final String quizId;

  const QuizAttemptScreen({super.key, required this.quizId});

  @override
  State<QuizAttemptScreen> createState() => _QuizAttemptScreenState();
}

class _QuizAttemptScreenState extends State<QuizAttemptScreen> {
  late final Quiz quiz;
  late final PageController _pageController;
  int _currentPage = 0;

  Map<String, String> selectedAnswer = {};
  int remainingSeconds = 0;
  Timer? _timer;

  QuizAttempt? currentAttempt;

  @override
  void initState() {
    super.initState();
    quiz = DummyDataServices.getQuizById(widget.quizId);
    _pageController = PageController();
    _pageController.addListener(_onPageChanged);
    remainingSeconds = quiz.timeLimit * 60;
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    if (_pageController.page != null) {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        _submitQuiz();
      }
    });
  }

  void _submitQuiz() {
    _timer?.cancel();
    final score = _calculateScore();
    currentAttempt = QuizAttempt(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      quizId: quiz.id,
      userId: 'current user is',
      answers: selectedAnswer,
      score: score,
      startedAt: DateTime.now().subtract(
        Duration(seconds: quiz.timeLimit * 60 - remainingSeconds),
      ),
      completeAt: DateTime.now(),
      timeSpent: quiz.timeLimit * 60 - remainingSeconds,
    );
    DummyDataServices.saveQuizAttempt(currentAttempt!);

    //code
  }

  void _navigateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _selectAnswer(String questionId, String optionId) {
    setState(() {
      selectedAnswer[questionId] = optionId;
    });
  }

  int _calculateScore() {
    int score = 0;
    for (final question in quiz.questions) {
      if (selectedAnswer[question.id] == question.correctOptionId) {
        score += question.points;
      }
    }
    return score;
  }

  String get formattedTime {
    final minutes = (remainingSeconds / 60).floor();
    final secondes = (remainingSeconds % 60);
    return '${minutes.toString().padLeft(2, '0')} : ${secondes.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: QuizAttemptAppBar(
        formattedTime: formattedTime,
        onSubmit: () => _showSubmitDialog(context),
      ),

      body: PageView.builder(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        itemCount: quiz.questions.length,
        itemBuilder: (BuildContext context, index) => QuizQuestionPage(
          questionNumber: index + 1,
          totalQuestions: quiz.questions.length,
          question: quiz.questions[index],
          selectedOptionId: selectedAnswer[quiz.questions[index].id],
          onOptionSelected: (optionId) =>
              _selectAnswer(quiz.questions[index].id, optionId),
        ),
      ),
      bottomNavigationBar: QuizNavigationBar(
        theme: theme,
        onPreviousPressed: _currentPage > 0
            ? () => _navigateToPage(_currentPage - 1)
            : null,
        onNextPressed: _currentPage < quiz.questions.length - 1
            ? () => _navigateToPage(_currentPage + 1)
            : null,
        isLastPage: _currentPage == quiz.questions.length - 1,
      ),
    );
  }

  Future<void> _showSubmitDialog(BuildContext context) async {
    final score = _calculateScore();
    currentAttempt = QuizAttempt(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      quizId: quiz.id,
      userId: 'Current user id',
      answers: selectedAnswer,
      score: score,
      startedAt: DateTime.now().subtract(
        Duration(seconds: quiz.timeLimit * 60 - remainingSeconds),
      ),
      timeSpent: quiz.timeLimit * 60 - remainingSeconds,
      completeAt: DateTime.now(),
    );
    DummyDataServices.saveQuizAttempt(currentAttempt!);
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) =>
          QuizSubmitDialog(attempt: currentAttempt!, quiz: quiz),
    );
  }
}
