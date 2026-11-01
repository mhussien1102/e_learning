import 'package:e_learning/core/services/dummy_data_services.dart';
import 'package:e_learning/core/theme/app_colors.dart';
import 'package:e_learning/models/chat_message.dart';
import 'package:e_learning/views/chat/widgets/message_bubble.dart';
import 'package:e_learning/views/chat/widgets/message_input.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String courseId;
  final String instructorId;
  final String? studentName;
  final bool isTeacherView;
  final TextEditingController _messageController = TextEditingController();

  ChatScreen({
    super.key,
    required this.courseId,
    required this.instructorId,
    this.studentName,
    required this.isTeacherView,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: AppColors.accent),
        ),
        title: Text(
          isTeacherView
              ? 'Chat with ${studentName ?? 'Student'}'
              : 'Chat with Constructor',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<ChatMessage>>(
              stream: DummyDataServices.getChatMessages(courseId),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                final messages = snapshot.data!;
                return ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.all(16),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return MessageBubble(
                      message: message,
                      isMe: message.senderId == 'current_user_id',
                    );
                  },
                );
              },
            ),
          ),
          MessageInput(
            controller: _messageController,
            onPressed: () {
              if (_messageController.text.isNotEmpty) {
                //code
                _messageController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
