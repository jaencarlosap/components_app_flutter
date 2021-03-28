import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:componentes/src/pages/homa_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_pages.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/input_page.dart';
// import 'package:componentes/src/pages/home_temp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      //home: HomePage(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => HomePage(),
        'alert': (BuildContext context) => AlertPage(),
        'avatar': (BuildContext context) => AvatarPage(),
        'card': (BuildContext context) => CardPage(),
        'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
        'inputs': (BuildContext context) => InputPage(),
      },
      supportedLocales: [
        const Locale('en', 'US'), // English, no country code
        const Locale('es', 'ES'), // English, no country code
      ],
    );
  }
}
