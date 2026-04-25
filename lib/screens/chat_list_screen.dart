import 'package:flutter/material.dart';
import 'package:community/theme/app_theme.dart';
import 'package:community/screens/chat_window.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        actions: [
          IconButton(icon: const Icon(Icons.edit_square), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search squads or messages...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: AppTheme.containerBackground,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Active Squads',
                    style: TextStyle(
                      color: AppTheme.accentTeal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '8 Active',
                    style: TextStyle(color: AppTheme.accentTeal, fontSize: 12),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildChatTile(
                    context,
                    title: 'AI Ethics Research',
                    subtitle: 'Alex: Did everyone see the new r...',
                    time: '2m ago',
                    isUnread: true,
                    icon: Icons.biotech,
                  ),
                  _buildChatTile(
                    context,
                    title: 'Hackathon Squad #42',
                    subtitle: 'You: I just pushed the latest UI m...',
                    time: '1h ago',
                    isUnread: false,
                    icon: Icons.code,
                  ),
                  _buildChatTile(
                    context,
                    title: 'Social Comm - Gala',
                    subtitle: 'Sarah sent a photo',
                    time: '2h ago',
                    isUnread: false,
                    icon: Icons.celebration,
                  ),
                  _buildChatTile(
                    context,
                    title: 'Arch Design Studio',
                    subtitle: 'Marcus: Meet at the lab tomorrow...',
                    time: '4h ago',
                    isUnread: false,
                    icon: Icons.architecture,
                  ),
                  _buildChatTile(
                    context,
                    title: 'Startup Bootcamp',
                    subtitle: 'Jordan: Great work on the pitch d...',
                    time: 'Yesterday',
                    isUnread: false,
                    icon: Icons.lightbulb,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String time,
    required bool isUnread,
    required IconData icon,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: AppTheme.containerBackground,
        child: Icon(icon, color: AppTheme.accentTeal),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: isUnread ? Colors.white70 : Colors.grey,
          fontSize: 13,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            time,
            style: TextStyle(
              color: isUnread ? AppTheme.accentTeal : Colors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          if (isUnread)
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppTheme.accentTeal,
                shape: BoxShape.circle,
              ),
            )
          else
            const SizedBox(height: 8),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatWindow()),
        );
      },
    );
  }
}
