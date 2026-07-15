import 'package:shared_preferences/shared_preferences.dart';

import '../enum/sort_type.dart';

class SortManager {
  SortManager._();

  static final SortManager instance = SortManager._();

  static const String _sortKey = 'sort_type';

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveSort(SortType sortType) async {
    await _prefs.setInt(
      _sortKey,
      sortType.index,
    );
  }

  SortType getSort() {
    final index = _prefs.getInt(_sortKey);

    if (index == null) {
      return SortType.newest;
    }

    return SortType.values[index];
  }
}