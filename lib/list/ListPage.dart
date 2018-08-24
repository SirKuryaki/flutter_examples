import 'package:flutter/material.dart';
import '../model/Car.dart';
import '../repos/CarRepository.dart';

const String LIST_PAGE_ROUTE = '/list';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  final CarRepository _repository = CarRepository.instance;

  List<Car> _myCars;

  @override
  void initState() {
    super.initState();
    _loadCars();
  }

  _loadCars() async {
    final List<Car> cars = await _repository.getAllCars();
    setState(() {
      _myCars = cars;
    });
  }

  List<Text> _getMyCarList() {
    if (_myCars == null) {
      return List(0);
    }

    List<Text> result = List();
    _myCars.forEach((car) {
      result.add(Text('${car.brand} ${car.model}'));
    });

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Mis vehículos'),
    ),
    body: ListView(
    children: _getMyCarList())
    );
  }
}