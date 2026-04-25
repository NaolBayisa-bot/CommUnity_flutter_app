import 'package:flutter/material.dart';
import 'package:community/widgets/active_squad_card.dart';
import 'package:community/theme/app_theme.dart';

class ProjectsHub extends StatelessWidget {
  const ProjectsHub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects Hub'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: const [
            Text(
              'Active Squads',
              style: TextStyle(color: AppTheme.accentTeal, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ActiveSquadCard(
              title: 'Neural Campus Map',
              description: 'Building a real-time AI-driven navigation system for campus using edge computing.',
              progress: 0.65,
              memberCount: 4,
            ),
            ActiveSquadCard(
              title: 'Vertical Garden IoT',
              description: 'Smart irrigation and monitoring for the Engineering building\'s facade garden.',
              progress: 0.40,
              memberCount: 3,
            ),
            ActiveSquadCard(
              title: 'Cognitive Load Interface',
              description: 'Research project testing UI layouts that minimize student burnout during exam seasons.',
              progress: 0.85,
              memberCount: 2,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.accentTeal,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
