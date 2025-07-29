import 'package:flutter/material.dart';
import 'dart:math';
import '../data/truth_dare_data.dart';
import 'package:audioplayers/audioplayers.dart';

class ChallengeScreen extends StatefulWidget {
  final String player;
  const ChallengeScreen({super.key, required this.player});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  String? _challenge;
  bool _isTruth = true;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _showChallenge(bool isTruth) async {
    setState(() {
      _isTruth = isTruth;
      final list = isTruth ? truths : dares;
      _challenge = list[Random().nextInt(list.length)];
    });
    // Play challenge sound
    await _audioPlayer.play(AssetSource('sounds/select.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Challenge')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${widget.player}'s turn!",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            if (_challenge == null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => _showChallenge(true),
                    icon: const Text('🧠'),
                    label: const Text('Truth'),
                  ),
                  const SizedBox(width: 24),
                  ElevatedButton.icon(
                    onPressed: () => _showChallenge(false),
                    icon: const Text('🎯'),
                    label: const Text('Dare'),
                  ),
                ],
              ),
            ] else ...[
              Text(
                _isTruth ? '🧠 Truth:' : '🎯 Dare:',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Card(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text(
                    _challenge!,
                    style: const TextStyle(fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Next Turn'),
              ),
            ],
          ],
        ),
      ),
    );
  }
} 