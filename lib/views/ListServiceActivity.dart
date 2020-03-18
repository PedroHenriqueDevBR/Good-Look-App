import 'package:flutter/material.dart';
import 'package:good_look_app/controllers/ServiceController.dart';
import 'package:good_look_app/views/CreateServiceActivity.dart';
import 'package:good_look_app/views/ShowServiceActivity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListServiceActivity extends StatefulWidget {
  ServiceController controller = new ServiceController();

  getLoggedUser() async {
    final prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('userId');
    return id;
  }

  getAllServices() async {
    int userId = await getLoggedUser();
    var response = await controller.getAllServices(userId);
    return response;
  }

  @override
  _ListServiceActivityState createState() => _ListServiceActivityState();
}

class _ListServiceActivityState extends State<ListServiceActivity> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  var services = [];

  showMessage(String msg) {
    _globalKey.currentState.showSnackBar(SnackBar(
      content: Text(msg),
      duration: Duration(milliseconds: 1250),
    ));
  }

  removeService(int index) {
    services.remove(index);
    widget.controller.deleteService(services[index]['id']);
    showMessage('Serviço deletado');
  }

  updateService(index) async {
    int serviceId = services[index]['id'];
    services.remove(index);
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                CreateServiceActivity(serviceId: serviceId))).then((response) {
      getServices();
    });
  }

  getServices() async {
    await widget.getAllServices().then((response) {
      setState(() {
        services = response;
      });
    });
  }

  @override
  void initState() {
    getServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: header(),
      body: body(),
      floatingActionButton: fab(),
    );
  }

  Widget body() {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: services.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            background: Container(
              padding: EdgeInsets.all(16),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            secondaryBackground: Container(
              padding: EdgeInsets.all(16),
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Icon(
                    Icons.delete_outline,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            child: ListTile(
              leading: Icon(
                Icons.local_atm,
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
              title: Text(services[index]['name']),
              subtitle: Text(services[index]['price'].toString()),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowServiceActivity()));
              },
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                updateService(index);
              } else if (direction == DismissDirection.endToStart) {
                removeService(index);
              }
            },
          );
        });
  }

  AppBar header() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text('Serviços'),
      backgroundColor: Colors.black,
    );
  }

  Widget fab() {
    return FloatingActionButton.extended(
      label: Text('Cadastrar'),
      icon: Icon(Icons.add),
      onPressed: () async {
        await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CreateServiceActivity()))
            .then((response) {
          getServices();
        });
      },
    );
  }
}
