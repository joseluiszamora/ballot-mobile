import 'package:flutter/material.dart';
import 'package:mobiletelefericovirtual/app/theme/styles.dart';

class MainAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBarWidget({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Styles().colorAppBar,
      title: Text(title,
          style: TextStyle(
              color: Styles().colorPrimary,
              fontSize: Styles().fontSizeH4,
              fontWeight: FontWeight.w600)),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
