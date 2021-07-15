// To parse this JSON data, do
//
//     final fund = fundFromJson(jsonString);

import 'dart:convert';

Fund fundFromJson(String str) => Fund.fromJson(json.decode(str));

List<Fund> fundsFromJson(String str) {
  json.decode(str).map((e) => Fund.fromJson(e)).toList();
}

String fundToJson(Fund data) => json.encode(data.toJson());

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

  factory Fund.fromJson(Map<String, dynamic> json) => Fund(
        id: json["ID"],
        createdAt: DateTime.parse(json["CreatedAt"]),
        updatedAt: DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        fundId: json["id"],
        auditorId: json["auditor_id"],
        fundsObjectNameRus: json["funds_object_name_rus"],
        dateOfEndPlacing: DateTime.parse(json["date_of_end_placing"]),
        dateOfStartPlacing: DateTime.parse(json["date_of_start_placing"]),
        kodMicex: json["kod_micex"],
        fundsCompId: json["funds_comp_id"],
        fundsCompNameRus: json["funds_comp_name_rus"],
        mmvbPlacement: json["mmvb_placement"],
        moreEng: json["more_eng"],
        moreRus: json["more_rus"],
        nameEng: json["name_eng"],
        nameRus: json["name_rus"],
        qualifiedOnly: json["qualified_only"],
        recorderId: json["recorder_id"],
        registrationDate: DateTime.parse(json["registration_date"]),
        regNumber: json["reg_number"],
        repositoryId: json["repository_id"],
        rtsPlacement: json["rts_placement"],
        specializationId: json["specialization_id"],
        specializationNameEng: json["specialization_name_eng"],
        specializationNameRus: json["specialization_name_rus"],
        fundsStatusesId: json["funds_statuses_id"],
        fundsTypesRus: json["funds_types_rus"],
        updatingDate: DateTime.parse(json["updating_date"]),
        fundsCategoriesId: json["funds_categories_id"],
        fundsCategoriesTitleRus: json["funds_categories_title_rus"],
        feeUk: json["fee_uk"],
        isinCode: json["isin_code"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt.toIso8601String(),
        "UpdatedAt": updatedAt.toIso8601String(),
        "DeletedAt": deletedAt,
        "id": fundId,
        "auditor_id": auditorId,
        "funds_object_name_rus": fundsObjectNameRus,
        "date_of_end_placing":
            "${dateOfEndPlacing.year.toString().padLeft(4, '0')}-${dateOfEndPlacing.month.toString().padLeft(2, '0')}-${dateOfEndPlacing.day.toString().padLeft(2, '0')}",
        "date_of_start_placing":
            "${dateOfStartPlacing.year.toString().padLeft(4, '0')}-${dateOfStartPlacing.month.toString().padLeft(2, '0')}-${dateOfStartPlacing.day.toString().padLeft(2, '0')}",
        "kod_micex": kodMicex,
        "funds_comp_id": fundsCompId,
        "funds_comp_name_rus": fundsCompNameRus,
        "mmvb_placement": mmvbPlacement,
        "more_eng": moreEng,
        "more_rus": moreRus,
        "name_eng": nameEng,
        "name_rus": nameRus,
        "qualified_only": qualifiedOnly,
        "recorder_id": recorderId,
        "registration_date":
            "${registrationDate.year.toString().padLeft(4, '0')}-${registrationDate.month.toString().padLeft(2, '0')}-${registrationDate.day.toString().padLeft(2, '0')}",
        "reg_number": regNumber,
        "repository_id": repositoryId,
        "rts_placement": rtsPlacement,
        "specialization_id": specializationId,
        "specialization_name_eng": specializationNameEng,
        "specialization_name_rus": specializationNameRus,
        "funds_statuses_id": fundsStatusesId,
        "funds_types_rus": fundsTypesRus,
        "updating_date":
            "${updatingDate.year.toString().padLeft(4, '0')}-${updatingDate.month.toString().padLeft(2, '0')}-${updatingDate.day.toString().padLeft(2, '0')}",
        "funds_categories_id": fundsCategoriesId,
        "funds_categories_title_rus": fundsCategoriesTitleRus,
        "fee_uk": feeUk,
        "isin_code": isinCode,
      };
}
