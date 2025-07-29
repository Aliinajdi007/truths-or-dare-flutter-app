enum ChallengeType { truth, dare }

class Challenge {
  final ChallengeType type;
  final String text;

  Challenge({required this.type, required this.text});
} 