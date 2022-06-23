
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';
import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/helpers/text_field_validator_mixin.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_image_card.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_submit_button.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_text_formfield.dart';

class ScreenSIgnInwIthotpSmall extends StatelessWidget with TextFieldValidator {
  const ScreenSIgnInwIthotpSmall({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.height,
    required this.width,
    required this.mobileNumberController,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final double height;
  final double width;
  final TextEditingController mobileNumberController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: height * 0.05,
                    width: width,
                  ),
                  Text(
                    'Hello Again!',
                    style: mainHeaderStyle,
                  ),
                  Text(
                    'Please provide the registered mobile number',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.quicksand(
                        fontSize: 13, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                width: width,
                height: height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: const CustomImageCard(
                  imagePath: 'assets/images/sign_with_otp.jpg',
                  ratio: 1.5,
                ),
              ),
              SizedBox(
                width: width,
                height: height * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: height * 0.01, horizontal: width * 0.1),
                child: CustomTextFormField(
                    validator: (val) {
                      return isMobileValid(val);
                    },
                    hintText: 'Mobile number',
                    keyBoardType: TextInputType.number,
                    iconData: Icons.phone,
                    nextAction: TextInputAction.done,
                    textController: mobileNumberController),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (_formKey.currentState!.validate()) {
                        print('ready to api post');
                        loginPageController
                            .doctorRequestOtp(mobileNumberController.text);
                      }
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.01, horizontal: width * 0.1),
                    child: const CustomSubmitButton(
                        text: 'SEND OTP', bgColor: Colors.blue),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
