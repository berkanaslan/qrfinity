import 'package:qrfinity/src/model/storable_entity.dart';

abstract class Repository<T extends StorableEntity> {
  List<T> get();

  Future<void> add(T t);

  Future<void> addAll(List<T> tList);

  Future<void> save(T t);

  Future<void> delete(T t);
}
