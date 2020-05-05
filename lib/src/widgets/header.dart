import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  final void Function() onRefresh;

  Header(this.onRefresh);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Coin Converter'),
      centerTitle: true,
      backgroundColor: Colors.lightBlue,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: this.onRefresh
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
