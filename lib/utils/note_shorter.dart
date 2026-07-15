import '../../core/enum/sort_type.dart';
import '../../models/note_model.dart';

class NoteSorter {
  static List<NoteModel> sort(List<NoteModel> notes, SortType type) {
    switch (type) {
      case SortType.newest:
        return notes..sort((a, b) => b.createdAt.compareTo(a.createdAt));

      case SortType.oldest:
        return notes..sort((a, b) => a.createdAt.compareTo(b.createdAt));

      case SortType.alphabeticalAZ:
        return notes..sort(
          (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()),
        );

      case SortType.alphabeticalZA:
        return notes..sort(
          (a, b) => b.title.toLowerCase().compareTo(a.title.toLowerCase()),
        );
    }
  }
}
