// To parse this JSON data, do
//
//     final document = documentFromJson(jsonString);

import 'dart:convert';
// Function to parse a JSON string into a Document object
Document documentFromJson(String str) => Document.fromJson(json.decode(str));
// Function to convert a Document object back to a JSON string
String documentToJson(Document data) => json.encode(data.toJson());
// Class representing a top-level document in Firestore
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
// Class representing a nested document element within the main document
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
// Class representing the "Fields" section within a DocumentElement
class Fields {
    Dob? dob;
    Dob? email;
    Phone? phone;
    Dob? uid;
    Dob? medical;
    Dob? username;

    Fields({
        required this.dob,
        required this.email,
        required this.phone,
        required this.uid,
        required this.medical,
        required this.username,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        dob: Dob.fromJson(json["dob"]),
        email: Dob.fromJson(json["email"]),
        phone: Phone.fromJson(json["phone"]),
        uid: Dob.fromJson(json["uid"]),
        medical: Dob.fromJson(json["medical"]),
        username: Dob.fromJson(json["username"]),
    );

    Map<String, dynamic> toJson() => {
        "dob": dob!.toJson(),
        "email": email!.toJson(),
        "phone": phone!.toJson(),
        "uid": uid!.toJson(),
        "medical": medical!.toJson(),
        "username": username!.toJson(),
    };
}
// Class representing a field with a string value (e.g., dob, uid, etc.)
class Dob {
    String? stringValue;

    Dob({
        required this.stringValue,
    });

    factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        stringValue: json["stringValue"],
    );

    Map<String, dynamic> toJson() => {
        "stringValue": stringValue,
    };
}
// Class representing a field with a integer value
class Phone {
    String? integerValue;

    Phone({
        required this.integerValue,
    });

    factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        integerValue: json["integerValue"],
    );

    Map<String, dynamic> toJson() => {
        "integerValue": integerValue,
    };
}
