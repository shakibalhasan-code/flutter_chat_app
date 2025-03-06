import 'package:chat_app_mobile/views/screens/chat/chat_list_screen.dart';
import 'package:chat_app_mobile/views/screens/chat/chat_screen.dart';
import 'package:chat_app_mobile/views/screens/user_auth/user_signin_screen.dart';
import 'package:get/get.dart';

class AppRoutes extends GetxController {
  static String signIn = '/signIn';
  static String chatList = '/chatList';
  static String chatScreen = '/chatScreen';

  static List<GetPage> pages = [
    GetPage(name: signIn, page: () => UserSigninScreen()),
    GetPage(name: chatList, page: () => ChatListScreen()),
    GetPage(name: chatScreen, page: () => ChatScreen()),
  ];
}
