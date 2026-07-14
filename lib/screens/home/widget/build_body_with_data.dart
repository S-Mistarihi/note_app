import 'package:flutter/material.dart';
import 'package:note_app/core/constants/app_text_style.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/screens/edit_note/edit_note_screen.dart';
import 'package:note_app/utils/date_formatter.dart';

class BuildBodyWithData extends StatelessWidget {
  final NoteModel note;

  const BuildBodyWithData({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => EditNoteScreen(note: note)),
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 5),
        curve: Curves.bounceIn,
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(note.title, style: AppTextStyle.font18WhiteNormal),
            SizedBox(height: 8),
            Text(note.content, style: AppTextStyle.font18WhiteNormal),
            SizedBox(height: 12),
            DateFormatter(dateTime: note.createdAt),
          ],
        ),
      ),
    );
  }
}
