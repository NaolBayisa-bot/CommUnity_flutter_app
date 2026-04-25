import 'package:flutter/material.dart';
import 'package:community/widgets/announcement_card.dart';
import 'package:community/theme/app_theme.dart';

class HomeHub extends StatelessWidget {
  const HomeHub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Feed'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const AnnouncementCard(
              title: 'New Tech-Hub Opening',
              subtitle: 'Join us for the grand opening of the Innovation Wing this Friday at 10:00 AM.',
              content: '',
            ),
            const SizedBox(height: 16),
            _buildFeedItem(
              title: 'Calculus II Exam Prep Session',
              time: 'Meeting at the North Library, Room 402. Bring your notes from Chapter 4!',
              tags: ['Math', 'Study'],
            ),
            _buildFeedItem(
              title: 'Spring Enrollment Open',
              time: 'Priority registration for the Spring 2024 semester begins next week for senior students.',
              tags: ['Admin'],
            ),
            _buildFeedItem(
              title: 'Intramural Soccer Finals',
              time: 'Come cheer for the Engineering Tigers at the main field tonight! Free pizza for the first 50 students.',
              tags: ['Sports'],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedItem({required String title, required String time, required List<String> tags}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              time,
              style: const TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
