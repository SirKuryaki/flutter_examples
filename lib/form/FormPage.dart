import 'package:flutter/material.dart';
import '../model/Car.dart';
import '../repos/CarRepository.dart';

const String FORM_PAGE_ROUTE = '/form';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _showErrors = false;
  Car _car = Car();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ingresar nuevo vehículo'),
      ),
      body: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            autovalidate: true,
            key: this._formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Requerido';
                    }
                  },
                  onSaved: (String value) {
                    this._car.brand = value;
                  },
                  decoration:
                      InputDecoration(hintText: 'Hyundai', labelText: 'Marca'),
                  style: TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: 'Roboto'),
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Requerido';
                    }
                  },
                  onSaved: (String value) {
                    this._car.model = value;
                  },
                  decoration: InputDecoration(
                      hintText: 'Genesis coupe', labelText: 'Modelo'),
                  style: TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: 'Roboto'),
                ),
                TextFormField(
                  validator: (value) {
                    var odometer = int.tryParse(value);
                    if (!(odometer is int)) {
                      return 'Valor inválido';
                    }
                  },
                  initialValue: '0',
                  onSaved: (String value) {
                    this._car.initialOdometer = int.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Kilometraje'),
                  style: TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: 'Roboto'),
                ),
                InputDecorator(
                  decoration: InputDecoration(
                      labelText: 'Tipo de combustible',
                      errorText: _showErrors && _car.fuelType == null
                          ? 'Requerido'
                          : null),
                  isEmpty: _car.fuelType == null,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      onChanged: (String value) {
                        setState(() {
                          _car.fuelType = value;
                        });
                      },
                      value: _car.fuelType,
                      isDense: true,
                      style: TextStyle(
                          fontSize: 12.0,
                          color: const Color(0xFF202020),
                          fontWeight: FontWeight.w200,
                          fontFamily: 'Roboto'),
                      items: <DropdownMenuItem<String>>[
                        const DropdownMenuItem<String>(
                            value: 'Gasoline', child: const Text('Nafta')),
                        const DropdownMenuItem<String>(
                            value: 'Diesel', child: const Text('Diesel')),
                        const DropdownMenuItem<String>(
                            value: 'Hybrid', child: const Text('Híbrido')),
                        const DropdownMenuItem<String>(
                            value: 'CNG', child: const Text('GNC')),
                      ],
                    ),
                  ),
                ),
                InputDecorator(
                  decoration: InputDecoration(
                      labelText: 'Millas/Kilometros',
                      errorText: _showErrors && _car.measureUnit == null
                          ? 'Requerido'
                          : null),
                  isEmpty: _car.measureUnit == null,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      onChanged: (String value) {
                        setState(() {
                          _car.measureUnit = value;
                        });
                      },
                      value: _car.measureUnit,
                      isDense: true,
                      style: TextStyle(
                          fontSize: 12.0,
                          color: const Color(0xFF202020),
                          fontWeight: FontWeight.w200,
                          fontFamily: 'Roboto'),
                      items: <DropdownMenuItem<String>>[
                        const DropdownMenuItem<String>(
                            value: 'Miles', child: const Text('Millas')),
                        const DropdownMenuItem<String>(
                            value: 'Kilometers',
                            child: const Text('Kilometros')),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: screenSize.width,
                  child: RaisedButton(
                    child: Text(
                      'Enviar',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => this._addNewCar(),
                    color: Colors.redAccent,
                  ),
                  margin: EdgeInsets.only(top: 20.0),
                )
                // We will add fields here.
              ],
            ),
          )),
    );
  }

  void _addNewCar() {
    if (_formKey.currentState.validate() &&
        _car.measureUnit != null &&
        _car.fuelType != null) {
      _formKey.currentState.save();
      CarRepository.instance.insert(_car);
      Navigator.of(context).pop();
    } else {
      setState(() {
        _showErrors = true;
      });
    }
  }
}
