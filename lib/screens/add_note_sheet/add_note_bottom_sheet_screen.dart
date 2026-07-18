import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:note_app/core/constants/app_color.dart';
import 'package:note_app/core/constants/app_text_style.dart';
import 'package:note_app/core/constants/hive_boxes.dart';
import 'package:note_app/screens/add_note_sheet/widget/color_picker.dart';
import 'package:note_app/utils/custom_text_field.dart';
import 'package:sizer/sizer.dart';

import '../../core/managers/hive_manager.dart';
import '../../generated/l10n.dart';
import '../../models/note_model.dart';

class AddNoteBottomSheetScreen extends StatefulWidget {
  const AddNoteBottomSheetScreen({super.key});

  @override
  State<AddNoteBottomSheetScreen> createState() =>
      _AddNoteBottomSheetScreenState();
}

class _AddNoteBottomSheetScreenState extends State<AddNoteBottomSheetScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _contentFocusNode = FocusNode();

  Color _selectedColor = AppColor.cardColors.first;

  @override
  void initState() {
    super.initState();

    _titleController.addListener(() {
      setState(() {});
    });

    _contentController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();

    _titleFocusNode.dispose();
    _contentFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            CustomTextField().buildTextField(
              context: context,
              controller: _titleController,
              focusNode: _titleFocusNode,
              hintText: S.of(context).titleLabel,
              textInputAction: TextInputAction.next,
              maxLines: 1,
              inputFormatters: [LengthLimitingTextInputFormatter(100)],
            ),
            SizedBox(height: 15),
            CustomTextField().buildTextField(
              context: context,
              controller: _contentController,
              focusNode: _contentFocusNode,
              hintText: S.of(context).contentLabel,
              textInputAction: TextInputAction.done,
              maxLines: 6,
              inputFormatters: [LengthLimitingTextInputFormatter(1000)],
            ),
            SizedBox(height: 15),
            ColorPicker(
              colors: AppColor.cardColors,
              selectedColor: _selectedColor,
              onColorSelected: (color) {
                setState(() {
                  _selectedColor = color;
                });
              },
            ),
            SizedBox(height: 20),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 100.w,
              height: 5.h,
              child: ElevatedButton(
                onPressed: _canSave ? _addNote : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: AppColor.basicWhite,
                ),
                child: Text(
                  S.of(context).addNoteButtonLabel,
                  style: AppTextStyle.font20WhiteBold,
                ),
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Future<void> _addNote() async {
    final title = _titleController.text.trim();
    final content = _contentController.text.trim();

    if (title.isEmpty || content.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(S.of(context).snakBarMessage)));
      return;
    }

    final note = NoteModel(
      title: title,
      content: content,
      color: _selectedColor.toARGB32(),
      createdAt: DateTime.now(),
    );

    await HiveManager.instance.add<NoteModel>(
      boxName: HiveBoxes.notes,
      value: note,
    );

    if (!mounted) return;

    Navigator.pop(context);
  }

  bool get _canSave {
    return _titleController.text.trim().isNotEmpty ||
        _contentController.text.trim().isNotEmpty;
  }
}
