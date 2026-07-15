import 'package:shared_preferences/shared_preferences.dart';

import '../enum/sort_type.dart';

class SortManager {
  SortManager._();

  static final SortManager instance = SortManager._();

  static const String _sortKey = 'sort_type';

  late SharedPreferences _prefs;

  SortType _sortType = SortType.newest;

  SortType get sortType => _sortType;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    final value = _prefs.getString(_sortKey);
    if (value != null) {
      _sortType = SortType.values.firstWhere(
        (element) => element.name == value,
        orElse: () => SortType.newest,
      );
    }
  }

  Future<void> changeSort(SortType value) async {
    _sortType = value;
    await _prefs.setString(_sortKey, value.name);
  }
}
