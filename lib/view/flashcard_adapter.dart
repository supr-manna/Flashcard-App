import 'package:hive/hive.dart';
import '../data/model/flashcard.dart';

class FlashcardAdapter extends TypeAdapter<Flashcard> {
  @override
  final typeId = 0;

  @override
  Flashcard read(BinaryReader reader) {
    return Flashcard(
      question: reader.readString(),
      answer: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Flashcard obj) {
    writer.writeString(obj.question);
    writer.writeString(obj.answer);
  }
}
