import 'package:agu_meetup_mobile/presentations/profile/model_view/profile_model_view.dart';
import 'package:agu_meetup_mobile/presentations/profile/view/profile_bookmarks_view.dart';
import 'package:agu_meetup_mobile/presentations/profile/view/profile_edit_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/assets.dart';
import '../../../core/constants.dart';

class ProfileAppBarView extends StatelessWidget {
  const ProfileAppBarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileModelView>(
      builder: (context, mv, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ProfileBookmarksView(),
                    ),
                  );
                },
                child: Image(
                  image: AssetImage(saveBeige),
                ),
              ),
            ),
            const Text(
              "Profile",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            PopupMenuButton<String>(
              initialValue: '',
              // Callback that sets the selected popup menu item.
              onSelected: (String item) {
                if (item == 'logout') {
                  mv.logoutActionButtonFunc();
                } else if (item == 'edit_profile') {
                  mv.editActionButtonFunc();
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Log Out'),
                ),
                const PopupMenuItem<String>(
                  value: 'edit_profile',
                  child: Text('Edit Profile'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
