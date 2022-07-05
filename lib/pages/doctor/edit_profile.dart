import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_health_doctor_and_admin/constants/constant_lists.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_edit_profile_model.dart';
import 'package:one_health_doctor_and_admin/helpers/doctor_profile_model.dart';
import 'package:one_health_doctor_and_admin/helpers/text_field_validator_mixin.dart';
import 'package:one_health_doctor_and_admin/pages/doctor/edit_profile_shimmer.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_departments_alertbox.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_image_card.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_submit_button.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_text_formfield.dart';

class DoctorEditProfile extends StatefulWidget {
  DoctorEditProfile({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController qualificationController = TextEditingController();
  final TextEditingController departmentsController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController expertiseController = TextEditingController();
  final TextEditingController startingTimeController = TextEditingController();
  final TextEditingController finishingTimeController = TextEditingController();
  final TextEditingController feeAmountController = TextEditingController();
  final TextEditingController daysController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  State<DoctorEditProfile> createState() => _DoctorEditProfileState();
}

class _DoctorEditProfileState extends State<DoctorEditProfile>
    with TextFieldValidator {
  bool isMondaySelected = false;
  bool isTuesdaySelected = false;
  bool isWednesdaySelected = false;
  bool isThursdaySelected = false;
  bool isFridaySelected = false;
  bool isSaturdaySelected = false;
  bool isSundaySelected = false;
  late bool isAdmin;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  List<int> selectedDays() {
    final List<int> selectedDaysList = [];
    if (isSundaySelected) {
      selectedDaysList.add(1);
    }
    if (isMondaySelected) {
      selectedDaysList.add(2);
    }
    if (isTuesdaySelected) {
      selectedDaysList.add(3);
    }
    if (isWednesdaySelected) {
      selectedDaysList.add(4);
    }
    if (isThursdaySelected) {
      selectedDaysList.add(5);
    }
    if (isFridaySelected) {
      selectedDaysList.add(6);
    }
    if (isSaturdaySelected) {
      selectedDaysList.add(7);
    }
    return selectedDaysList;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: lightGreyTwo,
      child: FutureBuilder<DoctorProfileModel?>(
          future: profileController.doctorProfileResponse(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error.toString()} occurred',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              } else if (snapshot.hasData) {
                widget.nameController.text = snapshot.data!.name;
                widget.emailController.text = snapshot.data!.email;
                widget.phoneNumberController.text =
                    snapshot.data!.phoneNumber!.substring(3);
                widget.qualificationController.text =
                    snapshot.data!.qualification;
                widget.departmentsController.text = snapshot.data!.department;
                widget.experienceController.text = snapshot.data!.experience;
                widget.expertiseController.text =
                    snapshot.data!.areaOfExpertise;
                widget.startingTimeController.text = snapshot.data!.opTimeStart;
                widget.finishingTimeController.text = snapshot.data!.opTimeEnd;
                widget.feeAmountController.text = snapshot.data!.fee.toString();
                widget.daysController.text = snapshot.data!.days.toString();
                widget.imageController.text = snapshot.data!.imagePath;
                isAdmin = snapshot.data!.isAdmin;
                if (snapshot.data!.days.contains(1)) {
                  isSundaySelected = true;
                }
                if (snapshot.data!.days.contains(2)) {
                  isMondaySelected = true;
                }
                if (snapshot.data!.days.contains(3)) {
                  isTuesdaySelected = true;
                }
                if (snapshot.data!.days.contains(4)) {
                  isWednesdaySelected = true;
                }
                if (snapshot.data!.days.contains(5)) {
                  isThursdaySelected = true;
                }
                if (snapshot.data!.days.contains(6)) {
                  isFridaySelected = true;
                }
                if (snapshot.data!.days.contains(7)) {
                  isSaturdaySelected = true;
                }

                return SingleChildScrollView(
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
                          'Edit Profile',
                          style:
                              mainHeaderStyle.copyWith(color: Colors.redAccent),
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
                                        CustomCircularImageCard(
                                          // fileImagePath:
                                          //     ScreenRegister.imageController.text,
                                          imagePath: snapshot.data!.imagePath,
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
                                      textController: widget.nameController,
                                      validator: (val) {
                                        return isNameValid(
                                            widget.nameController.text, 'name');
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
                                      textController: widget.emailController,
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
                                          widget.phoneNumberController,
                                      validator: (val) {
                                        return isMobileValid(
                                          widget.phoneNumberController.text,
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
                                          widget.qualificationController,
                                      validator: (val) {
                                        return isValid(
                                          widget.qualificationController.text,
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
                                              widget.departmentsController),
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
                                  textController: widget.experienceController,
                                  validator: (val) {
                                    return isValid(
                                      widget.experienceController.text,
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
                                  textController: widget.expertiseController,
                                  validator: (val) {
                                    return isValid(
                                      widget.expertiseController.text,
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
                            Text(
                              'Select working days : ',
                              style: GoogleFonts.ubuntu(color: Colors.black),
                            ),
                            StatefulBuilder(builder: (context, function) {
                              return SizedBox(
                                width: 900,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
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
                                                    ? Icons
                                                        .check_box_outline_blank
                                                    : Icons.check_box))),
                                        Text(days[0]),
                                      ],
                                    ),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
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
                                                    ? Icons
                                                        .check_box_outline_blank
                                                    : Icons.check_box))),
                                        Text(days[1]),
                                      ],
                                    ),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
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
                                                    ? Icons
                                                        .check_box_outline_blank
                                                    : Icons.check_box))),
                                        Text(days[2]),
                                      ],
                                    ),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
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
                                                    ? Icons
                                                        .check_box_outline_blank
                                                    : Icons.check_box))),
                                        Text(days[3]),
                                      ],
                                    ),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
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
                                                    ? Icons
                                                        .check_box_outline_blank
                                                    : Icons.check_box))),
                                        Text(days[4]),
                                      ],
                                    ),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
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
                                                    ? Icons
                                                        .check_box_outline_blank
                                                    : Icons.check_box))),
                                        Text(days[5]),
                                      ],
                                    ),
                                    Wrap(
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
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
                                                    ? Icons
                                                        .check_box_outline_blank
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
                                  textController: widget.startingTimeController,
                                  validator: (val) {
                                    return isValid(
                                      widget.startingTimeController.text,
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
                                      widget.finishingTimeController,
                                  validator: (val) {
                                    return isValid(
                                      widget.finishingTimeController.text,
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
                                  textController: widget.feeAmountController,
                                  validator: (val) {
                                    return isValid(
                                      widget.feeAmountController.text,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    doctorProfileEditController.editProfile(
                                        DoctorEditProfileModel(
                                            isAdmin: isAdmin,
                                            name: widget.nameController.text,
                                            email: widget.emailController.text,
                                            phoneNumber: widget
                                                .phoneNumberController.text,
                                            qualification: widget
                                                .qualificationController.text,
                                            department: widget
                                                .departmentsController.text,
                                            experience: widget
                                                .experienceController.text,
                                            expertise:
                                                widget.expertiseController.text,
                                            startingTime: widget
                                                .startingTimeController.text,
                                            finishingTime: widget
                                                .finishingTimeController.text,
                                            days: selectedDays(),
                                            feeAmount: int.parse(widget
                                                .feeAmountController.text),
                                            isRequested: true,
                                            id: '',
                                            imagePath:
                                                widget.imageController.text),
                                        context,
                                        false);
                                  }
                                },
                                child: const CustomSubmitButton(
                                    bgColor: Colors.red, text: 'SAVE CHANGES'),
                              ),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: InkWell(
                                onTap: () {
                                  navigationController.navigateUntil(
                                      profilePageView,
                                      arguments: '');
                                },
                                child: const CustomSubmitButton(
                                    bgColor: Colors.blue, text: 'GO BACK'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ),
                );
              }
            }
            return EditProfileLoad();
          }),
    );
  }
}
