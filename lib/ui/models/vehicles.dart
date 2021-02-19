import 'dart:convert';

class Vehicles {
  int id;
  Null model;
  String name;
  String licensePlate;
  String type;
  LastPosition lastPosition;
  bool isExpanded = false;

  Vehicles(
      {this.id,
      this.model,
      this.name,
      this.licensePlate,
      this.type,
      this.lastPosition});

  Vehicles.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    model = json['model'];
    name = json['name'];
    licensePlate = json['license_plate'];
    type = json['type'];
    lastPosition = json['last_position'] != null
        ? new LastPosition.fromJson(json['last_position'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['model'] = this.model;
    data['name'] = this.name;
    data['license_plate'] = this.licensePlate;
    data['type'] = this.type;
    if (this.lastPosition != null) {
      data['last_position'] = this.lastPosition.toJson();
    }
    return data;
  }
}

class LastPosition {
  double lat;
  double lng;
  bool ignitionIsOn;
  String receivedCreateTimestamp;
  String positionCreateTimestamp;
  String receivedUpdateTimestamp;
  String positionUpdateTimestamp;
  String address;
  int speed;

  LastPosition(
      {this.lat,
      this.lng,
      this.ignitionIsOn,
      this.receivedCreateTimestamp,
      this.positionCreateTimestamp,
      this.receivedUpdateTimestamp,
      this.positionUpdateTimestamp,
      this.address,
      this.speed});

  LastPosition.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
    ignitionIsOn = json['ignition_is_on'];
    receivedCreateTimestamp = json['received_create_timestamp'];
    positionCreateTimestamp = json['position_create_timestamp'];
    receivedUpdateTimestamp = json['received_update_timestamp'];
    positionUpdateTimestamp = json['position_update_timestamp'];
    address = json['address'];
    speed = json['speed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['ignition_is_on'] = this.ignitionIsOn;
    data['received_create_timestamp'] = this.receivedCreateTimestamp;
    data['position_create_timestamp'] = this.positionCreateTimestamp;
    data['received_update_timestamp'] = this.receivedUpdateTimestamp;
    data['position_update_timestamp'] = this.positionUpdateTimestamp;
    data['address'] = this.address;
    data['speed'] = this.speed;
    return data;
  }
}
