import 'package:flutter/material.dart';
import 'package:note_app/core/constants/app_color.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/screens/edit_note/widget/build_header.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/app_text_style.dart';
import '../add_note_sheet/widget/color_picker.dart';

class EditNoteScreen extends StatefulWidget {
  final NoteModel note;

  const EditNoteScreen({super.key, required this.note});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _fillData();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 6.h),
              BuildHeader(onPressedSavedUpdate: _updateNote),
              SizedBox(height: 5.h),
              _buildTextField(
                controller: _titleController,
                hintText: 'Title',
                maxLines: 2,
              ),
              SizedBox(height: 15),
              _buildTextField(
                controller: _contentController,
                hintText: 'Type Something ...',
                maxLines: 10,
              ),
              SizedBox(height: 20),
              ColorPicker(
                colors: AppColor.cardColors,
                selectedColor: _selectedColor,
                onColorSelected: (color) {
                  setState(() {
                    _selectedColor = color;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required int maxLines,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.text,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.font24WhiteNormal,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white, width: 1.5),
        ),
      ),
    );
  }

  void _fillData() {
    _titleController = TextEditingController(text: widget.note.title);
    _contentController = TextEditingController(text: widget.note.content);
    _selectedColor = Color(widget.note.color);
  }

  Future<void> _updateNote() async {
    widget.note.title = _titleController.text.trim();

    widget.note.content = _contentController.text.trim();

    widget.note.color = _selectedColor.toARGB32();

    await widget.note.save();

    if (!mounted) return;

    Navigator.pop(context);
  }
}
