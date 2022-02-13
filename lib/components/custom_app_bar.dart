import 'package:flutter/material.dart';
import 'package:online_banking_app_ui/utils/color_constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorConstants.transparent,
      leading: Padding(
        padding: const EdgeInsets.all(0.0),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/icons/avatar.png'),
        ),
      ),
      bottom: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.grey[500],
        tabs: <Widget>[
          Tab(
            child: Text('Transactions', style: Theme.of(context).textTheme.headline2),
          ),
          Tab(
            child: Text('Cards', style: Theme.of(context).textTheme.headline2),
          ),
        ],
      ),
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
