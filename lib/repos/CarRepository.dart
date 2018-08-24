import 'package:sqflite/sqflite.dart';
import 'dart:async';
import '../model/Car.dart';

class CarRepository {
  static final CarRepository instance = CarRepository();

  Future<Database> _getDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + 'test_db.db';
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute('''$QUERY_CREATE_TABLE_CAR''');
    }, singleInstance: true);

    return database;
  }

  Future<Car> insert(Car car) async {
    var db = await _getDatabase();
    car.id = await db.insert(TABLE_CAR, car.toMap());
    print(car.id);
    return car;
  }

}
