import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:mobile_app/ui/models/vehicles.dart';
import 'package:mobile_app/ui/pages/Vehicles/widgets/build_panel.dart';
import 'package:mobile_app/ui/repository/firebase_repository.dart';

import './widgets/build_drawer.dart';

class VehiclesPage extends StatefulWidget {
  @override
  _VehiclesPageState createState() => _VehiclesPageState();
}

class _VehiclesPageState extends State<VehiclesPage> {
  GetIt getIt;
  List<Vehicles> _listAllVehicles;

  @override
  void initState() {
    getIt = GetIt.I;
    _listAllVehicles = getIt.get<FireBaseRepository>().listAllVehicles;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Veiculos'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: BuildPanel(
            listAllVehicles: _listAllVehicles,
          ),
        ),
      ),
      drawer: BuildDrawer(),
    );
  }
}
