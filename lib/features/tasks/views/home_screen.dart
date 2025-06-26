import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_constants.dart';
import '../viewmodels/task_viewmodel.dart';
import '../models/task_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // TODO: Implement logout
              Navigator.pushReplacementNamed(context, AppConstants.loginRoute);
            },
          ),
        ],
      ),
      body: Consumer<TaskViewModel>(
        builder: (context, taskVM, _) {
          if (taskVM.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (taskVM.tasks.isEmpty) {
            return const Center(child: Text('No tasks yet'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: taskVM.tasks.length,
            itemBuilder: (context, index) {
              final task = taskVM.tasks[index];
              return _TaskCard(task: task);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppConstants.addTaskRoute);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _TaskCard extends StatelessWidget {
  final Task task;

  const _TaskCard({required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(task.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                task.isCompleted
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
              ),
              onPressed: () {
                context.read<TaskViewModel>().toggleTaskCompletion(task.id);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                context.read<TaskViewModel>().deleteTask(task.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
