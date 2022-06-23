import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_health_doctor_and_admin/api/doctor_api/doctor_register_api_services.dart';
import 'package:one_health_doctor_and_admin/constants/constant_lists.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_register_model.dart';
import 'package:one_health_doctor_and_admin/helpers/text_field_validator_mixin.dart';
import 'package:one_health_doctor_and_admin/site_layout.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_departments_alertbox.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_image_card.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_submit_button.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_text_formfield.dart';
// import 'package:image_picker/image_picker.dart';

class ScreenRegister extends StatefulWidget {
  const ScreenRegister({Key? key}) : super(key: key);

  static TextEditingController nameController = TextEditingController();

  static TextEditingController emailController = TextEditingController();
  static TextEditingController phoneNumberController = TextEditingController();
  static TextEditingController qualificationController =
      TextEditingController();
  static TextEditingController departmentsController = TextEditingController();
  static TextEditingController experienceController = TextEditingController();
  static TextEditingController expertiseController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController confirmPasswordController =
      TextEditingController();
  static TextEditingController startingTimeController = TextEditingController();
  static TextEditingController finishingTimeController =
      TextEditingController();
  static TextEditingController feeAmountController = TextEditingController();
  static TextEditingController daysController = TextEditingController();
  static TextEditingController imageController = TextEditingController();

  @override
  State<ScreenRegister> createState() => _ScreenRegisterState();
}

class _ScreenRegisterState extends State<ScreenRegister>
    with TextFieldValidator {
  bool isMondaySelected = false;
  bool isTuesdaySelected = false;
  bool isWednesdaySelected = false;
  bool isThursdaySelected = false;
  bool isFridaySelected = false;
  bool isSaturdaySelected = false;
  bool isSundaySelected = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kboxdecoration,
      child: Scaffold(
          backgroundColor: Colors.white.withOpacity(0.5),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                    width: double.infinity,
                  ),
                  Text(
                    'Screen Register',
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
                            child: Stack(
                              children: const [
                                CustomCircularImageCard(
                                  // fileImagePath:
                                  //     ScreenRegister.imageController.text,
                                  imagePath: 'images/circle_avatar.jpg',
                                  radius: 160,
                                ),
                                Align(
                                    alignment: Alignment.bottomCenter,
                                    child: CustomCircularImageCard(
                                      imagePath: 'images/add_image_icon.png',
                                      radius: 30,
                                    )),
                              ],
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
                                textController: ScreenRegister.nameController,
                                validator: (val) {
                                  return isNameValid(
                                      ScreenRegister.nameController.text,
                                      'name');
                                },
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
                                textController: ScreenRegister.emailController,
                                validator: (val) {
                                  return isEmailValid(val);
                                },
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
                                textController:
                                    ScreenRegister.phoneNumberController,
                                validator: (val) {
                                  return isMobileValid(
                                    ScreenRegister.phoneNumberController.text,
                                  );
                                },
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
                                textController:
                                    ScreenRegister.qualificationController,
                                validator: (val) {
                                  return isValid(
                                    ScreenRegister.qualificationController.text,
                                    'qualification',
                                  );
                                },
                                hintText: 'Enter qualification',
                                keyBoardType: TextInputType.number),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const DepartmentsAlertBox());
                            },
                            child: SizedBox(
                              width: 500,
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: CustomSmallTextFormField(
                                    isEnabled: false,
                                    hintText: 'Select a department',
                                    keyBoardType: TextInputType.name,
                                    iconData: Icons.arrow_drop_down,
                                    textController:
                                        ScreenRegister.departmentsController),
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
                            textController: ScreenRegister.experienceController,
                            validator: (val) {
                              return isValid(
                                ScreenRegister.experienceController.text,
                                'Experience in years',
                              );
                            },
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
                            textController: ScreenRegister.expertiseController,
                            validator: (val) {
                              return isValid(
                                ScreenRegister.expertiseController.text,
                                'Expertise',
                              );
                            },
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
                      SizedBox(
                        width: 500,
                        child: CustomTextFormField(
                            iconData: Icons.password,
                            textController: ScreenRegister.passwordController,
                            validator: (val) {
                              return isPasswordValid(
                                ScreenRegister.passwordController.text,
                              );
                            },
                            obscure: true,
                            hintText: 'Enter Password',
                            keyBoardType: TextInputType.name),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      SizedBox(
                        width: 500,
                        child: CustomTextFormField(
                            obscure: true,
                            iconData: Icons.password,
                            textController:
                                ScreenRegister.confirmPasswordController,
                            validator: (val) {
                              return isPasswordValid(
                                ScreenRegister.confirmPasswordController.text,
                              );
                            },
                            hintText: 'Confirm password',
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
                      StatefulBuilder(builder: (context, function) {
                        return SizedBox(
                          width: 900,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.center,
                                children: [
                                  MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isMondaySelected =
                                                  !isMondaySelected;
                                              if (isMondaySelected) {}
                                            });
                                          },
                                          child: Icon(!isMondaySelected
                                              ? Icons.check_box_outline_blank
                                              : Icons.check_box))),
                                  Text(days[0]),
                                ],
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.center,
                                children: [
                                  MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isTuesdaySelected =
                                                  !isTuesdaySelected;
                                            });
                                          },
                                          child: Icon(!isTuesdaySelected
                                              ? Icons.check_box_outline_blank
                                              : Icons.check_box))),
                                  Text(days[1]),
                                ],
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.center,
                                children: [
                                  MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isWednesdaySelected =
                                                  !isWednesdaySelected;
                                            });
                                          },
                                          child: Icon(!isWednesdaySelected
                                              ? Icons.check_box_outline_blank
                                              : Icons.check_box))),
                                  Text(days[2]),
                                ],
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.center,
                                children: [
                                  MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isThursdaySelected =
                                                  !isThursdaySelected;
                                            });
                                          },
                                          child: Icon(!isThursdaySelected
                                              ? Icons.check_box_outline_blank
                                              : Icons.check_box))),
                                  Text(days[3]),
                                ],
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.center,
                                children: [
                                  MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isFridaySelected =
                                                  !isFridaySelected;
                                            });
                                          },
                                          child: Icon(!isFridaySelected
                                              ? Icons.check_box_outline_blank
                                              : Icons.check_box))),
                                  Text(days[4]),
                                ],
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.center,
                                children: [
                                  MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isSaturdaySelected =
                                                  !isSaturdaySelected;
                                            });
                                          },
                                          child: Icon(!isSaturdaySelected
                                              ? Icons.check_box_outline_blank
                                              : Icons.check_box))),
                                  Text(days[5]),
                                ],
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.center,
                                children: [
                                  MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              isSundaySelected =
                                                  !isSundaySelected;
                                            });
                                          },
                                          child: Icon(!isSundaySelected
                                              ? Icons.check_box_outline_blank
                                              : Icons.check_box))),
                                  Text(days[6]),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
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
                            textController:
                                ScreenRegister.startingTimeController,
                            validator: (val) {
                              return isValid(
                                ScreenRegister.startingTimeController.text,
                                'Startng time',
                              );
                            },
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
                            textController:
                                ScreenRegister.finishingTimeController,
                            validator: (val) {
                              return isValid(
                                ScreenRegister.finishingTimeController.text,
                                'Finishing time',
                              );
                            },
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
                            textController: ScreenRegister.feeAmountController,
                            validator: (val) {
                              return isValid(
                                ScreenRegister.feeAmountController.text,
                                'Fee',
                              );
                            },
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
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          registerDoctor(DoctorRegisterModel(
                              name: ScreenRegister.nameController.text,
                              email: ScreenRegister.emailController.text,
                              phoneNumber:
                                  ScreenRegister.phoneNumberController.text,
                              qualification:
                                  ScreenRegister.qualificationController.text,
                              department:
                                  ScreenRegister.departmentsController.text,
                              experience:
                                  ScreenRegister.experienceController.text,
                              expertise:
                                  ScreenRegister.expertiseController.text,
                              password: ScreenRegister.passwordController.text,
                              startingTime:
                                  ScreenRegister.startingTimeController.text,
                              finishingTime:
                                  ScreenRegister.finishingTimeController.text,
                              days: [0, 1, 2, 3, 4, 5, 6],
                              feeAmount: double.parse(
                                  ScreenRegister.feeAmountController.text),
                              isRequested: true,
                              image: File(
                                  '/data/user/0/com.example.one_health_hospital_app/cache/image_cropper_1655444950452.jpg')));
                        }
                      },
                      child: const CustomSubmitButton(
                          bgColor: Colors.deepPurple, text: 'REGISTER'),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

void registerDoctor(DoctorRegisterModel doctorRegisterModel) async {
  DoctorRegisterServices doctorRegisterServices = DoctorRegisterServices();
  try {
    final response = await doctorRegisterServices.registerUserResponse(
        doctorRegisterModel: doctorRegisterModel);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Registered Succesfully');
      // Get.showSnackbar(GetSnackBar(title: "Logged In Succesfully"));
      Get.to(SiteLayout());
    } else {
      print('ERRORRRRRRR');
      throw DioError;
    }
  } catch (e) {
    if (e is DioError) {
      print('HEre it is printing error');
      // Get.showSnackbar(GetSnackBar(title: e.response!.data["message"],));
      print(e.response!.data["message"]);
    }
  }
}
