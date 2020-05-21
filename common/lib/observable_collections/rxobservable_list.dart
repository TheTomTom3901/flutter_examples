import 'package:collection/collection.dart';
import 'package:common/observable_collections/rxobservable_collection.dart';

class RxObservableList<O> extends DelegatingList<O> with RxObservableCollection<List<O>> {
  RxObservableList([List<O> base]) : super(base ?? <O>[]);
  
  @override
  List<O> get collection => List.from(this, growable: true);
  
  void addIf(bool condition, O value) {
    if(condition) add(value);
  }
  
  void removeIf(bool condition, O value) {
    if(condition) remove(value);
  }
  
  void addAllIf(bool condition, Iterable<O> elements) {
    if(condition) addAll(elements);
  }
  
  void addNonNull(O value) {
    addIf(value != null, value);
  }
  
  void addIfAbsent(O value) {
    addIf(!contains(value), value);
  }
  
  @override
  void add(O value) {
    super.add(value);
    notifySubject();
  }
  
  @override
  void addAll(Iterable<O> elements) {
    super.addAll(elements);
    notifySubject();
  }

  @override
  void insert(int index, O element) {
    super.insert(index, element);
    notifySubject();
  }
  
  @override
  void insertAll(int index, Iterable<O> iterable) {
    super.insertAll(index, iterable);
    notifySubject();
  }

  @override
  void setAll(int index, Iterable<O> iterable) {
    super.setAll(index, iterable);
    notifySubject();
  }

  @override
  bool remove(Object value) {
    bool result = super.remove(value);
    if(result) notifySubject();
    return result;
  }
  
  @override
  void sort([int Function(O a, O b) compare]) {
    super.sort(compare);
    notifySubject();
  }
  
  @override
  void clear() {
    super.clear();
    notifySubject();
  }
}
