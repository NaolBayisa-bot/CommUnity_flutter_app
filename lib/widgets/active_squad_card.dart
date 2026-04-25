import 'package:flutter/material.dart';
import 'package:community/theme/app_theme.dart';

class ActiveSquadCard extends StatelessWidget {
  final String title;
  final String description;
  final double progress;
  final int memberCount;

  const ActiveSquadCard({
    super.key,
    required this.title,
    required this.description,
    required this.progress,
    required this.memberCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppTheme.mainBackground,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.rocket_launch, color: AppTheme.accentTeal, size: 20),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                SizedBox(
                  width: 80,
                  child: Stack(
                    children: [
                      const CircleAvatar(radius: 12, backgroundColor: Colors.blueGrey),
                      Positioned(left: 16, child: CircleAvatar(radius: 12, backgroundColor: Colors.indigo)),
                      Positioned(left: 32, child: CircleAvatar(radius: 12, backgroundColor: AppTheme.accentCoral, child: Text('+$memberCount', style: TextStyle(fontSize: 10, color: Colors.white)))),
                    ],
                  ),
                ),
                const Spacer(),
                const Text('Progress', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: AppTheme.mainBackground,
              color: AppTheme.accentTeal,
              borderRadius: BorderRadius.circular(8),
              minHeight: 6,
            ),
          ],
        ),
      ),
    );
  }
}
