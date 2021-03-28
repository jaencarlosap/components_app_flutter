import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _password = '';
  String _date = '';
  String _opcionSelecionada = 'Volar';

  List<String> _poderes = ['Volar', 'Rayos X', 'Super fuerza'];

  TextEditingController _inputDate = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearDate(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _imprimirPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de persona',
        labelText: 'Nombre',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
        });
      },
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
      onChanged: (value) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _crearDate(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputDate,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Date',
        labelText: 'Date',
        suffixIcon: Icon(Icons.date_range),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES'),
    );

    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputDate.text = _date;
      });
    }
  }

  Widget _crearDropdown() {
    return Row(
      children: [
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            isExpanded: true,
            items: getOpcionesDropdown(),
            onChanged: (value) {
              setState(() {
                _opcionSelecionada = value;
              });
            },
            value: _opcionSelecionada,
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((value) {
      lista.add(
        DropdownMenuItem(
          value: value,
          child: Text(value),
        ),
      );
    });

    return lista;
  }

  Widget _imprimirPersona() {
    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text('Poder: $_opcionSelecionada'),
    );
  }
}
