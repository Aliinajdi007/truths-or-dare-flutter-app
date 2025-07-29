import 'package:flutter/material.dart';

class ChallengeCard extends StatelessWidget {
  final String challenge;
  const ChallengeCard({super.key, required this.challenge});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(24),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Text(
          challenge,
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
} 