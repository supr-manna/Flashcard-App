import 'package:get/get.dart';
import '../controller/flashcard_controller.dart';

Future<void> init() async {
  Get.lazyPut<FlashcardController>(() => FlashcardController());
}
