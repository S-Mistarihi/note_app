import 'package:note_app/core/enum/sort_type.dart';
import 'package:note_app/models/note_model.dart';

class NoteSorter {
  NoteSorter._();

  static List<NoteModel> sort(
      List<NoteModel> notes,
      SortType sortType,
      ) {
    switch (sortType) {
      case SortType.newest:
        notes.sort(
              (a, b) => b.createdAt.compareTo(a.createdAt),
        );
        break;

      case SortType.oldest:
        notes.sort(
              (a, b) => a.createdAt.compareTo(b.createdAt),
        );
        break;

      case SortType.alphabeticalAZ:
        notes.sort(
              (a, b) => a.title
              .toLowerCase()
              .compareTo(
            b.title.toLowerCase(),
          ),
        );
        break;

      case SortType.alphabeticalZA:
        notes.sort(
              (a, b) => b.title
              .toLowerCase()
              .compareTo(
            a.title.toLowerCase(),
          ),
        );
        break;
    }

    return notes;
  }
}