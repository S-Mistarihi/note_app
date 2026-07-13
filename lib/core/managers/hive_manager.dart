import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  HiveManager._();

  static final HiveManager instance = HiveManager._();

  /// Initialize Hive
  Future<void> init() async {
    await Hive.initFlutter();
  }

  /// Register Adapter
  void registerAdapter<T>(TypeAdapter<T> adapter) {
    if (!Hive.isAdapterRegistered(adapter.typeId)) {
      Hive.registerAdapter(adapter);
    }
  }

  /// Open Box
  Future<Box<T>> openBox<T>(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<T>(boxName);
    }

    return Hive.box<T>(boxName);
  }

  /// Get Box
  Box<T> box<T>(String boxName) {
    return Hive.box<T>(boxName);
  }

  /// Check if Box is Open
  bool isBoxOpen(String boxName) {
    return Hive.isBoxOpen(boxName);
  }

  /// Add Value
  Future<int> add<T>({
    required String boxName,
    required T value,
  }) async {
    return await box<T>(boxName).add(value);
  }

  /// Put (Create or Update by Key)
  Future<void> put<T>({
    required String boxName,
    required dynamic key,
    required T value,
  }) async {
    await box<T>(boxName).put(key, value);
  }

  /// Update by Index
  Future<void> putAt<T>({
    required String boxName,
    required int index,
    required T value,
  }) async {
    await box<T>(boxName).putAt(index, value);
  }

  /// Get by Key
  T? get<T>({
    required String boxName,
    required dynamic key,
  }) {
    return box<T>(boxName).get(key);
  }

  /// Get by Index
  T? getAt<T>({
    required String boxName,
    required int index,
  }) {
    return box<T>(boxName).getAt(index);
  }

  /// Get All Values
  List<T> getAll<T>(String boxName) {
    return box<T>(boxName).values.toList();
  }

  /// Delete by Key
  Future<void> delete({
    required String boxName,
    required dynamic key,
  }) async {
    await box(boxName).delete(key);
  }

  /// Delete by Index
  Future<void> deleteAt({
    required String boxName,
    required int index,
  }) async {
    await box(boxName).deleteAt(index);
  }

  /// Check Key Exists
  bool containsKey({
    required String boxName,
    required dynamic key,
  }) {
    return box(boxName).containsKey(key);
  }

  /// Number of Items
  int length(String boxName) {
    return box(boxName).length;
  }

  /// All Keys
  Iterable<dynamic> keys(String boxName) {
    return box(boxName).keys;
  }

  /// All Values
  List<T> values<T>(String boxName) {
    return box<T>(boxName).values.toList();
  }

  /// Clear Box
  Future<void> clear(String boxName) async {
    await box(boxName).clear();
  }

  /// Compact Box
  Future<void> compact(String boxName) async {
    await box(boxName).compact();
  }

  /// Close Box
  Future<void> closeBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      await box(boxName).close();
    }
  }

  /// Close All Boxes
  Future<void> closeAll() async {
    await Hive.close();
  }

  /// Delete Box From Disk
  Future<void> deleteBoxFromDisk(String boxName) async {
    await Hive.deleteBoxFromDisk(boxName);
  }
}