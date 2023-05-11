import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:bloc_frist_part/model/contact_model.dart';

class ApiService {
  static final dio = Dio();
  static String baseUrl =
      "https://645626895f9a4f23613bea38.mockapi.io/api/nem/users";
  static Future<List<Contact>?> getListContact() async {
    try {
      var response = await dio.get("$baseUrl");

      if (response.statusCode == 200) {
        return ContactFromJson(response.data);
      }
    } catch(e){
      print(e);
    }
  }

   static Future<List<Contact>> putContact(Contact contact) async {
    final response =
        await dio.put("https://645626895f9a4f23613bea38.mockapi.io/api/nem/users${contact.id}",
            data: jsonEncode(contact),
            options: Options(headers: {
              'Content-type': 'application/json; charset=UTF-8',
            }));
    return ContactFromJson(response.data);
  }



  static Future<List<Contact>> delete(Contact contact) async {
    final response =
        await dio.delete("https://645626895f9a4f23613bea38.mockapi.io/api/nem/users",
            data: jsonEncode(contact),
            options: Options(headers: {
              'Content-type': 'application/json; charset=UTF-8',
            }));
    return ContactFromJson(response.data);
  }
}
