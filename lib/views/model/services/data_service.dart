import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:media_probe_mobile_app/core/constants/app/app_constant.dart';

import '../api/api_response.dart';
import '../data_model.dart';
import 'base_service.dart';

class Services extends BaseService {
  @override
  Future<List<DataModel>> getData() async {
    late List<DataModel> data;
    const baseUrl = AppConstants.BASE_URL;
    final apiKey = dotenv.env["API_KEY"];

    try {
      final response = await http.get(
        Uri.parse('${baseUrl}api-key=$apiKey'),
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        data = List<DataModel>.from(
            item["results"].map((model) => DataModel.fromJson(model)));
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurred' + e.toString());
    }
    return data;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}
