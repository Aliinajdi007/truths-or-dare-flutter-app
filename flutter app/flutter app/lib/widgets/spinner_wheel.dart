import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

class SpinnerWheel extends StatefulWidget {
  final List<String> players;
  final void Function(String selectedPlayer) onSpinComplete;
  const SpinnerWheel({super.key, required this.players, required this.onSpinComplete});

  @override
  State<SpinnerWheel> createState() => _SpinnerWheelState();
}

class _SpinnerWheelState extends State<SpinnerWheel> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _angle = 0;
  int? _selectedIndex;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ))..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        if (_selectedIndex != null) {
          widget.onSpinComplete(widget.players[_selectedIndex!]);
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _spin() async {
    final random = Random();
    final spins = 5 + random.nextInt(4); // 5-8 full spins
    _selectedIndex = random.nextInt(widget.players.length);
    final anglePerSlice = 2 * pi / widget.players.length;
    final targetAngle = 2 * pi * spins + (_selectedIndex! * anglePerSlice) + anglePerSlice / 2;
    setState(() {
      _angle = targetAngle;
    });
    // Play spin sound
    await _audioPlayer.play(AssetSource('sounds/spin.mp3'));
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final playerCount = widget.players.length;
    return Column(
      children: [
        GestureDetector(
          onTap: _spin,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final animAngle = _animation.value * _angle;
              return Transform.rotate(
                angle: animAngle,
                child: CustomPaint(
                  size: const Size(250, 250),
                  painter: _WheelPainter(widget.players),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        const Text('Tap the wheel to spin!'),
      ],
    );
  }
}

class _WheelPainter extends CustomPainter {
  final List<String> players;
  final List<Color> colors = [
    Colors.purple,
    Colors.blue,
    Colors.pink,
    Colors.yellow,
    Colors.green,
    Colors.orange,
    Colors.red,
    Colors.teal,
  ];
  _WheelPainter(this.players);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    final anglePerSlice = 2 * pi / players.length;
    final paint = Paint()..style = PaintingStyle.fill;
    for (int i = 0; i < players.length; i++) {
      paint.color = colors[i % colors.length];
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        i * anglePerSlice,
        anglePerSlice,
        true,
        paint,
      );
    }
    // Draw player names
    for (int i = 0; i < players.length; i++) {
      final angle = (i + 0.5) * anglePerSlice;
      final textPainter = TextPainter(
        text: TextSpan(
          text: players[i],
          style: const TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      final offset = Offset(
        center.dx + (radius * 0.65) * cos(angle) - textPainter.width / 2,
        center.dy + (radius * 0.65) * sin(angle) - textPainter.height / 2,
      );
      textPainter.paint(canvas, offset);
    }
    // Draw center circle
    paint.color = Colors.white;
    canvas.drawCircle(center, radius * 0.2, paint);
    // Draw pointer
    paint.color = Colors.black;
    final pointerPath = Path();
    pointerPath.moveTo(center.dx, center.dy - radius - 10);
    pointerPath.lineTo(center.dx - 10, center.dy - radius + 20);
    pointerPath.lineTo(center.dx + 10, center.dy - radius + 20);
    pointerPath.close();
    canvas.drawPath(pointerPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
} 