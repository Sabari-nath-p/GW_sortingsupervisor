class storageSubcategoryModel {
  int? _id;
  String? _name;
  StorageCategory? _storageCategory;

  storageSubcategoryModel(
      {int? id, String? name, StorageCategory? storageCategory}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (storageCategory != null) {
      this._storageCategory = storageCategory;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  StorageCategory? get storageCategory => _storageCategory;
  set storageCategory(StorageCategory? storageCategory) =>
      _storageCategory = storageCategory;

  storageSubcategoryModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _storageCategory = json['storageCategory'] != null
        ? new StorageCategory.fromJson(json['storageCategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    if (this._storageCategory != null) {
      data['storageCategory'] = this._storageCategory!.toJson();
    }
    return data;
  }
}

class StorageCategory {
  int? _id;
  String? _storageType;
  String? _name;

  StorageCategory({int? id, String? storageType, String? name}) {
    if (id != null) {
      this._id = id;
    }
    if (storageType != null) {
      this._storageType = storageType;
    }
    if (name != null) {
      this._name = name;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get storageType => _storageType;
  set storageType(String? storageType) => _storageType = storageType;
  String? get name => _name;
  set name(String? name) => _name = name;

  StorageCategory.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _storageType = json['storage_type'];
    _name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['storage_type'] = this._storageType;
    data['name'] = this._name;
    return data;
  }
}
