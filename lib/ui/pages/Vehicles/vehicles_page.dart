import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_app/routes/app_routes.dart';
import 'package:mobile_app/services/store.dart';
import 'package:mobile_app/ui/models/vehicles.dart';
import 'package:mobile_app/ui/repository/vehicles_repository.dart';

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
    _listAllVehicles = getIt.get<VehiclesRepository>().listAllVehicles;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SecondPage'),
      ),
      body: ListView.builder(
          itemCount: _listAllVehicles.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: Text(_listAllVehicles[index].id.toString()));
          }),
      drawer: _buildDrawer(context),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Menu'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sair'),
            onTap: () {
              Store.remove('Token');
              Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN_HOME);
            },
          ),
        ],
      ),
    );
  }
}
