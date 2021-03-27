import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar'),
        actions: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://pbs.twimg.com/profile_images/1001210776940634113/SyYv1SXr_400x400.jpg'),
              radius: 30.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('JC'),
              backgroundColor: Colors.purple,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          fadeInDuration: Duration(milliseconds: 200),
          placeholder: AssetImage('assets/jar-loading.gif'),
          image: NetworkImage(
              'https://hips.hearstapps.com/es.h-cdn.co/fotoes/images/noticias-cine/edad-groot-james-gunn/136186123-1-esl-ES/Que-edad-tendra-Groot-en-Infinity-War-James-Gunn-nos-lo-explica.jpg?crop=1xw:0.7757575757575758xh;center,top&resize=480:*'),
        ),
      ),
    );
  }
}
