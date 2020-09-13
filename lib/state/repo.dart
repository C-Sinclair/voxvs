import 'dart:async';

abstract class Repository<T> {
  Stream<List<T>> load();

  Future<void> add(T entity);
  Future<void> update(T entity);
  Future<void> delete(T entity);
}
