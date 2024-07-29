class conveyorBeltModel {
  int? _id;
  String? _name;
  String? _capacity;

  conveyorBeltModel({int? id, String? name, String? capacity}) {
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

  conveyorBeltModel.fromJson(Map<String, dynamic> json) {
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
