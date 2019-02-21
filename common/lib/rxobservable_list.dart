import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';

class RxObservableList<T> extends DelegatingList<T> {

  final BehaviorSubject<List<T>> _subject = BehaviorSubject<List<T>>();

  RxObservableList([List<T> list]) : super(list ?? <T>[]);

  @override
  void add(T value) {
    super.add(value);
    _subject.add(list);
  }

  @override
  void addAll(Iterable<T> values) {
    super.addAll(values);
    _subject.add(list);
  }

  @override
  bool remove(Object value) {
    bool result = super.remove(value);
    result ? _subject.add(list) : _subject.addError('Failed to remove value');
    return result;
  }

  @override
  void clear() {
    super.clear();
    _subject.add(list);
  }
  
  ValueObservable<List<T>> get observable => _subject.stream;

  List<T> get list => toList();

  void dispose() {
    _subject.close();
  }
}