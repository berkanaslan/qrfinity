import 'package:get_it/get_it.dart';
import 'package:qrfinity/src/database/hive_database.dart';
import 'package:qrfinity/src/repository/barcode_repository.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => HiveDatabase());

  locator.registerLazySingleton(() => BarcodeRepository());
}
