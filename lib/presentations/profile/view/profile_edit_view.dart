import 'package:agu_meetup_mobile/components/my_buttons/my_button_widget.dart';
import 'package:agu_meetup_mobile/components/my_dropdowns/my_dropdown_widget.dart';
import 'package:agu_meetup_mobile/components/my_textfields/my_text_field_widget.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/core/size_config.dart';
import 'package:agu_meetup_mobile/presentations/profile/model_view/profile_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileEditView extends StatelessWidget {
  const ProfileEditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ProfileModelView>().updateEditPageBuildContext(context);
    context.read<ProfileModelView>().initializeEditPageMethods();
    return Consumer<ProfileModelView>(
      builder: (context, mv, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'Edit Profile',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Stack(
              children: [
                ListView(
                  children: [
                    SizedBox(height: 12),
                    Align(
                      child: Container(
                        width: SizeConfig.screenWidth! / 4,
                        height: SizeConfig.screenWidth! / 4,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(
                                "assets/test_image/test_profile_pic.png"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(
                            SizeConfig.screenWidth! / 4,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    MyTextFieldWidget(
                      hintText: 'Name',
                      changeValueFunc: (val) {},
                      controller: mv.nameCtr,
                    ),
                    const SizedBox(height: 12),
                    MyTextFieldWidget(
                      hintText: 'Surname',
                      changeValueFunc: (val) {},
                      controller: mv.surnameCtr,
                    ),
                    const SizedBox(height: 12),
                    MyTextFieldWidget(
                      hintText: 'Email',
                      changeValueFunc: (val) {},
                      controller: mv.emailCtr,
                      specificSuffixIcon: const Icon(
                        Icons.mail_outline,
                        color: Colors.black,
                      ),
                      isEnabled: false,
                    ),
                    const SizedBox(height: 12),
                    MyTextFieldWidget(
                      hintText: 'Phone',
                      changeValueFunc: (val) {},
                      controller: mv.phoneCtr,
                      specificSuffixIcon: const Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    MyDropdownWidget(
                      dropdownValue: mv.genderDropdown,
                      elementList: mv.gendersList,
                      onChangedFunc: mv.updateGenderDropdown,
                      hintText: 'Gender',
                    )
                  ],
                ),
                Positioned(
                  bottom: 4,
                  child: SizedBox(
                    width: SizeConfig.screenWidth! - 24,
                    child: MyButtonWidget(
                      buttonText: 'Update',
                      buttonTextColor: Colors.white,
                      backgroundColor: kBeige,
                      onTapFunction: mv.editPageUpdateButtonFunc,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
