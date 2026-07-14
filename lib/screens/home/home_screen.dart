import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/core/constants/app_color.dart';
import 'package:note_app/screens/add_note_sheet/add_note_bottom_sheet_screen.dart';
import 'package:note_app/screens/home/widget/build_body_with_data.dart';
import 'package:note_app/screens/home/widget/build_body_without_data.dart';
import 'package:note_app/screens/home/widget/build_header.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/hive_boxes.dart';
import '../../core/managers/hive_manager.dart';
import '../../models/note_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 6.h),
            BuildHeader(),

            Expanded(
              child: ValueListenableBuilder(
                valueListenable: HiveManager.instance
                    .box<NoteModel>(HiveBoxes.notes)
                    .listenable(),

                builder: (context, box, child) {
                  final notes = box.values.toList();

                  if (notes.isEmpty) {
                    return BuildBodyWithoutData();
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),

                    itemCount: notes.length,

                    itemBuilder: (context, index) {
                      final note = notes[index];

                      return BuildBodyWithData(note: note);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            enableDrag: true,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            builder: (_) {
              return AddNoteBottomSheetScreen();
            },
          );
        },
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton({
    required void Function()? onPressed,
  }) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.deepPurple,
      foregroundColor: AppColor.basicWhite,
      shape: CircleBorder(),
      elevation: 5,
      child: Icon(Icons.add, size: 35),
    );
  }
}


