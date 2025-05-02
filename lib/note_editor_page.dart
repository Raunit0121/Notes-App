import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteEditorPage extends StatefulWidget {
  final DocumentSnapshot? note;

  const NoteEditorPage({super.key, this.note});

  @override
  State<NoteEditorPage> createState() => _NoteEditorPageState();
}

class _NoteEditorPageState extends State<NoteEditorPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final notes = FirebaseFirestore.instance.collection('notes');

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      titleController.text = widget.note!['title'];
      noteController.text = widget.note!['text'];
    }
  }

  void saveNote() {
    if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
      if (widget.note == null) {
        notes.add({
          'title': titleController.text,
          'text': noteController.text,
        });
      } else {
        notes.doc(widget.note!.id).update({
          'title': titleController.text,
          'text': noteController.text,
        });
      }
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Both title and note cannot be empty!')),
      );
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[50],
      appBar: AppBar(
        backgroundColor: Colors.yellow[50],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          Row(
            children: [
              Text(
                'Save',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.note_add, color: Colors.black87),
                onPressed: saveNote,
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(
                hintText: 'Enter Title',
                border: InputBorder.none,
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TextField(
                controller: noteController,
                style: GoogleFonts.roboto(fontSize: 18),
                decoration: const InputDecoration(
                  hintText: 'Write a note...',
                  border: InputBorder.none,
                ),
                maxLines: null,
                expands: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
