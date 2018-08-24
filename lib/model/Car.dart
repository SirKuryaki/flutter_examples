const String TABLE_CAR = 'cars';

const String QUERY_CREATE_TABLE_CAR = "CREATE TABLE $TABLE_CAR "
    "(id INTEGER PRIMARY KEY AUTOINCREMENT,"
    " brand TEXT,"
    " model TEXT,"
    " odometer INTEGER,"
    " fuel_type TEXT,"
    " measure_unit TEXT)";

class Car {
  int id;
  String brand;
  String model;
  int initialOdometer;
  String fuelType;
  String measureUnit;

  Car();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'brand': brand,
      'model': model,
      'odometer': initialOdometer,
      'fuel_type': fuelType,
      'measure_unit': measureUnit
    };

    if (id != null) {
      map['id'] = id;
    }

    return map;
  }
}
