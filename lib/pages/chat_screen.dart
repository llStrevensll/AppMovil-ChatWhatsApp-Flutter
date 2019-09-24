import 'package:flutter/material.dart';
import 'package:flutter_chatwp/models/chat_model.dart';

class ChatScreen extends StatefulWidget {
  ///Variables
  final String name;
  ///Constructor
  ChatScreen({this.name});

  @override
  _ChatScreenState createState() => new _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin{
  ///Variables
  final List<ChatMessage> _messages = <ChatMessage>[];//Lista de mensajes
    bool _isTyped = false;//esta escrito
  //controlador
  final TextEditingController _textController = new TextEditingController();

  ///Metodos
  void _handledSubmit(String text){//envio del mensaje

    _textController.clear();//limpiar el texto
    setState(() {
     _isTyped = false;//dejar nuevamente en falso (variable: esta escrito) 
    });

    ChatMessage message = ChatMessage(
      text: text,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 700),
        vsync: this
      ),
      name: widget.name,
    );

    setState(() {
      _messages.insert(0, message);//insertar en lista de mensajes

      //Actualizar ultimo mensaje enviado
      var data = messageData.firstWhere((t) => t.name == widget.name);//filtrar primer contenido -> nombre
      data.message = message.text;
    });

    message.animationController.forward();//correr animacion
    print(text);
  }

  Widget _buildTextComposer(){//chat - campo de digitacion
    return new IconTheme(//usar en los iconos el tema definido para el aplicativo
      data: new IconThemeData(color: Theme.of(context).accentColor),//color del tema
      child: new Container(
        child: new Row(
          children: <Widget>[
            new Flexible(//colocar contenidos - textfield
              child: new TextField(
              controller: _textController,
              onChanged: (String text){
                setState(() {
                  _isTyped = text.length > 0; //si es mayor a 0 es true
                });
              },
              decoration: new InputDecoration.collapsed(hintText: "Enviar mensaje"),//placeholder en el campo de digitacion(textfield)
              )
            ),
            new Container(
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: _isTyped ? //condicion esta escrito? -> sino retorna null
                () => _handledSubmit(_textController.text) : null,//enviar mensaje
                ),
            )
          ],
        ),
      ),
    );
    
  }

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
     title: new Text(widget.name),
    ),
    body: new Container(
      child: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),//padding
              reverse: true,//mensajes de abajo hacia arriba
              itemBuilder: (_, int index) => _messages[index],//informacion a tomar
              itemCount: _messages.length,
            ),
          ),
          new Divider(height: 4.0, thickness: 2.0),
          new Container(
            child: _buildTextComposer(),
          )
        ],
      ),
    ),
   );
   
  }
}

//MensajeChat
class ChatMessage extends StatelessWidget {
  ///Variables
  final String text;
  final AnimationController animationController;
  final String name;

  ///Constructor
  ChatMessage({this.text, this.animationController, this.name});

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(//tipo de animacion
        parent: animationController,//permite saber la velocidad de la animacion
        curve: Curves.easeOut// inicia rapido y termina lento
      ),
    child: new Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
             margin: const EdgeInsets.only(right: 16.0),
            child: new CircleAvatar(child: new Text(name[0])),
          ),
          new Expanded(//expandirse para ocupar el espacio disponible
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(name, style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text),
                )
              ],
            ),
          )
        ],
      ),
    ),
    );
  }
}