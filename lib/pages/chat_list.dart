import 'package:flutter/material.dart';
import 'package:flutter_chatwp/models/chat_model.dart';
import 'package:flutter_chatwp/pages/chat_screen.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => new _ChatListState();
 }
class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
   return new ListView.builder(
     itemCount: messageData.length,//cantidad de registros que se usaran en el widget - messagedata viene de chat_model
     itemBuilder: (context, i) => new Column(
       children: <Widget>[
         new Divider(//divisor
           height: 10.0,
         ),
         new ListTile(//informacion del usuario
            leading: new CircleAvatar(
              radius: 26.0,
              backgroundImage: NetworkImage(messageData[i].imageUrl),
            ),
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,//name - time, espacio entre los dos
              children: <Widget>[//informacion del contacto
                new Text(
                  messageData[i].name,
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
                new Text(
                  messageData[i].time,
                  style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                )
              ],
            ),
            subtitle: new Container(//para el mensaje
              padding: const EdgeInsets.only(top: 5.0),//pading al top
              child: new Text(
                messageData[i].message,
                style: new TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),
            onTap: (){//recibe callback
              var route = new MaterialPageRoute(
                builder: (BuildContext context) => new ChatScreen(name: messageData[i].name)//pagina a utilizar -chatScreen(nombre)
              );
              Navigator.of(context).push(route);//moverse a la ruta especificada
            },
         )
       ],
     ),
   );
  }
}