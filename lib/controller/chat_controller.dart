import 'package:get/get.dart';

class ChatController extends GetxController {
  List<Map<String, dynamic>> messages = [
    {'message': 'Hey brother, how are you?', 'isSender': true},
    {'message': 'I’m good! How about you?', 'isSender': false},
    {'message': 'Doing great, just working on a project.', 'isSender': true},
    {'message': 'That’s awesome! What are you building?', 'isSender': false},
    {'message': 'A new chat app with Flutter and Node.js!', 'isSender': true},
    {'message': 'Sounds interesting! Need any help?', 'isSender': false},
    {'message': 'Yeah, could use some feedback on the UI.', 'isSender': true},
    {'message': 'Sure, send me some screenshots!', 'isSender': false},
    {'message': 'Alright, give me a moment.', 'isSender': true},
    {'message': 'No rush, take your time.', 'isSender': false},
  ];
}
