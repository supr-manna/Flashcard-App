import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/controller/flashcard_controller.dart';
import '../data/route_helper.dart';
import 'add_flashcard_page.dart';
import 'edit_flashcard_page.dart';

class FlashcardApp extends StatelessWidget {
  final FlashcardController controller = Get.put(FlashcardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.blue,
          elevation: 4,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          centerTitle: true,
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Questions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      body: Obx(() => PageView.builder(
        controller: PageController(viewportFraction: 0.8),
        itemCount: controller.flashcards.length,
        itemBuilder: (context, index) {
          final flashcard = controller.flashcards[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlipCard(
                  front: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    height: 500,
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            flashcard.question,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Text(
                            "${index + 1}/${controller.flashcards.length}",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  back: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(2, 4),
                        ),
                      ],
                    ),
                    height: 500,
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            flashcard.answer,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Text(
                            "${index + 1}/${controller.flashcards.length}",
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => Get.to(EditFlashcardPage(
                        index: index,
                        flashcard: flashcard,
                      )),
                      icon: const Icon(Icons.edit, color: Colors.white,),
                      label: const Text('Edit', style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Get.defaultDialog(
                          title: 'Delete Flashcard',
                          titleStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                          middleText:
                          'Are you sure you want to delete this flashcard?',
                          middleTextStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                          cancel: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[200],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () => Get.back(),
                            child: const Text('Cancel',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          confirm: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              controller.deleteFlashcard(index);
                              Get.back();
                            },
                            child: const Text('Delete',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.delete, color: Colors.white,),
                      label:  Text('Delete', style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(AddFlashcardPage()),
        child: const Icon(Icons.add),
      ),
    );
  }
}