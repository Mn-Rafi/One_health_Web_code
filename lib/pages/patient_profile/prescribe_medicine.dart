import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:one_health_doctor_and_admin/constants/controller.dart';

import 'package:one_health_doctor_and_admin/constants/styles.dart';
import 'package:one_health_doctor_and_admin/controllers/prescribe_medicine_controller.dart';
import 'package:one_health_doctor_and_admin/controllers/profile_controller.dart';
import 'package:one_health_doctor_and_admin/helpers/prescription_list_model.dart';
import 'package:one_health_doctor_and_admin/helpers/text_field_validator_mixin.dart';
import 'package:one_health_doctor_and_admin/pages/patient_profile/medicine_list.dart';
import 'package:one_health_doctor_and_admin/routing/routes.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_submit_button.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_table_header.dart';
import 'package:one_health_doctor_and_admin/widgets/custom_text_formfield.dart';
import 'package:shimmer/shimmer.dart';

class PrescribeMedicine extends StatefulWidget {
  final dynamic arguments;
  PrescribeMedicine({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  State<PrescribeMedicine> createState() => _PrescribeMedicineState();
}

class _PrescribeMedicineState extends State<PrescribeMedicine>
    with TextFieldValidator {
  TextEditingController medicineController = TextEditingController();

  TextEditingController dosageCOntroller = TextEditingController();

  TextEditingController prescribedForController = TextEditingController();

  PrescribeMedicineController prescribeMedicineController =
      PrescribeMedicineController();

  final _formKey = GlobalKey<FormState>();

  final List<PrescriptionListModel> presList = [];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Card(
              color: lightGreyTwo,
              margin: const EdgeInsets.all(50),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: [
                    Text(
                      'Prescribe Medicine',
                      style: mainHeaderStyle.copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      'Prescribe Medicine for ${widget.arguments["name"]}',
                      style: normalTextStyle.copyWith(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 50),
                    //   child: CustomTextFormField(
                    //       hintText: 'Medicine*',
                    //       validator: (value) {
                    //         return isValid(value, 'medicine');
                    //       },
                    //       keyBoardType: TextInputType.name,
                    //       iconData: Icons.medication_sharp,
                    //       textController: medicineController),
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: TypeAheadFormField(
                        onSuggestionSelected: (String val) {
                          this.medicineController.text = val;
                        },
                        getImmediateSuggestions: true,
                        hideSuggestionsOnKeyboardHide: true,
                        hideOnError: true,
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: medicineController,
                          decoration: InputDecoration(
                            hintText: 'Medicine*',
                            prefixIcon: Icon(
                              Icons.medication_sharp,
                              size: 17,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            labelText: 'Medicine*',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        hideOnEmpty: false,
                        itemBuilder: (_, String item) =>
                            ListTile(title: Text(item)),
                        suggestionsCallback: (pattern) => medicinesList.where(
                            (element) => element
                                .toLowerCase()
                                .contains(pattern.toString().toLowerCase())),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: CustomTextFormField(
                          hintText: 'Dosage*',
                          validator: (value) {
                            return isValid(value, 'dosage');
                          },
                          keyBoardType: TextInputType.name,
                          iconData: Icons.medication_sharp,
                          textController: dosageCOntroller),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: CustomTextFormField(
                        hintText: 'Prescribed For*',
                        validator: (value) {
                          return isValid(value, 'reason');
                        },
                        keyBoardType: TextInputType.name,
                        iconData: Icons.medication_sharp,
                        textController: prescribedForController,
                        nextAction: TextInputAction.done,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            presList.add(PrescriptionListModel(
                                date: DateTime.now().toString(),
                                dosage: dosageCOntroller.text,
                                medicine: medicineController.text,
                                prescribedFor: prescribedForController.text));
                            setState(() {
                              // dosageCOntroller.clear();
                              // medicineController.clear();
                              // prescribedForController.clear();
                            });
                          }
                        },
                        child: const CustomSubmitButton(
                          text: 'ADD PRESCIPTION TO LIST',
                          bgColor: Colors.blue,
                          buttonWidth: 300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (presList.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Card(
                color: lightGreyTwo,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    Table(
                        border:
                            TableBorder.all(color: Colors.black, width: 0.2),
                        children:
                            List<TableRow>.generate(presList.length, (index) {
                          return TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10),
                                child: Text(presList[index].medicine),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10),
                                child: Text(presList[index].dosage),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10),
                                child: Text(presList[index].prescribedFor),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10),
                                child: ElevatedButton(
                                    onPressed: () {
                                      presList.removeAt(index);
                                      setState(() {});
                                    },
                                    child: Text('clear',
                                        style: normalTextStyle.copyWith(
                                            color: Colors.white))),
                              ),
                            ],
                          );
                        }, growable: false))
                  ],
                ),
              ),
            ),
          if (presList.isNotEmpty)
            Column(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: InkWell(
                    onTap: () async {
                      print('*****************************');
                      final List<String> medicines = [];
                      final List<String> dosage = [];
                      final List<String> prescribedFor = [];
                      for (int i = 0; i < presList.length; i++) {
                        medicines.add(presList[i].medicine.toString());
                        dosage.add(presList[i].dosage.toString());
                        prescribedFor.add(presList[i].prescribedFor.toString());
                      }
                      final bool isPrescribed =
                          await prescribeMedicineController.postPrescription(
                        userId: widget.arguments["id"],
                        userName: widget.arguments["name"],
                        doctorName: doctorName!,
                        medicines: medicines,
                        dosage: dosage,
                        prescribedFor: prescribedFor,
                        context: context,
                      );
                      setState(() {
                        presList.clear();
                      });
                      print('*****************************');
                      if (isPrescribed) {
                        print('HELOOOOOOOOOOOOOOOOO');
                        setState(() {
                          presList.clear();
                        });
                      }
                    },
                    child: const CustomSubmitButton(
                      text: 'PRESCRIBE',
                      bgColor: Colors.blue,
                      buttonWidth: 300,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          Card(
            color: lightGreyTwo,
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                Table(
                  border: TableBorder.all(color: Colors.black),
                  children: const [
                    TableRow(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        children: [
                          CustomTableHead(title: 'MEDICINE'),
                          CustomTableHead(title: 'DOSAGE'),
                          CustomTableHead(title: 'DATE'),
                          CustomTableHead(title: 'PRESCRIBED FOR'),
                          CustomTableHead(title: 'OPTIONS'),
                        ]),
                  ],
                ),
                FutureBuilder<List<List<PrescriptionListModel>?>?>(
                    future:
                        prescribeMedicineController.getPatientPrescriptionList(
                            widget.arguments["id"].toString(), context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              '${snapshot.error.toString()} occurred',
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                        } else if (snapshot.hasData) {
                          return Table(
                              border: TableBorder.all(
                                  color: Colors.black, width: 0.2),
                              children: List<TableRow>.generate(
                                  snapshot.data!.length, (index) {
                                return TableRow(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: Column(
                                        children: List<Widget>.generate(
                                          snapshot.data![index]!
                                              .map((e) => e.medicine.length)
                                              .length,
                                          (ind) {
                                            final List<PrescriptionListModel>
                                                text = snapshot.data![index]!;
                                            return Text(text[ind].medicine);
                                          },
                                          growable: false,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: Column(
                                        children: List<Widget>.generate(
                                          snapshot.data![index]!
                                              .map((e) => e.medicine.length)
                                              .length,
                                          (ind) {
                                            final List<PrescriptionListModel>
                                                text = snapshot.data![index]!;
                                            return Text(text[ind].dosage);
                                          },
                                          growable: false,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: Column(
                                        children: List<Widget>.generate(
                                          snapshot.data![index]!
                                              .map((e) => e.medicine.length)
                                              .length,
                                          (ind) {
                                            final List<PrescriptionListModel>
                                                text = snapshot.data![index]!;
                                            return Text(text[ind].date);
                                          },
                                          growable: false,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: Column(
                                        children: List<Widget>.generate(
                                          snapshot.data![index]!
                                              .map((e) => e.medicine.length)
                                              .length,
                                          (ind) {
                                            final List<PrescriptionListModel>
                                                text = snapshot.data![index]!;
                                            return Text(
                                                text[ind].prescribedFor);
                                          },
                                          growable: false,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 10),
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text('clear',
                                              style: normalTextStyle.copyWith(
                                                  color: Colors.white))),
                                    ),
                                  ],
                                );
                              }, growable: false));
                        } else {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Prescription List is empty',
                                style: normalTextStyle.copyWith(fontSize: 20),
                              ),
                            ),
                          );
                        }
                      } else {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          child: Table(
                            border: TableBorder.all(color: Colors.black),
                            children: const [
                              TableRow(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                  ),
                                  children: [
                                    CustomTableHead(title: 'MEDICINE'),
                                    CustomTableHead(title: 'DOSAGE'),
                                    CustomTableHead(title: 'DATE'),
                                    CustomTableHead(title: 'PRESCRIBED FOR'),
                                    CustomTableHead(title: 'OPTIONS'),
                                  ]),
                            ],
                          ),
                        );
                      }
                    }),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
            child: ElevatedButton(
                onPressed: () {
                  navigationController.navigateUntil(
                      widget.arguments["isPatient"]
                          ? patientsPageView
                          : appointmentsPageView,
                      arguments: '');
                },
                child: Text('Go Back',
                    style: normalTextStyle.copyWith(color: Colors.white))),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
