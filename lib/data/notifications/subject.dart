import 'observer.dart';

mixin class Subject
{
  final List<Observer> observers = [];

  void attachObserver(Observer observer)
  {
    print("dcf");
    observers.add(observer);
  }

  void detachObserver(Observer observer)
  {
    observers.remove(observer);
  }

  void notifyObservers(String text)
  {
    for (var observer in observers) {
      observer.notify(text);
    }
  }
}