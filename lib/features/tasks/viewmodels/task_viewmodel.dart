import 'package:flutter/foundation.dart';
import '../models/task_model.dart';
import '../../../core/utils/shared_prefs.dart';

class TaskViewModel extends ChangeNotifier {
  final List<Task> _tasks = [];
  final SharedPrefs _sharedPrefs = SharedPrefs();
  bool _isLoading = false;

  List<Task> get tasks => _tasks;
  bool get isLoading => _isLoading;

  TaskViewModel() {
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    _isLoading = true;
    notifyListeners();

    _tasks.clear();
    _tasks.addAll(_sharedPrefs.getTasks());

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addTask(String title, String description) async {
    final task = Task(
      id: DateTime.now().toString(),
      title: title,
      description: description,
    );

    _tasks.add(task);
    await _sharedPrefs.saveTasks(_tasks);
    notifyListeners();
  }

  Future<void> toggleTaskCompletion(String taskId) async {
    final taskIndex = _tasks.indexWhere((task) => task.id == taskId);
    if (taskIndex != -1) {
      _tasks[taskIndex].isCompleted = !_tasks[taskIndex].isCompleted;
      await _sharedPrefs.saveTasks(_tasks);
      notifyListeners();
    }
  }

  Future<void> deleteTask(String taskId) async {
    _tasks.removeWhere((task) => task.id == taskId);
    await _sharedPrefs.saveTasks(_tasks);
    notifyListeners();
  }
}
