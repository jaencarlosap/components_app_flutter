import 'dart:ffi';

import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _crearChecbox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      inactiveColor: Colors.indigoAccent[50],
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      onChanged: _checkbox
          ? null
          : (value) {
              setState(() {
                _sliderValue = value;
              });
            },
    );
  }

  Widget _crearChecbox() {
    return CheckboxListTile(
        title: Text('Bloquear slider'),
        value: _checkbox,
        onChanged: (value) {
          setState(() {
            _checkbox = value;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear slider'),
        value: _checkbox,
        onChanged: (value) {
          setState(() {
            _checkbox = value;
          });
        });
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://pngimg.com/uploads/groot/groot_PNG36.png'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }
}
