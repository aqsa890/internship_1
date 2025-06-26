import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/app_constants.dart';
import '../../features/tasks/models/task_model.dart';

class SharedPrefs {
  static final SharedPrefs _instance = SharedPrefs._internal();
  static SharedPreferences? _prefs;

  factory SharedPrefs() {
    return _instance;
  }

  SharedPrefs._internal();

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Auth related methods
  Future<void> setLoggedIn(bool value) async {
    await _prefs?.setBool(AppConstants.isLoggedInKey, value);
  }

  bool isLoggedIn() {
    return _prefs?.getBool(AppConstants.isLoggedInKey) ?? false;
  }

  Future<void> setUserEmail(String email) async {
    await _prefs?.setString(AppConstants.userEmailKey, email);
  }

  String? getUserEmail() {
    return _prefs?.getString(AppConstants.userEmailKey);
  }

  // Task related methods
  Future<void> saveTasks(List<Task> tasks) async {
    final String encodedData = json.encode(
      tasks.map((task) => task.toJson()).toList(),
    );
    await _prefs?.setString(AppConstants.taskListKey, encodedData);
  }

  List<Task> getTasks() {
    final String? tasksString = _prefs?.getString(AppConstants.taskListKey);
    if (tasksString == null) return [];

    final List<dynamic> decodedData = json.decode(tasksString);
    return decodedData.map((item) => Task.fromJson(item)).toList();
  }

  Future<void> clear() async {
    await _prefs?.clear();
  }
}
