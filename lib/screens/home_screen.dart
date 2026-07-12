import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app/utils/app_assets.dart';
import 'package:note_app/utils/app_colors.dart';
import 'package:note_app/utils/app_text_style.dart';
import 'package:note_app/widgets/custom_icon_button.dart';
import 'package:note_app/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey _key = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  final List<Color> _pickedColor=[
    AppColors.cardColorOne,
    AppColors.cardColorTwo,
    AppColors.cardColorThree,
    AppColors.cardColorFour,
    AppColors.cardColorFive,
    AppColors.cardColorSix,
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _titleFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                Text('Note', style: AppTextStyle.font28WhiteBold),
                Spacer(),
                CustomIconButton().buildIconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                SizedBox(width: 2.4.w),
                CustomIconButton().buildIconButton(
                  onPressed: () {},
                  icon: Icon(Icons.sort),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Lottie.asset(AppAssets.createFirstNote),
            Text(
              'Create your first note !',
              style: AppTextStyle.font20WhiteBold,
            ),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isDismissible: true,
          enableDrag: true,
          constraints: BoxConstraints(
            maxHeight: 40.h,
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
          builder: (context) {
            return Container(
              width: 100.w,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Form(
                      key: _key,
                      child: Column(
                        children: [
                          CustomTextField().buildTextFormField(
                            controller: _titleController,
                            focusNode: _titleFocusNode,
                            hintText: 'Title',
                            textInputAction: TextInputAction.next,
                            maxLines: 1,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(100),
                            ],
                          ),
                          SizedBox(height: 10,),
                          CustomTextField().buildTextFormField(
                            controller: _descriptionController,
                            focusNode: _descriptionFocusNode,
                            hintText: 'Type Something ...',
                            textInputAction: TextInputAction.done,
                            maxLines: 5,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1000),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    _buildAddNoteButton(),
                  ],
                ),
              ),
            );
          },
        );
      },
      backgroundColor: AppColors.buttonBackground,
      foregroundColor: AppColors.basicWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      elevation: 5,
      child: Icon(Icons.add, size: 30),
    );
  }

  Widget _buildAddNoteButton() {
    return SizedBox(
      width: 100.w,
      height: 5.3.h,
      child: ElevatedButton(onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.buttonBackground,
            foregroundColor: AppColors.basicWhite,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
          ),
          child: Text('Add Note', style: AppTextStyle.font24WhiteNormal,)),
    );
  }
}
