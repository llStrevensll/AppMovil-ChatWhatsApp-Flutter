class ChatModel{
  ///Variables
  final String name;
  String message;
  final String time;
  final String imageUrl;

  ///Inicializar en el constructor
  ChatModel({this.name, this.message, this.time, this.imageUrl});
}

///List del chat (local)
List<ChatModel> messageData = [ 
    new ChatModel(
      name: "Andy Goralczyk",
      message: "Hola como estas?",
      time: "15:30",
      imageUrl: "http://www.col40.co/638/articles-102973_perfil.png"
    ),
    new ChatModel(
      name: "Apthon Corbin",
      message: "Nos vemos",
      time: "15:30",
      imageUrl: "http://www.col40.co/638/articles-102968_perfil.png"
    ),
    new ChatModel(
      name: "Danu Navarro",
      message: "Si",
      time: "17:30",
      imageUrl: "http://www.col40.co/638/articles-103995_perfil.png"
    ),
    new ChatModel(
      name: "Humberto Rosa",
      message: "Fine",
      time: "7:00",
      imageUrl: "http://www.col40.co/638/articles-103460_perfil.png"
    ),
    new ChatModel(
      name: "Ignacio Ochoa",
      message: "Fine",
      time: "10:30",
      imageUrl: "http://www.col40.co/638/articles-102975_perfil.png"
    ),
    new ChatModel(
      name: "Mic Graves",
      message: "Fine",
      time: "15:30",
      imageUrl: "http://www.col40.co/638/articles-102970_perfil.png"
    ),
    new ChatModel(
      name: "Rachelle Lambden",
      message: "How are you?",
      time: "12:30",
      imageUrl: "http://col40.co/638/articles-102999_perfil.png"
    ),
    new ChatModel(
      name: "Tati Leite",
      message: "Bye",
      time: "18:00",
      imageUrl: "http://col40.co/638/articles-103774_perfil.png"
    ),
];