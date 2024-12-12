import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import '../model/flashcard.dart';
import '../../view/flashcard_adapter.dart';

class FlashcardController extends GetxController {
  final flashcards = <Flashcard>[].obs;
  //final box = Hive.box<Flashcard>('flashcards');
  late Box<Flashcard> box;


  Future<void> initializeHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(FlashcardAdapter());
    box = await Hive.openBox<Flashcard>('flashcards');
    flashcards.addAll(box.values);
  }

  void addFlashcard(Flashcard flashcard) {
    box.add(flashcard);
    flashcards.add(flashcard);
  }

  void editFlashcard(int index, Flashcard updatedFlashcard) {
    box.putAt(index, updatedFlashcard);
    flashcards[index] = updatedFlashcard;
  }

  void deleteFlashcard(int index) {
    box.deleteAt(index);
    flashcards.removeAt(index);
  }
}