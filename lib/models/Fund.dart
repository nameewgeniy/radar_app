// To parse this JSON data, do
//
//     final fund = fundFromMap(jsonString);

import 'dart:convert';

Fund fundFromMap(String str) => Fund.fromMap(json.decode(str));

String fundToMap(Fund data) => json.encode(data.toMap());

class Fund {
  Fund({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.fundId,
    this.auditorId,
    this.fundsObjectNameRus,
    this.dateOfEndPlacing,
    this.dateOfStartPlacing,
    this.kodMicex,
    this.fundsCompId,
    this.fundsCompNameRus,
    this.mmvbPlacement,
    this.moreEng,
    this.moreRus,
    this.nameEng,
    this.nameRus,
    this.qualifiedOnly,
    this.recorderId,
    this.registrationDate,
    this.regNumber,
    this.repositoryId,
    this.rtsPlacement,
    this.specializationId,
    this.specializationNameEng,
    this.specializationNameRus,
    this.fundsStatusesId,
    this.fundsTypesRus,
    this.updatingDate,
    this.fundsCategoriesId,
    this.fundsCategoriesTitleRus,
    this.feeUk,
    this.isinCode,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  String fundId;
  String auditorId;
  String fundsObjectNameRus;
  DateTime dateOfEndPlacing;
  DateTime dateOfStartPlacing;
  String kodMicex;
  String fundsCompId;
  String fundsCompNameRus;
  String mmvbPlacement;
  String moreEng;
  String moreRus;
  String nameEng;
  String nameRus;
  String qualifiedOnly;
  String recorderId;
  DateTime registrationDate;
  String regNumber;
  String repositoryId;
  String rtsPlacement;
  String specializationId;
  String specializationNameEng;
  String specializationNameRus;
  String fundsStatusesId;
  String fundsTypesRus;
  DateTime updatingDate;
  String fundsCategoriesId;
  String fundsCategoriesTitleRus;
  String feeUk;
  String isinCode;

  factory Fund.fromMap(Map<String, dynamic> json) => Fund(
    id: json["ID"] == null ? null : json["ID"],
    createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
    updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
    deletedAt: json["DeletedAt"],
    fundId: json["id"] == null ? null : json["id"],
    auditorId: json["auditor_id"] == null ? null : json["auditor_id"],
    fundsObjectNameRus: json["funds_object_name_rus"] == null ? null : json["funds_object_name_rus"],
    dateOfEndPlacing: json["date_of_end_placing"] == null ? null : DateTime.parse(json["date_of_end_placing"]),
    dateOfStartPlacing: json["date_of_start_placing"] == null ? null : DateTime.parse(json["date_of_start_placing"]),
    kodMicex: json["kod_micex"] == null ? null : json["kod_micex"],
    fundsCompId: json["funds_comp_id"] == null ? null : json["funds_comp_id"],
    fundsCompNameRus: json["funds_comp_name_rus"] == null ? null : json["funds_comp_name_rus"],
    mmvbPlacement: json["mmvb_placement"] == null ? null : json["mmvb_placement"],
    moreEng: json["more_eng"] == null ? null : json["more_eng"],
    moreRus: json["more_rus"] == null ? null : json["more_rus"],
    nameEng: json["name_eng"] == null ? null : json["name_eng"],
    nameRus: json["name_rus"] == null ? null : json["name_rus"],
    qualifiedOnly: json["qualified_only"] == null ? null : json["qualified_only"],
    recorderId: json["recorder_id"] == null ? null : json["recorder_id"],
    registrationDate: json["registration_date"] == null ? null : DateTime.parse(json["registration_date"]),
    regNumber: json["reg_number"] == null ? null : json["reg_number"],
    repositoryId: json["repository_id"] == null ? null : json["repository_id"],
    rtsPlacement: json["rts_placement"] == null ? null : json["rts_placement"],
    specializationId: json["specialization_id"] == null ? null : json["specialization_id"],
    specializationNameEng: json["specialization_name_eng"] == null ? null : json["specialization_name_eng"],
    specializationNameRus: json["specialization_name_rus"] == null ? null : json["specialization_name_rus"],
    fundsStatusesId: json["funds_statuses_id"] == null ? null : json["funds_statuses_id"],
    fundsTypesRus: json["funds_types_rus"] == null ? null : json["funds_types_rus"],
    updatingDate: json["updating_date"] == null ? null : DateTime.parse(json["updating_date"]),
    fundsCategoriesId: json["funds_categories_id"] == null ? null : json["funds_categories_id"],
    fundsCategoriesTitleRus: json["funds_categories_title_rus"] == null ? null : json["funds_categories_title_rus"],
    feeUk: json["fee_uk"] == null ? null : json["fee_uk"],
    isinCode: json["isin_code"] == null ? null : json["isin_code"],
  );

  Map<String, dynamic> toMap() => {
    "ID": id == null ? null : id,
    "CreatedAt": createdAt == null ? null : createdAt.toIso8601String(),
    "UpdatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "DeletedAt": deletedAt,
    "id": fundId == null ? null : fundId,
    "auditor_id": auditorId == null ? null : auditorId,
    "funds_object_name_rus": fundsObjectNameRus == null ? null : fundsObjectNameRus,
    "date_of_end_placing": dateOfEndPlacing == null ? null : "${dateOfEndPlacing.year.toString().padLeft(4, '0')}-${dateOfEndPlacing.month.toString().padLeft(2, '0')}-${dateOfEndPlacing.day.toString().padLeft(2, '0')}",
    "date_of_start_placing": dateOfStartPlacing == null ? null : "${dateOfStartPlacing.year.toString().padLeft(4, '0')}-${dateOfStartPlacing.month.toString().padLeft(2, '0')}-${dateOfStartPlacing.day.toString().padLeft(2, '0')}",
    "kod_micex": kodMicex == null ? null : kodMicex,
    "funds_comp_id": fundsCompId == null ? null : fundsCompId,
    "funds_comp_name_rus": fundsCompNameRus == null ? null : fundsCompNameRus,
    "mmvb_placement": mmvbPlacement == null ? null : mmvbPlacement,
    "more_eng": moreEng == null ? null : moreEng,
    "more_rus": moreRus == null ? null : moreRus,
    "name_eng": nameEng == null ? null : nameEng,
    "name_rus": nameRus == null ? null : nameRus,
    "qualified_only": qualifiedOnly == null ? null : qualifiedOnly,
    "recorder_id": recorderId == null ? null : recorderId,
    "registration_date": registrationDate == null ? null : "${registrationDate.year.toString().padLeft(4, '0')}-${registrationDate.month.toString().padLeft(2, '0')}-${registrationDate.day.toString().padLeft(2, '0')}",
    "reg_number": regNumber == null ? null : regNumber,
    "repository_id": repositoryId == null ? null : repositoryId,
    "rts_placement": rtsPlacement == null ? null : rtsPlacement,
    "specialization_id": specializationId == null ? null : specializationId,
    "specialization_name_eng": specializationNameEng == null ? null : specializationNameEng,
    "specialization_name_rus": specializationNameRus == null ? null : specializationNameRus,
    "funds_statuses_id": fundsStatusesId == null ? null : fundsStatusesId,
    "funds_types_rus": fundsTypesRus == null ? null : fundsTypesRus,
    "updating_date": updatingDate == null ? null : "${updatingDate.year.toString().padLeft(4, '0')}-${updatingDate.month.toString().padLeft(2, '0')}-${updatingDate.day.toString().padLeft(2, '0')}",
    "funds_categories_id": fundsCategoriesId == null ? null : fundsCategoriesId,
    "funds_categories_title_rus": fundsCategoriesTitleRus == null ? null : fundsCategoriesTitleRus,
    "fee_uk": feeUk == null ? null : feeUk,
    "isin_code": isinCode == null ? null : isinCode,
  };
}
