import 'package:get/get.dart';
import '../view/add_flashcard_page.dart';
import '../view/flashcard_app.dart';
import '../view/splash_screen.dart';

class RouteHelper {
  static const String splashScreen = '/';
  static const String flashcardScreen = '/flashcardScreen';
  static const String addFlashcardPage = '/addFlashcardPage';

  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: flashcardScreen,
      page: () => FlashcardApp(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 300),
    ),
    GetPage(
      name: addFlashcardPage,
      page: () => AddFlashcardPage(),
      transition: Transition.fadeIn,
      transitionDuration: Duration(milliseconds: 300),
    ),
  ];
}
