import 'package:flutter/material.dart';
import 'package:note_app/core/constants/app_color.dart';
import 'package:note_app/core/constants/app_text_style.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/screens/edit_note/edit_note_screen.dart';
import 'package:note_app/utils/date_formatter.dart';
import 'package:sizer/sizer.dart';

class BuildBodyWithData extends StatefulWidget {
  final NoteModel note;

  const BuildBodyWithData({super.key, required this.note});

  @override
  State<BuildBodyWithData> createState() => _BuildBodyWithDataState();
}

class _BuildBodyWithDataState extends State<BuildBodyWithData> {
  bool _isDeleteMode = false;
  bool _isVisible = false;
  bool _isDeleting = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      if (!mounted) return;

      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final note = widget.note;
    return AnimatedSlide(
      offset: _isVisible ? Offset.zero : const Offset(0, 0.2),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        opacity: _isVisible ? 1 : 0,
        duration: const Duration(milliseconds: 350),
        child: AnimatedScale(
          scale: _isDeleting ? 0 : 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: AnimatedOpacity(
            opacity: _isDeleting ? 0 : 1,
            duration: const Duration(milliseconds: 300),
            child: GestureDetector(
              onTap: () {
                if (_isDeleteMode) {
                  setState(() {
                    _isDeleteMode = false;
                  });

                  return;
                }
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        EditNoteScreen(note: note),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                          const begin = Offset(0.0, 1.0);
                          const end = Offset.zero;

                          final tween = Tween(
                            begin: begin,
                            end: end,
                          ).chain(CurveTween(curve: Curves.ease));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                  ),
                );
              },
              onLongPress: () {
                setState(() {
                  _isDeleteMode = true;
                });
              },
              child: AnimatedScale(
                scale: _isDeleteMode ? 0.96 : 1,
                duration: const Duration(milliseconds: 300),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOut,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: _isDeleteMode
                        ? AppColor.deleteIconBackgroundColor
                        : Color(note.color),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _isDeleteMode
                        ? _buildDeleteMode()
                        : _buildNoteContent(note),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteMode() {
    return Center(
      key: const ValueKey('delete'),
      child: IconButton(
        onPressed: _showDeleteDialog,
        icon: Icon(Icons.delete_forever, color: AppColor.basicWhite, size: 40),
      ),
    );
  }

  Widget _buildNoteContent(NoteModel note) {
    return Column(
      key: const ValueKey('content'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(note.title, style: AppTextStyle.font18BlackNormal),
        const SizedBox(height: 8),
        Text(note.content, style: AppTextStyle.font18BlackNormal),
        const SizedBox(height: 12),
        DateFormatter(dateTime: note.createdAt),
      ],
    );
  }

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 30),
                Text(
                  'Are you sure you want to delete this note?',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.font20WhiteBold,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5.h,
                      width: 28.w,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isDeleteMode = false;
                          });
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: AppColor.basicWhite,
                        ),
                        child: Text(
                          'Cancel',
                          style: AppTextStyle.font20WhiteBold,
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    SizedBox(
                      height: 5.h,
                      width: 28.w,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _isDeleting = true;
                          });

                          await Future.delayed(
                            const Duration(milliseconds: 300),
                          );

                          await widget.note.delete();

                          if (!context.mounted) return;

                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.deleteIconBackgroundColor,
                          foregroundColor: AppColor.basicWhite,
                        ),
                        child: Text(
                          'Delete',
                          style: AppTextStyle.font20WhiteBold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
