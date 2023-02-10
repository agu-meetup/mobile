import 'package:agu_meetup_mobile/core/size_config.dart';
import 'package:agu_meetup_mobile/components/my_dropdowns/my_dropdown_widget.dart';
import 'package:agu_meetup_mobile/components/my_textfields/my_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants.dart';
import '../../../components/my_buttons/my_button_widget.dart';
import '../model_view/sign_up_model_view.dart';
import '../widget/sign_up_sign_in_button_widget.dart';
import '../widget/sign_up_texts_widget.dart';

class SignUpListComponentView extends StatefulWidget {
  const SignUpListComponentView({Key? key}) : super(key: key);

  @override
  State<SignUpListComponentView> createState() =>
      _SignUpListComponentViewState();
}

class _SignUpListComponentViewState extends State<SignUpListComponentView> {
  @override
  Widget build(BuildContext context) {
    context.read<SignUpModelView>().updateContextData(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer<SignUpModelView>(
        builder: (context, mv, child) {
          return Form(
            key: mv.formKey,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(12),
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight,
                child: Column(
                  children: [
                    Spacer(),
                    const SignUpTextsWidget(),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: MyTextFieldWidget(
                            hintText: mv.nameHintText,
                            changeValueFunc: mv.changeNameVal,
                            validatorFunc: mv.nameValidatorFunc,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: MyTextFieldWidget(
                            hintText: mv.surnameHintText,
                            changeValueFunc: mv.changeSurnameVal,
                            validatorFunc: mv.surnameValidatorFunc,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    MyTextFieldWidget(
                      hintText: mv.emailHintText,
                      changeValueFunc: mv.changeEmailVal,
                      validatorFunc: mv.emailValidatorFunc,
                      textInputType: mv.emailTextInputType,
                    ),
                    const SizedBox(height: 16),
                    MyTextFieldWidget(
                      hintText: mv.passwordHintText,
                      changeValueFunc: mv.changePasswordVal,
                      validatorFunc: mv.passwordValidatorFunc,
                      isPassword: true,
                      isSecure: mv.passwordIsEyeOpen,
                      changePasswordEye: mv.changePasswordEye,
                    ),
                    const SizedBox(height: 16),
                    MyTextFieldWidget(
                      hintText: mv.passwordAgainHintText,
                      changeValueFunc: mv.changePasswordAgainVal,
                      validatorFunc: mv.passwordAgainValidatorFunc,
                      isPassword: true,
                      isSecure: mv.passwordAgainIsEyeOpen,
                      changePasswordEye: mv.changePasswordAgainEye,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: MyTextFieldWidget(
                            hintText: mv.phoneNumHintText,
                            changeValueFunc: mv.changePhoneNumVal,
                            textInputType: mv.phoneNumInputType,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          flex: 1,
                          child: MyDropdownWidget(
                            dropdownValue: mv.genderDropdownValue,
                            elementList: mv.genderList,
                            onChangedFunc: mv.changeSelectedGender,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    MyButtonWidget(
                      buttonText: "Sign Up",
                      buttonTextColor: kWhite,
                      backgroundColor: kNavyBlue,
                      onTapFunction: mv.signUpButtonFunc,
                    ),
                    const SignUpSignInButtonWidget(),
                    Spacer(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
