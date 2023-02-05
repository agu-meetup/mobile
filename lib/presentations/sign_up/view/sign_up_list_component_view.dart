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
    SignUpModelView signUpMV = context.read<SignUpModelView>();
    signUpMV.updateContextData(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Form(
        key: signUpMV.formKey,
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
                        hintText: signUpMV.nameHintText,
                        changeValueFunc: signUpMV.changeNameVal,
                        validatorFunc: signUpMV.nameValidatorFunc,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: MyTextFieldWidget(
                        hintText: signUpMV.surnameHintText,
                        changeValueFunc: signUpMV.changeSurnameVal,
                        validatorFunc: signUpMV.surnameValidatorFunc,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                MyTextFieldWidget(
                  hintText: signUpMV.emailHintText,
                  changeValueFunc: signUpMV.changeEmailVal,
                  validatorFunc: signUpMV.emailValidatorFunc,
                  textInputType: signUpMV.emailTextInputType,
                ),
                const SizedBox(height: 16),
                StreamBuilder(
                  stream: signUpMV.isEyeOpenStream1(),
                  builder: (context, snapshot) {
                    return MyTextFieldWidget(
                      hintText: signUpMV.passwordHintText,
                      changeValueFunc: signUpMV.changePasswordVal,
                      validatorFunc: signUpMV.passwordValidatorFunc,
                      isPassword: true,
                      isSecure: snapshot.data ?? true,
                      changePasswordEye: signUpMV.changePasswordEye1,
                    );
                  },
                ),
                const SizedBox(height: 16),
                StreamBuilder(
                  stream: signUpMV.isEyeOpenStream2(),
                  builder: (context, snapshot) {
                    return MyTextFieldWidget(
                      hintText: signUpMV.passwordAgainHintText,
                      changeValueFunc: signUpMV.changePasswordAgainVal,
                      validatorFunc: signUpMV.passwordAgainValidatorFunc,
                      isPassword: true,
                      isSecure: snapshot.data ?? true,
                      changePasswordEye: signUpMV.changePasswordEye2,
                    );
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: MyTextFieldWidget(
                        hintText: signUpMV.phoneNumHintText,
                        changeValueFunc: signUpMV.changePhoneNumVal,
                        textInputType: signUpMV.phoneNumInputType,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: StreamBuilder<String?>(
                          stream: signUpMV.genderDropdownStream(),
                          builder: (context, snapshot) {
                            return MyDropdownWidget(
                              dropdownValue: snapshot.data,
                              elementList: signUpMV.genderList,
                              onChangedFunc: signUpMV.changeSelectedGender,
                            );
                          }),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                MyButtonWidget(
                  buttonText: "Sign Up",
                  buttonTextColor: kWhite,
                  backgroundColor: kNavyBlue,
                  onTapFunction: signUpMV.signUpButtonFunc,
                ),
                const SignUpSignInButtonWidget(),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
