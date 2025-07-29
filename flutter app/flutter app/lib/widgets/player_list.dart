import 'package:flutter/material.dart';

class PlayerList extends StatelessWidget {
  final List<String> players;
  const PlayerList({super.key, required this.players});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: players.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.person),
          title: Text(players[index]),
        );
      },
    );
  }
} 