import 'package:e_learning/core/services/dummy_data_services.dart';
import 'package:e_learning/core/theme/app_colors.dart';
import 'package:e_learning/models/chat_message.dart';
import 'package:e_learning/views/chat/widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back, color: AppColors.accent),
        ),
        title: Text(
          "Student Message",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder<List<ChatMessage>>(
        stream: DummyDataServices.getTeacherChats('inst_1'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final chatByCourse = DummyDataServices.getTeacherChatsByCourse(
            'inst_1',
          );
          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: chatByCourse.length,
            itemBuilder: (context, index) {
              final courseId = chatByCourse.keys.elementAt(index);
              final courseChats = chatByCourse[courseId]!;
              final course = DummyDataServices.getCourseById(courseId);

              return Card(
                elevation: 0,
                margin: EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    title: Text(
                      course.title,
                      style: TextStyle(color: AppColors.primary),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${courseChats.length} message",
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                      ),
                    ),
                    children: courseChats.map((chat) {
                      final studentProgress = DummyDataServices
                          .studentProgress['inst_1']
                          ?.firstWhere(
                            (progress) => progress.studentId == chat.senderId,
                            orElse: () => StudentProgress(
                              studentId: chat.senderId,
                              studentName: 'Unknown Student',
                              courseId: chat.courseId,
                              courseName: "Unknown Course",
                              progress: 0,
                              lastActive: DateTime.now(),
                              quizScores: [],
                              completedLessons: 0,
                              averageTimePerLesson: 0,
                              totalLessons: 0,
                            ),
                          );
                      return ChatTile(
                        lastMessage: chat,
                        studentName: studentProgress?.studentName,
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
