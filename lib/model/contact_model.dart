import 'dart:convert';
import 'dart:math';

List<Contact> ContactFromJson(List str)=>List<Contact>.from(str.map((e) => Contact.fromJson(e)));
String ContactToJson(List<Contact>data)=>
json.encode(List<dynamic>.from(data.map((e)=>e.toJson())));

class Contact{
  String name;
  String avatar;
  String phone;
  String id;

  Contact({
    required this.name,
    required this.avatar,
    required this.phone,
    required this.id,

  });

  factory Contact.fromJson(Map<String,dynamic> json)=> Contact(name: json["name"], avatar: json["avatar"], phone: json["phoneNumber"], id: json["id"]);

  Map<String,dynamic> toJson()=>{
    "name":name,
    "avatar":avatar,
    "phone":phone,
    "id":id,  };
}