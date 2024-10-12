import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';




class MyNetworking {
  final String _base_url = "http://127.0.0.1:6000";
  final _myDio = Dio();

  Future<bool> checkUser(Map<String, dynamic> data) async {
    final tempData = await Dio().get("http://10.0.2.2:8080/check_user", data: data);
    //print("${tempData.data}");
    ///return false;
    
    final dataFromJson = (jsonDecode(tempData.data)) as Map<String, int>;
    if (dataFromJson["status"] == 200) {
      return true;
    } else {
      return false;
    }
    //debugPrint(tempData.data);
    //return true;
    
  }

}