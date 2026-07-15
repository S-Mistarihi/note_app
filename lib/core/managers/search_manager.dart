import 'package:note_app/models/note_model.dart';

class SearchManager {
  SearchManager._();

  static final SearchManager instance = SearchManager._();

  List<NoteModel> search({
    required List<NoteModel> notes,
    required String query,
  }) {
    if (query.trim().isEmpty) {
      return notes;
    }

    final text = query.trim().toLowerCase();

    return notes.where((note) {
      return note.title.toLowerCase().contains(text);
    }).toList();
  }
}