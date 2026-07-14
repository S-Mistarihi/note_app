import 'package:flutter/material.dart';
import 'package:note_app/core/constants/app_color.dart';
import 'package:note_app/screens/add_note_sheet/add_note_bottom_sheet_screen.dart';
import 'package:note_app/screens/home/widget/build_body_without_data.dart';
import 'package:note_app/screens/home/widget/build_header.dart';
import 'package:sizer/sizer.dart';

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
            BuildBodyWithoutData(),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            enableDrag: true,
            constraints: BoxConstraints(
              maxHeight: 60.h,
              minHeight: 10.h,
              maxWidth: 100.w,
              minWidth: 100.w,
            ),
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

/*
* ValueListenableBuilder(
  valueListenable: box.listenable(),

  builder: (context, box, child) {

    final notes = box.values.toList();

    if (notes.isEmpty) {
      return const EmptyNotesScreen();
    }

    return NotesScreen(notes: notes);
  },
)
*
*
* */
