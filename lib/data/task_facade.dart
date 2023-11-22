import 'package:flutter/material.dart';
import '../providers/providers.dart';
import '../screens/screens.dart';
import 'data.dart';
import 'notifications/email_notification.dart';
import 'notifications/local_notification.dart';

class TaskFacade {
  final TaskRepository _repository;
  LocalNotification? _notificationLocal;
  EmailNotification? _notificationMail;
  TaskFacade(this._repository);

  Future<void> createTask(Task task) async {
    try {
      _notificationLocal = LocalNotification(task);
      _notificationMail = EmailNotification(task);
      await _repository.addTask(task.getTask());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await _repository.deleteTask(task);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      final isCompleted = !task.isCompleted;
      final updatedTask = task.copyWith(isCompleted: isCompleted);
      await _repository.updateTask(updatedTask);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getTasks(TaskNotifier taskNotifier) async {
    try {
      final tasks = await _repository.getAllTasks();
      taskNotifier.updateTasks(tasks);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}