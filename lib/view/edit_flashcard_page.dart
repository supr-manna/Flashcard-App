import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/model/flashcard.dart';
import '../data/controller/flashcard_controller.dart';

class EditFlashcardPage extends StatelessWidget {
  final int index;
  final Flashcard flashcard;

  EditFlashcardPage({required this.index, required this.flashcard});

  final questionController = TextEditingController();
  final answerController = TextEditingController();

  final FlashcardController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    questionController.text = flashcard.question;
    answerController.text = flashcard.answer;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.blue,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          centerTitle: true,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Edit Question',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: questionController,
              decoration: const InputDecoration(labelText: 'Question'),
            ),
            TextField(
              controller: answerController,
              decoration: const InputDecoration(labelText: 'Answer'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (questionController.text.isNotEmpty &&
                    answerController.text.isNotEmpty) {
                  controller.editFlashcard(
                    index,
                    Flashcard(
                      question: questionController.text,
                      answer: answerController.text,
                    ),
                  );
                  Get.back();
                } else {
                  Get.snackbar('Error', 'Fields cannot be empty');
                }
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
