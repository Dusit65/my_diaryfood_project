
// ignore_for_file: prefer_interpolation_to_compose_strings

//call_api.dart
//This file will contain various methods used to call different APIs according to the functional purposes of the App.
import 'dart:convert';
import 'package:my_diaryfood_project/models/diaryfood.dart';
import 'package:my_diaryfood_project/models/member.dart';
import 'package:http/http.dart' as http;
import 'package:my_diaryfood_project/utils/env.dart';

class CallAPI {
//Method call check_login_api.php -----------------------------------------------
  static Future<Member> callCheckLoginAPI(Member member) async {
    //call to use API and then store the values received from the API in variables.
    final responseData = await http.post(
      Uri.parse(Env.hostName + '/mydiaryfood/apis/check_login_api.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(member.toJson()),
    );
    if (responseData.statusCode == 200) {
      return Member.fromJson(jsonDecode(responseData.body));
    } else {
      throw Exception('Failed to call API');
    }
  }

//Method call register_api.php (add new user member)-----------------------------------------------
  static Future<Member> callRegisterMemberAPI(Member member) async {
    //call to use API and then store the values received from the API in variables.
    final responseData = await http.post(
      Uri.parse(Env.hostName + '/mydiaryfood/apis/register_member_api.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(member.toJson()),
    );
    if (responseData.statusCode == 200) {
      return Member.fromJson(jsonDecode(responseData.body));
    } else {
      throw Exception('Failed to call API');
    }
  }

//Method call update_member_api.php (update member)-----------------------------------------------
  static Future<Member> callUpdateMemberAPI(Member member) async {
    //call to use API and then store the values received from the API in variables.
    final responseData = await http.post(
      Uri.parse(Env.hostName + '/mydiaryfood/apis/update_member_api.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(member.toJson()),
    );
    if (responseData.statusCode == 200) {
      return Member.fromJson(jsonDecode(responseData.body));
    } else {
      throw Exception('Failed to call API');
    }
  }
  
//Method call get_all_diaryfood_by_member_api.php (get all)-----------------------------------------------
  static Future<List<Diaryfood>> callGetAllDiaryfoodByMemberAPI(Diaryfood diaryfood) async {
    //call to use API and then store the values received from the API in variables.
    final responseData = await http.post(
      Uri.parse(Env.hostName + '/mydiaryfood/apis/get_all_diaryfood_by_member_api.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(diaryfood.toJson()),
    );
    if (responseData.statusCode == 200) {
     final dataList = await jsonDecode(responseData.body).map<Diaryfood>((json){
       return Diaryfood.fromJson(json);
     }).toList();

     return dataList;
    } else {
      throw Exception('Failed to call API');
    }
  }
}
