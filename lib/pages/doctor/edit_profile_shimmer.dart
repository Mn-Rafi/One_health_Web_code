import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_image_card.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_submit_button.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_text_formfield.dart';
import 'package:shimmer/shimmer.dart';

class EditProfileLoad extends StatelessWidget {
  EditProfileLoad({Key? key}) : super(key: key);

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.white38,
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
                width: double.infinity,
              ),
              Text(
                'Edit Profile',
                style: mainHeaderStyle.copyWith(color: Colors.redAccent),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 320,
                        width: 500,
                        child: Center(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 160,
                              ),
                              const Align(
                                  alignment: Alignment.bottomCenter,
                                  child: CustomCircularImageCard(
                                    imagePath:
                                        'https://cdn-icons-png.flaticon.com/512/1004/1004733.png',
                                    radius: 30,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 500,
                        child: CustomTextFormField(
                            iconData: Icons.person,
                            textController: textEditingController,
                            hintText: 'Enter name',
                            keyBoardType: TextInputType.emailAddress),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 500,
                        child: CustomTextFormField(
                            iconData: Icons.email,
                            textController: textEditingController,
                            hintText: 'Enter email',
                            keyBoardType: TextInputType.emailAddress),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 500,
                        child: CustomTextFormField(
                            iconData: Icons.phone,
                            textController: textEditingController,
                            hintText: 'Enter phone number',
                            keyBoardType: TextInputType.number),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 500,
                        child: CustomTextFormField(
                            iconData: Icons.school,
                            textController: textEditingController,
                            hintText: 'Enter qualification',
                            keyBoardType: TextInputType.number),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {},
                        child: SizedBox(
                          width: 500,
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: CustomSmallTextFormField(
                                isEnabled: false,
                                hintText: 'Select a department',
                                keyBoardType: TextInputType.name,
                                iconData: Icons.arrow_drop_down,
                                textController: textEditingController),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
                width: double.infinity,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 500,
                    child: CustomTextFormField(
                        iconData: Icons.grade_sharp,
                        textController: textEditingController,
                        hintText: 'Experience in years',
                        keyBoardType: TextInputType.number),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    width: 500,
                    child: CustomTextFormField(
                        iconData: Icons.auto_graph,
                        textController: textEditingController,
                        hintText: 'Expertise',
                        keyBoardType: TextInputType.name),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
                width: double.infinity,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Select working days : ',
                    style: GoogleFonts.ubuntu(color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
                width: double.infinity,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    child: CustomTextFormField(
                        iconData: Icons.timer,
                        textController: textEditingController,
                        hintText: 'Starting time (HH:MM AM/PM)',
                        keyBoardType: TextInputType.datetime),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    width: 350,
                    child: CustomTextFormField(
                        iconData: Icons.timer,
                        textController: textEditingController,
                        hintText: 'Finishing time (HH:MM AM/PM)',
                        keyBoardType: TextInputType.datetime),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  SizedBox(
                    width: 350,
                    child: CustomTextFormField(
                        iconData: Icons.money,
                        textController: textEditingController,
                        hintText: 'Your fee',
                        keyBoardType: TextInputType.number),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
                width: double.infinity,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: InkWell(
                  onTap: () {},
                  child: const CustomSubmitButton(
                      bgColor: Colors.deepPurple, text: 'SAVE CHANGES'),
                ),
              ),
              const SizedBox(
                height: 20,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
