import 'package:flutter/material.dart';
import 'package:community/widgets/study_offer_card.dart';
import 'package:community/theme/app_theme.dart';

class StudyFeed extends StatelessWidget {
  const StudyFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Study Hub'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Offer Help'),
              Tab(text: 'Request Help'),
            ],
          ),
        ),
        body: TabBarView(children: [_buildOffersList(), _buildRequestsList()]),
      ),
    );
  }

  Widget _buildOffersList() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        StudyOfferCard(
          title: 'Advanced Algorithms',
          description:
              'Deep dive into Dijkstra\'s and A* pathfinding. Helping students prepare for the midterms.',
          courseTags: ['CS402', 'Algorithms'],
          authorName: 'Alex O.',
        ),
        StudyOfferCard(
          title: 'Spatial Design',
          description:
              'Offering feedback on 2nd-year architecture portfolios. Focus on site analysis visuals.',
          courseTags: ['ARCH201', 'Design'],
          authorName: 'Sarah M.',
        ),
        StudyOfferCard(
          title: 'Calculus II',
          description:
              'Step-by-step walkthrough of integration by parts and trigonometric substitution.',
          courseTags: ['MATH201'],
          authorName: 'David K.',
        ),
      ],
    );
  }

  Widget _buildRequestsList() {
    return const Center(
      child: Text(
        'No requests currently.',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}
