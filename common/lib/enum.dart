abstract class Enum<T> {
  final T _name;

  const Enum(this._name);

  T get name => _name;
}