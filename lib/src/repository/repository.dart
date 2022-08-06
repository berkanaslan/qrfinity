import 'package:hive/hive.dart';
import 'package:qrfinity/src/model/storable_entity.dart';

abstract class Repository<T extends StorableEntity> {
  Box<T> getBox();

  List<T> getAll();

  Future<void> add(T t);

  Future<void> addAll(List<T> tList);

  Future<void> save(T t);

  Future<void> delete(T t);
}
