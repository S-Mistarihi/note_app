import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_app/core/constants/app_color.dart';
import 'package:note_app/core/enum/sort_type.dart';
import 'package:note_app/screens/add_note_sheet/add_note_bottom_sheet_screen.dart';
import 'package:note_app/screens/home/widget/build_body_with_data.dart';
import 'package:note_app/screens/home/widget/build_body_without_data.dart';
import 'package:note_app/screens/home/widget/build_header.dart';
import 'package:note_app/screens/home/widget/section_header.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/hive_boxes.dart';
import '../../core/managers/hive_manager.dart';
import '../../core/managers/sort_manager.dart';
import '../../models/note_model.dart';
import '../../utils/note_shorter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SortType _sortType;

  @override
  void initState() {
    super.initState();
    _sortType = SortManager.instance.getSort();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 6.h),
            BuildHeader(
              currentSort: _sortType,
              onSortSelected: (sortType) async {
                await SortManager.instance.saveSort(sortType);
                setState(() {
                  _sortType = sortType;
                });
              },
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: HiveManager.instance
                    .box<NoteModel>(HiveBoxes.notes)
                    .listenable(),

                builder: (context, box, child) {
                  final notes = box.values.cast<NoteModel>().toList();

                  if (notes.isEmpty) {
                    return const BuildBodyWithoutData();
                  }

                  final pinnedNotes = notes
                      .where((note) => note.isPinned)
                      .toList();

                  final otherNotes = notes
                      .where((note) => !note.isPinned)
                      .toList();

                  NoteSorter.sort(pinnedNotes, _sortType);
                  NoteSorter.sort(otherNotes, _sortType);

                  return ListView(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    children: [
                      /// Pinned Notes
                      /// ===========================
                      if (pinnedNotes.isNotEmpty) ...[
                        const Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: SectionHeader(
                            icon: Icons.push_pin,
                            title: 'Pinned',
                          ),
                        ),

                        ...pinnedNotes.map(
                          (note) => BuildBodyWithData(note: note),
                        ),

                        const SizedBox(height: 20),
                      ],

                      /// Other Notes
                      /// ===========================
                      if (otherNotes.isNotEmpty) ...[
                        const Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: SectionHeader(
                            icon: Icons.notes,
                            title: 'Others',
                          ),
                        ),

                        ...otherNotes.map(
                          (note) => BuildBodyWithData(note: note),
                        ),
                      ],
                    ],
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
