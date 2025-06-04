import 'package:flutter/material.dart';
import '../widgets/note_card.dart';
import 'settings_screen.dart';
import '../services/local_storage.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  const HomeScreen({super.key, required this.userName});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> notes = [];

  @override
  void initState() {
    super.initState();
    _loadSavedNotes();
  }

  void _loadSavedNotes() async {
    List<String> loadedNotes = await LocalStorageService.loadNotes();
    setState(() => notes.addAll(loadedNotes));
  }

  void _saveNotes() => LocalStorageService.saveNotes(notes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello, ${widget.userName}!'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SettingsScreen()),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return NoteCard(note: notes[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addNoteDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _addNoteDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('New Note'),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () {
              String text = controller.text.trim();
              if (text.isNotEmpty) {
                setState(() => notes.add(text));
                _saveNotes();
              }
              Navigator.pop(context);
            },
            child: Text('Save'),
          )
        ],
      ),
    );
  }
}