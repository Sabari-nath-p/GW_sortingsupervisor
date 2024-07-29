class PlantModel {
  int? _id;
  String? _name;
  String? _storageAreaCapacity;
  List<ConveyorBelts>? _conveyorBelts;
  List<ConveyorBelts>? _plantsMachines;

  PlantModel(
      {int? id,
      String? name,
      String? storageAreaCapacity,
      List<ConveyorBelts>? conveyorBelts,
      List<ConveyorBelts>? plantsMachines}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (storageAreaCapacity != null) {
      this._storageAreaCapacity = storageAreaCapacity;
    }
    if (conveyorBelts != null) {
      this._conveyorBelts = conveyorBelts;
    }
    if (plantsMachines != null) {
      this._plantsMachines = plantsMachines;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get storageAreaCapacity => _storageAreaCapacity;
  set storageAreaCapacity(String? storageAreaCapacity) =>
      _storageAreaCapacity = storageAreaCapacity;
  List<ConveyorBelts>? get conveyorBelts => _conveyorBelts;
  set conveyorBelts(List<ConveyorBelts>? conveyorBelts) =>
      _conveyorBelts = conveyorBelts;
  List<ConveyorBelts>? get plantsMachines => _plantsMachines;
  set plantsMachines(List<ConveyorBelts>? plantsMachines) =>
      _plantsMachines = plantsMachines;

  PlantModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _storageAreaCapacity = json['storage_area_capacity'];
    if (json['conveyorBelts'] != null) {
      _conveyorBelts = <ConveyorBelts>[];
      json['conveyorBelts'].forEach((v) {
        _conveyorBelts!.add(new ConveyorBelts.fromJson(v));
      });
    }
    if (json['plantsMachines'] != null) {
      _plantsMachines = <ConveyorBelts>[];
      json['plantsMachines'].forEach((v) {
        _plantsMachines!.add(new ConveyorBelts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['storage_area_capacity'] = this._storageAreaCapacity;
    if (this._conveyorBelts != null) {
      data['conveyorBelts'] =
          this._conveyorBelts!.map((v) => v.toJson()).toList();
    }
    if (this._plantsMachines != null) {
      data['plantsMachines'] = this._plantsMachines!.map((v) => v).toList();
    }
    return data;
  }
}

class ConveyorBelts {
  int? _id;
  String? _name;
  String? _capacity;

  ConveyorBelts({int? id, String? name, String? capacity}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (capacity != null) {
      this._capacity = capacity;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get capacity => _capacity;
  set capacity(String? capacity) => _capacity = capacity;

  ConveyorBelts.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _capacity = json['capacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['capacity'] = this._capacity;
    return data;
  }
}
