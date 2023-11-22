import 'package:flutter_riverpod_todo_app/data/notifications/subject.dart';

abstract class Observer
{
  late Subject subject;
  Future<void> notify(String text);
}