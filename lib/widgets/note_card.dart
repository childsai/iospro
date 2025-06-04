import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String note;
  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Text(note, style: TextStyle(fontSize: 16)),
      ),
    );
  }
}