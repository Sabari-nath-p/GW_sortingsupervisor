class UserModel {
  int? _id;
  String? _userType;
  String? _name;
  String? _phone;
  int? _age;
  String? _email;
  String? _profileImage;
  String? _address;
  String? _createdAt;
  String? _updatedAt;
  int? _createdBy;
  Mrf? _mrf;

  UserModel(
      {int? id,
      String? userType,
      String? name,
      String? phone,
      int? age,
      String? email,
      String? profileImage,
      String? address,
      String? createdAt,
      String? updatedAt,
      int? createdBy,
      Mrf? mrf}) {
    if (id != null) {
      this._id = id;
    }
    if (userType != null) {
      this._userType = userType;
    }
    if (name != null) {
      this._name = name;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (age != null) {
      this._age = age;
    }
    if (email != null) {
      this._email = email;
    }
    if (profileImage != null) {
      this._profileImage = profileImage;
    }
    if (address != null) {
      this._address = address;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (createdBy != null) {
      this._createdBy = createdBy;
    }
    if (mrf != null) {
      this._mrf = mrf;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get userType => _userType;
  set userType(String? userType) => _userType = userType;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  int? get age => _age;
  set age(int? age) => _age = age;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get profileImage => _profileImage;
  set profileImage(String? profileImage) => _profileImage = profileImage;
  String? get address => _address;
  set address(String? address) => _address = address;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get createdBy => _createdBy;
  set createdBy(int? createdBy) => _createdBy = createdBy;
  Mrf? get mrf => _mrf;
  set mrf(Mrf? mrf) => _mrf = mrf;

  UserModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userType = json['user_type'];
    _name = json['name'];
    _phone = json['phone'];
    _age = json['age'];
    _email = json['email'];
    _profileImage = json['profile_image'];
    _address = json['address'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _createdBy = json['created_by'];
    _mrf = json['mrf'] != null ? new Mrf.fromJson(json['mrf']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['user_type'] = this._userType;
    data['name'] = this._name;
    data['phone'] = this._phone;
    data['age'] = this._age;
    data['email'] = this._email;
    data['profile_image'] = this._profileImage;
    data['address'] = this._address;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['created_by'] = this._createdBy;
    if (this._mrf != null) {
      data['mrf'] = this._mrf!.toJson();
    }
    return data;
  }
}

class Mrf {
  int? _id;
  MrfInner? _mrfInner;

  Mrf({int? id, MrfInner? mrfInner}) {
    if (id != null) {
      this._id = id;
    }
    if (mrfInner != null) {
      this._mrfInner = mrfInner;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  MrfInner? get mrfInner => _mrfInner;
  set mrfInner(MrfInner? mrfInner) => _mrfInner = mrfInner;

  Mrf.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _mrfInner = json['mrf'] != null ? new MrfInner.fromJson(json['mrf']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    if (this._mrfInner != null) {
      data['mrf'] = this._mrfInner!.toJson();
    }
    return data;
  }
}

class MrfInner {
  int? _id;
  String? _name;
  String? _address;
  int? _districtId;
  int? _noOfPlants;
  String? _createdAt;
  String? _updatedAt;

  MrfInner(
      {int? id,
      String? name,
      String? address,
      int? districtId,
      int? noOfPlants,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (address != null) {
      this._address = address;
    }
    if (districtId != null) {
      this._districtId = districtId;
    }
    if (noOfPlants != null) {
      this._noOfPlants = noOfPlants;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get address => _address;
  set address(String? address) => _address = address;
  int? get districtId => _districtId;
  set districtId(int? districtId) => _districtId = districtId;
  int? get noOfPlants => _noOfPlants;
  set noOfPlants(int? noOfPlants) => _noOfPlants = noOfPlants;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  MrfInner.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _address = json['address'];
    _districtId = json['district_id'];
    _noOfPlants = json['no_of_plants'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['address'] = this._address;
    data['district_id'] = this._districtId;
    data['no_of_plants'] = this._noOfPlants;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
