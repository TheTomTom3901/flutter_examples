import 'package:rxdart/rxdart.dart';

abstract class RxObservableCollection<O extends Iterable> {
  final BehaviorSubject<O> _subject = BehaviorSubject<O>();

  O get collection;

  Observable<O> get observable => _subject.stream;

  BehaviorSubject<O> get subject => _subject;

  void notifySubject() => _subject.add(collection);

  void dispose() => _subject.close();
}