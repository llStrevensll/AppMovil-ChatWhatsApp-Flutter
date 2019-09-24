import 'package:flutter_chatwp/models/chat_model.dart';

class StatusModel {
  final String imgUrl;
  final String name;
  final String time;

  StatusModel({this.imgUrl, this.name, this.time});
}

List<StatusModel> status = [
  new StatusModel(
    name: messageData[0].name,
    time: "Hoy, 3:00AM",
    imgUrl: messageData[0].imageUrl
  ),
  new StatusModel(
    name: messageData[1].name,
    time: "Hoy, 3:00AM",
    imgUrl: messageData[1].imageUrl
  ),
  new StatusModel(
    name: messageData[2].name,
    time: "Hoy, 3:00AM",
    imgUrl: messageData[2].imageUrl
  ),
  new StatusModel(
    name: messageData[3].name,
    time: "Hoy, 3:00AM",
    imgUrl: messageData[3].imageUrl
  ),
];