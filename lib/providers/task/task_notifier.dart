import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/data/data.dart';
import 'package:flutter_riverpod_todo_app/providers/providers.dart';
import '../../data/task_facade.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  final TaskFacade _facade;

  TaskNotifier(this._facade) : super(const TaskState.initial()) {
    getTasks();
  }

  Future<void> createTask(Task task) async {
    await _facade.createTask(task);
    getTasks();
  }

  Future<void> deleteTask(Task task) async {
    await _facade.deleteTask(task);
    getTasks();
  }

  Future<void> updateTask(Task task) async {
    await _facade.updateTask(task);
    getTasks();
  }

  void getTasks() async {
    await _facade.getTasks(this);
  }

  void updateTasks(List<Task> tasks) {
    state = state.copyWith(tasks: tasks);
  }
}
