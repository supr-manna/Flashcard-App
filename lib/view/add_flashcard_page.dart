import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/model/flashcard.dart';
import '../data/controller/flashcard_controller.dart';

class AddFlashcardPage extends StatelessWidget {
  final questionController = TextEditingController();
  final answerController = TextEditingController();
  final FlashcardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
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
                'Add Question',
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
                  controller.addFlashcard(Flashcard(
                    question: questionController.text,
                    answer: answerController.text,
                  ));
                  Get.back();
                } else {
                  Get.snackbar('Error', 'Fields cannot be empty');
                }
              },
              child: const Text('Add Question'),
            ),
          ],
        ),
      ),
    );
  }
}