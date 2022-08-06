abstract class Database {
  Future<void> init();

  Future<void> register();

  Future<void> open();
}
