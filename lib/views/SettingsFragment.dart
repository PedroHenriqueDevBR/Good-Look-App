import 'package:flutter/material.dart';
import 'package:good_look_app/views/ListDemandActivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ListClientActivity.dart';
import 'ListServiceActivity.dart';
import 'ListEmployeeActivity.dart';
import 'ListDemandActivity.dart';

class SettingsFragment extends StatefulWidget {
  @override
  _SettingsFragmentState createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  @override
  Widget build(BuildContext context) {
    List<ConfigurationItem> data = <ConfigurationItem>[
      ConfigurationItem('Serviços', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ListServiceActivity()));
      }, Icons.shopping_basket),
      ConfigurationItem('Clientes', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ListClientActivity()));
      }, Icons.people_outline),
      ConfigurationItem('Pedidos', () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ListDemandActivity()));
      }, Icons.poll),
      ConfigurationItem('Encerrar sessão', () async {
        final prefs = await SharedPreferences.getInstance();
        prefs.remove('userId');
        Navigator.pop(context);
      }, Icons.exit_to_app),
    ];

    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(data[index].icon),
          title: Text(data[index].title),
          onTap: data[index].action,
        );
      },
    );
  }
}

class ConfigurationItem {
  String title;
  Function action;
  IconData icon;

  ConfigurationItem(title, action, icon) {
    this.title = title;
    this.action = action;
    this.icon = icon;
  }
}
