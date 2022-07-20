// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sewakantor_flutter/models/user_model.dart';
import 'package:sewakantor_flutter/providers/auth_provider.dart';
import 'package:sewakantor_flutter/providers/page_provider.dart';
import 'package:sewakantor_flutter/shared/theme.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_button_text.dart';
import 'package:sewakantor_flutter/ui/widgets/custom_text_form_field.dart';

class PersonalInformationPage extends StatefulWidget {
  const PersonalInformationPage({Key? key}) : super(key: key);

  @override
  State<PersonalInformationPage> createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  TextEditingController firstNameController = TextEditingController(text: '');
  TextEditingController lastNameController = TextEditingController(text: '');
  TextEditingController phoneNumberController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController companyNameController = TextEditingController(text: '');
  TextEditingController companyEmailController =
      TextEditingController(text: '');
  TextEditingController countryController = TextEditingController(text: '');
  TextEditingController zipCodeController = TextEditingController(text: '');
  TextEditingController addressController = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();
  UserModel? user;

  @override
  void initState() {
    super.initState();

    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);

    user = authProvider.user;

    firstNameController.text = user!.firstName!;
    lastNameController.text = user!.lastName!;
    phoneNumberController.text = user!.phoneNumber ?? '';
    emailController.text = user!.email!;
    companyNameController.text = user!.companyName ?? '';
    companyEmailController.text = user!.companyEmail ?? '';
    countryController.text = user!.country ?? '';
    zipCodeController.text = user!.zipCode ?? '';
    addressController.text = user!.address ?? '';
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    UserModel user = authProvider.user;
    print(user.email);
    print(user.role);
    print(user.roleId);
    print(user.firstName);
    print(user.lastName);
    print(user.phoneNumber);
    print(user.companyName);
    print(user.companyEmail);
    print(user.country);
    print(user.zipCode);
    print(user.address);

    handleEditUser() async {
      try {
        if (await authProvider.editUserActiveLocal(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          phoneNumber: phoneNumberController.text,
          companyName: companyNameController.text,
          companyEmail: companyEmailController.text,
          country: countryController.text,
          zipCode: zipCodeController.text,
          address: addressController.text,
        )) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 2),
              backgroundColor: successColor,
              content: Text(
                'Berhasil Melakukan Perubahan',
                textAlign: TextAlign.center,
              ),
            ),
          );

          Navigator.pushNamedAndRemoveUntil(
              context, '/main-page', (route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: alertColor,
              content: Text(
                'Gagal Edit User',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      } catch (e) {
        rethrow;
      }
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          left: 35,
          top: 40,
          right: 35,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.chevron_left,
                size: 30,
              ),
            ),
            Text(
              'Personal Information',
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            Container(
              child: Icon(
                null,
                size: 30,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              Container(
                margin: EdgeInsets.only(
                  left: 35,
                  right: 35,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        title: 'First Name',
                        colorTitle: primaryColorBlackRussian,
                        colorBorder: primaryColorBlackRussian,
                        colorHintText:
                            primaryColorBlackRussian.withOpacity(0.4),
                        colorText: primaryColorBlackRussian,
                        hintText: 'Enter your first name',
                        controller: firstNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            //allow upper and lower case alphabets, space, and number
                            return "First Name Required";
                          } else if (!RegExp(r'^[a-z A-Z 0-9]+$')
                              .hasMatch(value)) {
                            return "Enter Correct Name";
                          } else if (value.length > 50) {
                            return "Name too long";
                          }
                          {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        title: 'Last Name',
                        colorTitle: primaryColorBlackRussian,
                        colorBorder: primaryColorBlackRussian,
                        colorHintText:
                            primaryColorBlackRussian.withOpacity(0.4),
                        colorText: primaryColorBlackRussian,
                        hintText: 'Enter your last name',
                        controller: lastNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            //allow upper and lower case alphabets, space, and number
                            return "Last Name Required";
                          } else if (!RegExp(r'^[a-z A-Z 0-9]+$')
                              .hasMatch(value)) {
                            return "Enter Correct Name";
                          } else if (value.length > 50) {
                            return "Name too long";
                          }
                          {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        title: 'Phone Number',
                        colorTitle: primaryColorBlackRussian,
                        colorBorder: primaryColorBlackRussian,
                        colorHintText:
                            primaryColorBlackRussian.withOpacity(0.4),
                        colorText: primaryColorBlackRussian,
                        hintText: 'Enter your Phone number',
                        controller: phoneNumberController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return null;
                          } else if (value.length <= 9) {
                            return "Phone Number must be more than 9 charachters";
                          } else if (value.length > 20) {
                            return "Phone Number must be more than 20 charachters";
                          }
                          {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        isEnabled: false,
                        title: 'Email',
                        colorTitle: primaryColorBlackRussian,
                        colorBorder: primaryColorBlackRussian,
                        colorHintText:
                            primaryColorBlackRussian.withOpacity(0.4),
                        colorText: primaryColorBlackRussian,
                        hintText: 'Enter your email',
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email Required";
                          } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Enter Correct Email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        title: 'Company Name',
                        colorTitle: primaryColorBlackRussian,
                        colorBorder: primaryColorBlackRussian,
                        colorHintText:
                            primaryColorBlackRussian.withOpacity(0.4),
                        colorText: primaryColorBlackRussian,
                        hintText: 'Enter your Company name',
                        controller: companyNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            //allow upper and lower case alphabets, space, and number
                            return null;
                          } else if (!RegExp(r'^[a-z A-Z 0-9]+$')
                              .hasMatch(value)) {
                            return "Enter Correct Company Name";
                          } else if (value.length > 50) {
                            return "Name too long";
                          }
                          {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        title: 'Company Email',
                        colorTitle: primaryColorBlackRussian,
                        colorBorder: primaryColorBlackRussian,
                        colorHintText:
                            primaryColorBlackRussian.withOpacity(0.4),
                        colorText: primaryColorBlackRussian,
                        hintText: 'Enter your Company email',
                        controller: companyEmailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return null;
                          } else if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                              .hasMatch(value)) {
                            return 'Enter Correct Email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2 -
                                  (35 + 10),
                              child: CustomTextFormField(
                                title: 'Country',
                                colorTitle: primaryColorBlackRussian,
                                colorBorder: primaryColorBlackRussian,
                                colorHintText:
                                    primaryColorBlackRussian.withOpacity(0.4),
                                colorText: primaryColorBlackRussian,
                                hintText: 'Country',
                                controller: countryController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    //allow upper and lower case alphabets, space, and number
                                    return null;
                                  } else if (!RegExp(r'^[a-z A-Z 0-9]+$')
                                      .hasMatch(value)) {
                                    return "Enter Correct Country";
                                  } else if (value.length > 50) {
                                    return "Country too long";
                                  }
                                  {
                                    return null;
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2 -
                                  (35 + 10),
                              child: CustomTextFormField(
                                title: 'Zip Code',
                                colorTitle: primaryColorBlackRussian,
                                colorBorder: primaryColorBlackRussian,
                                colorHintText:
                                    primaryColorBlackRussian.withOpacity(0.4),
                                colorText: primaryColorBlackRussian,
                                hintText: 'Zip Code',
                                controller: zipCodeController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return null;
                                  } else if (value.length < 4) {
                                    return "Zip Code => 4 char";
                                  } else if (value.length > 7) {
                                    return "Zip Code <= 7";
                                  }
                                  {
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        title: 'Address',
                        colorTitle: primaryColorBlackRussian,
                        colorBorder: primaryColorBlackRussian,
                        colorHintText:
                            primaryColorBlackRussian.withOpacity(0.4),
                        colorText: primaryColorBlackRussian,
                        hintText: 'Enter your address',
                        controller: addressController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            //allow upper and lower case alphabets, space, and number
                            return null;
                          } else if (!RegExp(r'^[a-z A-Z 0-9]+$')
                              .hasMatch(value)) {
                            return "Enter Correct Address";
                          } else if (value.length > 50) {
                            return "Address too long";
                          }
                          {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomButtonText(
                        text: 'Save',
                        bgColor: primaryColorBlackRussian,
                        onPrressed: () {
                          if (formKey.currentState!.validate()) {
                            handleEditUser();
                          }
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
