import 'package:flutter/material.dart';
import '../widgets/spinner_wheel.dart';
import 'challenge_screen.dart';

class SpinScreen extends StatefulWidget {
  final List<String> players;
  const SpinScreen({super.key, required this.players});

  @override
  State<SpinScreen> createState() => _SpinScreenState();
}

class _SpinScreenState extends State<SpinScreen> {
  String? _selectedPlayer;
  int _turn = 0;

  void _onSpinComplete(String player) {
    setState(() {
      _selectedPlayer = player;
    });
  }

  void _nextTurn() {
    setState(() {
      _selectedPlayer = null;
      _turn++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spin the Wheel')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinnerWheel(
              players: widget.players,
              onSpinComplete: _onSpinComplete,
            ),
            const SizedBox(height: 32),
            if (_selectedPlayer != null) ...[
              Text('Selected: $_selectedPlayer', style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChallengeScreen(player: _selectedPlayer!),
                    ),
                  ).then((_) => _nextTurn());
                },
                child: const Text('Continue'),
              ),
            ],
            const SizedBox(height: 32),
            Text('Turn: ${_turn + 1}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
} 