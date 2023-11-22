import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/data/data.dart';
import 'package:flutter_riverpod_todo_app/providers/providers.dart';
import '../../data/task_facade.dart';

final taskFacadeProvider = Provider<TaskFacade>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskFacade(repository);
});

final tasksProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final facade = ref.watch(taskFacadeProvider);
  return TaskNotifier(facade);
});

