import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.photo_album,
            color: Colors.blue,
          ),
          title: Text('Title 1'),
          subtitle: Text(
              'algo algo algo algo algo algo algo algo algo algo algo algo algo algo algo algo algo algo algo algo algo algo algo algo algo algo algo algo algo algo'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(onPressed: () {}, child: Text('Cancelar')),
            FlatButton(onPressed: () {}, child: Text('Ok')),
          ],
        )
      ]),
    );
  }

  Widget _cardTipo2() {
    return Card(
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'https://www.mickeyshannon.com/photos/landscape-photography.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            child: Text('Nuevo texto prueba'),
            padding: EdgeInsets.all(10.0),
          )
        ],
      ),
    );
  }
}
