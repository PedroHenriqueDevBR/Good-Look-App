import 'package:flutter/material.dart';
import 'package:good_look_app/controllers/ServiceController.dart';
import 'package:good_look_app/models/Service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateServiceActivity extends StatefulWidget {
  ServiceController controller = new ServiceController();
  int serviceId = null;

  CreateServiceActivity({this.serviceId});

  getLoggedUser() async {
    final prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('userId');
    return id;
  }

  getService() async {
    var response = await controller.getService(serviceId);
    return response;
  }

  createService(Service service) async {
    int userId = await getLoggedUser();
    var response = await controller.newService(service, userId);
    return response;
  }

  @override
  _CreateServiceActivityState createState() => _CreateServiceActivityState();
}

class _CreateServiceActivityState extends State<CreateServiceActivity> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  TextEditingController _txtName = TextEditingController();
  TextEditingController _txtDescription = TextEditingController();
  TextEditingController _txtPrice = TextEditingController();
  TextEditingController _txtCostService = TextEditingController();

  String _txtNameError = '';
  String _txtPriceError = '';
  String _txtDescriptionError = '';
  String _txtCostServiceError = '';

  showMessage(String msg) {
    _globalKey.currentState.showSnackBar(SnackBar(content: Text(msg)));
  }

  clearFields() {
    setState(() {
      _txtName.text = '';
      _txtDescription.text = '';
      _txtPrice.text = '';
      _txtCostService.text = '';
    });
  }

  createService() async {
    bool response = verifyForm();
    if (response) {
      Service service = new Service();
      service.name = _txtName.text;
      service.description = _txtDescription.text;
      service.price = double.parse(_txtPrice.text);
      service.total_cost = double.parse(_txtCostService.text);

      if (widget.serviceId != null) {
        var response =
            await widget.controller.updateService(service, widget.serviceId);
        if (response > 0) {
          Navigator.pop(context, true);
        } else {
          showMessage(
              'ocorreu umm erro, contate o desenvolvedor do aplicativo.');
        }
      } else {
        var response = await widget.createService(service);
        if (response > 0) {
          showMessage('Serviço cadastrado');
          clearFields();
        } else {
          showMessage(
              'ocorreu umm erro, contate o desenvolvedor do aplicativo.');
        }
      }
    }
  }

  bool verifyForm() {
    String nameError = '';
    String priceError = '';
    String descriptionError = '';
    String costError = '';
    bool formValid = true;

    if (_txtName.text.isEmpty) {
      nameError = 'Preencha o campo nome';
      formValid = false;
    } else {
      nameError = '';
    }

    if (_txtPrice.text.isEmpty) {
      priceError = 'Preencha o campo preço';
      formValid = false;
    } else {
      priceError = '';
    }

    if (_txtDescription.text.isEmpty) {
      descriptionError = 'Preencha o campo descrição';
      formValid = false;
    } else {
      descriptionError = '';
    }

    if (_txtCostService.text.isEmpty) {
      costError = 'Preencha o campo Custos';
      formValid = false;
    } else {
      costError = '';
    }

    if (!formValid) {
      setState(() {
        _txtNameError = nameError;
        _txtPriceError = priceError;
        _txtCostServiceError = costError;
        _txtDescriptionError = descriptionError;
      });
      return false;
    } else {
      return true;
    }
  }

  getService() async {
    await widget.getService().then((service) {
      setState(() {
        _txtName.text = service[0]['name'];
        _txtDescription.text = service[0]['description'];
        _txtPrice.text = service[0]['price'].toString();
        _txtCostService.text = service[0]['total_cost'].toString();
      });
    });
  }

  @override
  void initState() {
    if (widget.serviceId != null) {
      getService();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: header(),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text(
            'Cadastrar novo Serviço',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          Text('Preencha todos os campo com o asterisco (*)'),
          SizedBox(
            height: 15,
          ),
          form(),
          SizedBox(height: 16),
          Text(
            'Para salvar as alteraçoes clique no botao localizado no '
            'canto superior direito',
            style: TextStyle(
              color: Colors.deepPurpleAccent,
            ),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Column(
      children: <Widget>[
        _textFieldDefault(
            'Nome (*)', 'Nome', _txtName, _txtNameError, TextInputType.text),
        SizedBox(height: 15),
        _textFieldDefault('Custos (*)', 'Custos para executar o serviço',
            _txtCostService, _txtCostServiceError, TextInputType.number),
        SizedBox(height: 15),
        _textFieldDefault('Preco (*)', 'Valor cobrado', _txtPrice,
            _txtPriceError, TextInputType.number),
        SizedBox(height: 15),
        _textFieldDefault('Descriçao (*)', 'Descriçao do servico',
            _txtDescription, _txtDescriptionError, TextInputType.multiline),
      ],
    );
  }

  AppBar header() {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text('Cadastrar serviço'),
      backgroundColor: Colors.black,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.save_alt,
            color: Colors.white,
          ),
          onPressed: createService,
        ),
      ],
    );
  }

  TextField _textFieldDefault(
      String label,
      String hint,
      TextEditingController controller,
      String error,
      TextInputType keyboardType) {
    if (error.isEmpty) {
      error = null;
    }

    return TextField(
      keyboardType: keyboardType,
      autocorrect: true,
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          errorText: error,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          )),
    );
  }
}
