import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/app_color.dart';
import '../../core/constants/hive_boxes.dart';
import '../../core/enum/sort_type.dart';
import '../../core/managers/hive_manager.dart';
import '../../models/note_model.dart';

import '../../utils/note_shorter.dart';
import '../add_note_sheet/add_note_bottom_sheet_screen.dart';

import 'widget/build_body_with_data.dart';
import 'widget/build_body_without_data.dart';
import 'widget/build_header.dart';
import 'widget/search_box.dart';
import 'widget/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  SortType _sortType = SortType.newest;

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  List<NoteModel> _searchNotes(List<NoteModel> notes) {
    final query = _searchController.text.trim().toLowerCase();

    if (query.isEmpty) {
      return notes;
    }

    return notes.where((note) {
      return note.title.toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 6.h),
            BuildHeader(
              currentSort: _sortType,
              onSortSelected: (value) {
                setState(() {
                  _sortType = value;
                });
              },
            ),
            SizedBox(height: 12),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: HiveManager.instance
                    .box<NoteModel>(HiveBoxes.notes)
                    .listenable(),

                builder: (context, box, child) {
                  final allNotes = box.values.cast<NoteModel>().toList();
                  final searchedNotes = _searchNotes(allNotes);
                  final sortedNotes = NoteSorter.sort(searchedNotes, _sortType);

                  final pinnedNotes = sortedNotes
                      .where((note) => note.isPinned)
                      .toList();

                  final otherNotes = sortedNotes
                      .where((note) => !note.isPinned)
                      .toList();

                  return Column(
                    children: [
                      SearchBox(
                        controller: _searchController,
                        onChanged: (_) {
                          setState(() {});
                        },
                        onClear: () {
                          _searchController.clear();
                          setState(() {});
                        },
                      ),
                      //SizedBox(height: 20),
                      Expanded(
                        child: sortedNotes.isEmpty
                            ? BuildBodyWithoutData(
                                isSearchEmpty:
                                    _searchController.text.isNotEmpty,
                              )
                            : ListView(
                                children: [
                                  if (pinnedNotes.isNotEmpty) ...[
                                    SectionHeader(
                                      icon: Icons.push_pin,
                                      title: 'Pinned',
                                    ),

                                    ...pinnedNotes.map(
                                      (note) => BuildBodyWithData(note: note),
                                    ),
                                  ],

                                  if (otherNotes.isNotEmpty) ...[
                                    SectionHeader(
                                      icon: Icons.notes,
                                      title: 'Others',
                                    ),

                                    ...otherNotes.map(
                                      (note) => BuildBodyWithData(note: note),
                                    ),
                                  ],
                                ],
                              ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        foregroundColor: AppColor.basicWhite,
        shape: const CircleBorder(),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isDismissible: true,
            enableDrag: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            ),
            builder: (_) {
              return const AddNoteBottomSheetScreen();
            },
          );
        },
        child: const Icon(Icons.add, size: 35),
      ),
    );
  }
}
