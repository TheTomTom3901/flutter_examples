import 'package:collection/collection.dart';
import 'package:common/observable_collections/rxobservable_collection.dart';

class RxObservableSet<O> extends DelegatingSet<O> with RxObservableCollection<Set<O>> {
  RxObservableSet([Set<O> base]) : super(base ?? <O>[]);
  
  @override
  Set<O> get collection => Set.from(this);
  
  bool addIf(bool condition, O value) {
    if(!condition) return false;
    bool result = add(value);
    if(result) notifySubject();
    return result;
  }
  
  void addAllIf(bool condition, Iterable<O> elements) {
    if(condition) addAll(elements);
  }
  
  bool addNonNull(O value) {
    return addIf(value != null, value);
  }
  
  @override
  bool add(O value) {
    bool result = super.add(value);
    if(result) notifySubject();
    return result;
  }
  
  @override
  void addAll(Iterable<O> elements) {
    super.addAll(elements);
    notifySubject();
  }
  
  @override
  bool remove(Object value) {
    bool result = super.remove(value);
    if(result) notifySubject();
    return result;
  }
  
  @override
  void clear() {
    super.clear();
    notifySubject();
  }
}