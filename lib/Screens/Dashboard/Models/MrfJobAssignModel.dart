class AssignJobModel {
  int? _id;
  int? _jobId;
  String? _vehicleNo;
  int? _createdBy;
  int? _plantId;
  int? _mrfFacilityId;
  String? _date;
  String? _shift;
  String? _type;
  String? _weight;
  String? _status;
  MrfFacility? _mrfFacility;
  MrfFacilityPlant? _mrfFacilityPlant;

  AssignJobModel(
      {int? id,
      int? jobId,
      String? vehicleNo,
      int? createdBy,
      int? plantId,
      int? mrfFacilityId,
      String? date,
      String? shift,
      String? type,
      String? weight,
      String? status,
      MrfFacility? mrfFacility,
      MrfFacilityPlant? mrfFacilityPlant}) {
    if (id != null) {
      this._id = id;
    }
    if (jobId != null) {
      this._jobId = jobId;
    }
    if (vehicleNo != null) {
      this._vehicleNo = vehicleNo;
    }
    if (createdBy != null) {
      this._createdBy = createdBy;
    }
    if (plantId != null) {
      this._plantId = plantId;
    }
    if (mrfFacilityId != null) {
      this._mrfFacilityId = mrfFacilityId;
    }
    if (date != null) {
      this._date = date;
    }
    if (shift != null) {
      this._shift = shift;
    }
    if (type != null) {
      this._type = type;
    }
    if (weight != null) {
      this._weight = weight;
    }
    if (status != null) {
      this._status = status;
    }
    if (mrfFacility != null) {
      this._mrfFacility = mrfFacility;
    }
    if (mrfFacilityPlant != null) {
      this._mrfFacilityPlant = mrfFacilityPlant;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get jobId => _jobId;
  set jobId(int? jobId) => _jobId = jobId;
  String? get vehicleNo => _vehicleNo;
  set vehicleNo(String? vehicleNo) => _vehicleNo = vehicleNo;
  int? get createdBy => _createdBy;
  set createdBy(int? createdBy) => _createdBy = createdBy;
  int? get plantId => _plantId;
  set plantId(int? plantId) => _plantId = plantId;
  int? get mrfFacilityId => _mrfFacilityId;
  set mrfFacilityId(int? mrfFacilityId) => _mrfFacilityId = mrfFacilityId;
  String? get date => _date;
  set date(String? date) => _date = date;
  String? get shift => _shift;
  set shift(String? shift) => _shift = shift;
  String? get type => _type;
  set type(String? type) => _type = type;
  String? get weight => _weight;
  set weight(String? weight) => _weight = weight;
  String? get status => _status;
  set status(String? status) => _status = status;
  MrfFacility? get mrfFacility => _mrfFacility;
  set mrfFacility(MrfFacility? mrfFacility) => _mrfFacility = mrfFacility;
  MrfFacilityPlant? get mrfFacilityPlant => _mrfFacilityPlant;
  set mrfFacilityPlant(MrfFacilityPlant? mrfFacilityPlant) =>
      _mrfFacilityPlant = mrfFacilityPlant;

  AssignJobModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _jobId = json['job_id'];
    _vehicleNo = json['vehicle_no'];
    _createdBy = json['created_by'];
    _plantId = json['plant_id'];
    _mrfFacilityId = json['mrf_facility_id'];
    _date = json['date'];
    _shift = json['shift'];
    _type = json['type'];
    _weight = json['weight'];
    _status = json['status'];
    _mrfFacility = json['mrfFacility'] != null
        ? new MrfFacility.fromJson(json['mrfFacility'])
        : null;
    _mrfFacilityPlant = json['mrfFacilityPlant'] != null
        ? new MrfFacilityPlant.fromJson(json['mrfFacilityPlant'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['job_id'] = this._jobId;
    data['vehicle_no'] = this._vehicleNo;
    data['created_by'] = this._createdBy;
    data['plant_id'] = this._plantId;
    data['mrf_facility_id'] = this._mrfFacilityId;
    data['date'] = this._date;
    data['shift'] = this._shift;
    data['type'] = this._type;
    data['weight'] = this._weight;
    data['status'] = this._status;
    if (this._mrfFacility != null) {
      data['mrfFacility'] = this._mrfFacility!.toJson();
    }
    if (this._mrfFacilityPlant != null) {
      data['mrfFacilityPlant'] = this._mrfFacilityPlant!.toJson();
    }
    return data;
  }
}

class MrfFacility {
  int? _id;
  String? _name;
  String? _address;
  int? _districtId;
  int? _noOfPlants;
  String? _createdAt;
  String? _updatedAt;

  MrfFacility(
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

  MrfFacility.fromJson(Map<String, dynamic> json) {
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

class MrfFacilityPlant {
  int? _id;
  String? _name;
  int? _mrfFacilityId;
  String? _storageAreaCapacity;
  String? _createdAt;
  String? _updatedAt;

  MrfFacilityPlant(
      {int? id,
      String? name,
      int? mrfFacilityId,
      String? storageAreaCapacity,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (mrfFacilityId != null) {
      this._mrfFacilityId = mrfFacilityId;
    }
    if (storageAreaCapacity != null) {
      this._storageAreaCapacity = storageAreaCapacity;
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
  int? get mrfFacilityId => _mrfFacilityId;
  set mrfFacilityId(int? mrfFacilityId) => _mrfFacilityId = mrfFacilityId;
  String? get storageAreaCapacity => _storageAreaCapacity;
  set storageAreaCapacity(String? storageAreaCapacity) =>
      _storageAreaCapacity = storageAreaCapacity;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  MrfFacilityPlant.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _mrfFacilityId = json['mrf_facility_id'];
    _storageAreaCapacity = json['storage_area_capacity'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['mrf_facility_id'] = this._mrfFacilityId;
    data['storage_area_capacity'] = this._storageAreaCapacity;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}
