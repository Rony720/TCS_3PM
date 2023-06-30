// To parse this JSON data, do
//
//     final document = documentFromJson(jsonString);

import 'dart:convert';

Document documentFromJson(String str) => Document.fromJson(json.decode(str));

String documentToJson(Document data) => json.encode(data.toJson());

class Document {
    List<DocumentElement>? documents;

    Document({
        required this.documents,
    });

    factory Document.fromJson(Map<String, dynamic> json) => Document(
        documents: List<DocumentElement>.from(json["documents"].map((x) => DocumentElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "documents": List<dynamic>.from(documents!.map((x) => x.toJson())),
    };
}

class DocumentElement {
    String? name;
    Fields? fields;
    DateTime? createTime;
    DateTime? updateTime;

    DocumentElement({
        required this.name,
        required this.fields,
        required this.createTime,
        required this.updateTime,
    });

    factory DocumentElement.fromJson(Map<String, dynamic> json) => DocumentElement(
        name: json["name"],
        fields: Fields.fromJson(json["fields"]),
        createTime: DateTime.parse(json["createTime"]),
        updateTime: DateTime.parse(json["updateTime"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "fields": fields?.toJson(),
        "createTime": createTime?.toIso8601String(),
        "updateTime": updateTime?.toIso8601String(),
    };
}

class Fields {
    Email? uid;
    Dob? phone;
    Email? username;
    Dob? dob;
    Email? email;
    Email? medical;

    Fields({
        required this.uid,
        required this.phone,
        required this.username,
        required this.dob,
        required this.email,
        required this.medical,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        uid: Email.fromJson(json["uid"]),
        phone: Dob.fromJson(json["phone"]),
        username: Email.fromJson(json["username"]),
        dob: Dob.fromJson(json["dob"]),
        email: Email.fromJson(json["email"]),
        medical: Email.fromJson(json["medical"]),
    );

    Map<String, dynamic> toJson() => {
        "uid": uid?.toJson(),
        "phone": phone?.toJson(),
        "username": username?.toJson(),
        "dob": dob?.toJson(),
        "email": email?.toJson(),
        "medical": medical?.toJson(),
    };
}

class Dob {
    String? integerValue;

    Dob({
        required this.integerValue,
    });

    factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        integerValue: json["integerValue"],
    );

    Map<String, dynamic> toJson() => {
        "integerValue": integerValue,
    };
}

class Email {
    String? stringValue;

    Email({
        required this.stringValue,
    });

    factory Email.fromJson(Map<String, dynamic> json) => Email(
        stringValue: json["stringValue"],
    );

    Map<String, dynamic> toJson() => {
        "stringValue": stringValue,
    };
}
