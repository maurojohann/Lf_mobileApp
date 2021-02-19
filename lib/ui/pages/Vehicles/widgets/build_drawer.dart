import 'package:flutter/material.dart';

import '../../../../routes/app_routes.dart';
import '../../../../services/store.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Menu'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sair'),
            onTap: () {
              Store.remove('Token');
              Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN_HOME);
            },
          ),
        ],
      ),
    );
  }
}
