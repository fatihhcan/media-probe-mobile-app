import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:media_probe_mobile_app/core/constants/app/app_constant.dart';

import '../models/data_model.dart';

class Services {
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
}
