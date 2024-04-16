import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerCustomWidget extends StatefulWidget {
  final bool isMobile;

  const DrawerCustomWidget({super.key, required this.isMobile});

  @override
  State<DrawerCustomWidget> createState() => _DrawerCustomWidgetState();
}

class _DrawerCustomWidgetState extends State<DrawerCustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade200,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: const Text('Dashboard'),
            onTap: () {
              Modular.to.pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(
              Icons.list,
            ),
            title: const Text('List'),
            onTap: () {
              Modular.to.pushReplacementNamed('/list');
            },
          ),
        ],
      ),
    );
  }
}
