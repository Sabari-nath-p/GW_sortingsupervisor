class SortingDataModel {
  int? id;
  int? conveyorBeltId;
  int? storageSubCategoryId;
  int? mrfPlantStorageId;
  String? quantity;
  String? shift;
  StorageSubCategory? storageSubCategory;
  MrfPlantStorage? mrfPlantStorage;

  SortingDataModel(
      {this.id,
      this.conveyorBeltId,
      this.storageSubCategoryId,
      this.mrfPlantStorageId,
      this.quantity,
      this.shift,
      this.storageSubCategory,
      this.mrfPlantStorage});

  SortingDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    conveyorBeltId = json['conveyor_belt_id'];
    storageSubCategoryId = json['storage_sub_category_id'];
    mrfPlantStorageId = json['mrf_plant_storage_id'];
    quantity = json['quantity'];
    shift = json['shift'];
    storageSubCategory = json['storageSubCategory'] != null
        ? new StorageSubCategory.fromJson(json['storageSubCategory'])
        : null;
    mrfPlantStorage = json['mrfPlantStorage'] != null
        ? new MrfPlantStorage.fromJson(json['mrfPlantStorage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['conveyor_belt_id'] = this.conveyorBeltId;
    data['storage_sub_category_id'] = this.storageSubCategoryId;
    data['mrf_plant_storage_id'] = this.mrfPlantStorageId;
    data['quantity'] = this.quantity;
    data['shift'] = this.shift;
    if (this.storageSubCategory != null) {
      data['storageSubCategory'] = this.storageSubCategory!.toJson();
    }
    if (this.mrfPlantStorage != null) {
      data['mrfPlantStorage'] = this.mrfPlantStorage!.toJson();
    }
    return data;
  }
}

class StorageSubCategory {
  int? id;
  String? name;
  int? storageCategoryId;

  StorageSubCategory({this.id, this.name, this.storageCategoryId});

  StorageSubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    storageCategoryId = json['storage_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['storage_category_id'] = this.storageCategoryId;
    return data;
  }
}

class MrfPlantStorage {
  int? id;
  int? plantId;
  int? storageSubCategoryId;
  String? quantity;
  Plant? plant;

  MrfPlantStorage(
      {this.id,
      this.plantId,
      this.storageSubCategoryId,
      this.quantity,
      this.plant});

  MrfPlantStorage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plantId = json['plant_id'];
    storageSubCategoryId = json['storage_sub_category_id'];
    quantity = json['quantity'];
    plant = json['plant'] != null ? new Plant.fromJson(json['plant']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plant_id'] = this.plantId;
    data['storage_sub_category_id'] = this.storageSubCategoryId;
    data['quantity'] = this.quantity;
    if (this.plant != null) {
      data['plant'] = this.plant!.toJson();
    }
    return data;
  }
}

class Plant {
  int? id;
  String? name;
  int? mrfFacilityId;
  String? storageAreaCapacity;

  Plant({this.id, this.name, this.mrfFacilityId, this.storageAreaCapacity});

  Plant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mrfFacilityId = json['mrf_facility_id'];
    storageAreaCapacity = json['storage_area_capacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mrf_facility_id'] = this.mrfFacilityId;
    data['storage_area_capacity'] = this.storageAreaCapacity;
    return data;
  }
}
