import 'package:flutter/material.dart';

import '../../../models/vehicles.dart';
import '../../map/map_page.dart';

class BuildPanel extends StatefulWidget {
  final List<Vehicles> listAllVehicles;

  const BuildPanel({this.listAllVehicles});

  @override
  _BuildPanelState createState() => _BuildPanelState();
}

class _BuildPanelState extends State<BuildPanel> {
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          widget.listAllVehicles[index].isExpanded = !isExpanded;
        });
      },
      children: widget.listAllVehicles.map<ExpansionPanel>(
        (Vehicles e) {
          return ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return ListTile(
                    leading: CircleAvatar(child: Icon(Icons.directions_car)),
                    title: Text(e.name.toString()),
                    subtitle: Text(e.licensePlate.toString()));
              },
              body: ListTile(
                title: Text('Localização Atual:'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(e.lastPosition.address),
                    TextButton.icon(
                      icon: Icon(Icons.pin_drop),
                      label: Text('Ver no Mapa'),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => MapPage(
                                e.lastPosition.lat, e.lastPosition.lng)));
                      },
                    ),
                  ],
                ),
              ),
              isExpanded: e.isExpanded);
        },
      ).toList(),
    );
  }
}
