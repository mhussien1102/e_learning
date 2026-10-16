import 'package:flutter/material.dart';

class LessonTile extends StatelessWidget {
  final String title;
  final String duration;
  final bool isCompleted;
  final bool isLocked;
  final bool isUnLocked;
  final VoidCallback onTap;

  const LessonTile({
    super.key,
    required this.title,
    required this.duration,
    required this.isCompleted,
    required this.isLocked,
    required this.isUnLocked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: isCompleted
            ? theme.colorScheme.primary
            : isLocked
            ? theme.colorScheme.secondary.withValues(alpha: 0.1)
            : theme.colorScheme.secondary.withValues(alpha: 0.2),
        child: Icon(
          isCompleted
              ? Icons.check
              : isLocked
              ? Icons.lock
              : Icons.play_arrow,
          color: isCompleted
              ? theme.colorScheme.onPrimary
              : isLocked
              ? theme.colorScheme.secondary
              : theme.colorScheme.secondary,
        ),
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: isLocked ? theme.colorScheme.secondary : null,
        ),
      ),
      subtitle: Text(
        duration,
        style: theme.textTheme.bodySmall?.copyWith(
          color: isLocked ? theme.colorScheme.secondary : null,
        ),
      ),
      trailing: Icon(Icons.chevron_right),
    );
  }
}
