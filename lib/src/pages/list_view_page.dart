import 'package:flutter/material.dart';

import 'dart:async';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _agregarElements();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregarElements();
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(child: CircularProgressIndicator()),
          SizedBox(height: 15.0),
        ],
      );
    }

    return Container();
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final image = _listaNumeros[index];

          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300?image=$image'));
        },
      ),
    );
  }

  void _agregarElements() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  Future<Null> _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    _agregarElements();

    final duration = new Duration(seconds: 2);

    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    setState(() {
      _isLoading = false;
    });

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
  }

  Future<Null> _onRefresh() async {
    final duration = new Duration(seconds: 2);

    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregarElements();
    });

    return Future.delayed(duration);
  }
}
