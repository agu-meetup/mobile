import 'package:agu_meetup_mobile/components/my_buttons/my_text_button_widget.dart';
import 'package:agu_meetup_mobile/components/my_textfields/my_text_field_widget.dart';
import 'package:agu_meetup_mobile/core/constants.dart';
import 'package:agu_meetup_mobile/presentations/detail/model_view/detail_model_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/detail_comment_widget.dart';

class DetailCommentView extends StatelessWidget {
  const DetailCommentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailModelView>(
      builder: (context, mv, child) {
        return Column(
          children: [
            SizedBox(height: 12),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Comments',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ),
            mv.showedComment < mv.comments.length
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        mv.changeShowedComment();
                      },
                      child: Text(
                        'See all ${mv.comments.length} comments',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  )
                : Container(),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              itemCount: mv.showedComment < mv.comments.length
                  ? mv.showedComment
                  : mv.comments.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return DetailCommentWidget(
                  userPhoto: mv.comments[index].userPhoto,
                  nameSurname: mv.comments[index].nameSurname,
                  commentDetail: mv.comments[index].commentDetail,
                );
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: MyTextFieldWidget(
                    hintText: "Write your comment here...",
                    changeValueFunc: (val) {},
                    isThereShadow: false,
                    controller: mv.commentController,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    mv.sendComment();
                  },
                  child: Container(
                    width: 62,
                    height: 62,
                    margin: EdgeInsets.only(left: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: kOrange,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
