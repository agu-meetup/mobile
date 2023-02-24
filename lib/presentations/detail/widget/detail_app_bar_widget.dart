import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/assets.dart';

class DetailAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const DetailAppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, mv, child) {
      return AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Event Detail',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Image(
              image: AssetImage(saveBlack),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Image(
              image: AssetImage(shareBlack),
            ),
          ),
        ],
      );
    });
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}