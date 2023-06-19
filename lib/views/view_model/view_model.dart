import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:media_probe_mobile_app/core/constants/app/app_constant.dart';
import 'package:media_probe_mobile_app/core/constants/text/text_constant.dart';
import '../model/data_model.dart';
import '../model/services/data_service.dart';

class ViewModel with ChangeNotifier {
  late List<DataModel> data;

  bool loading = false;
  Services services = Services();

  getData() async {
    loading = true;
    data = await services.getData();
    loading = false;
    notifyListeners();
  }

  String getDateFormat(int index, DateTime publishedDate) {
    final sortDate = data.map((item) => item).toList()
      ..sort((a, b) => a.publishedDate.compareTo(b.publishedDate));

    String formattedDate =
        DateFormat.yMMMEd().format(sortDate[index].publishedDate);
    return formattedDate;
  }

  List<DataModel> sortNews() {
    final sortData = data.map((item) => item).toList()
      ..sort((a, b) => a.publishedDate.compareTo(b.publishedDate));

    return sortData;
  }

  String isCheckMedia(int index) {
    if (data[index].media.isEmpty) {
      return AppConstants.EMPTY_MEDIA_URL;
    }
    return data[index].media[0].mediaMetadata[2].url;
  }

  String isCheckAbstract(int index) {
    if (data[index].dataModelAbstract.isEmpty ||data[index].dataModelAbstract == "") {
      return TextConstant.captionNotFound;
    }

    return data[index].dataModelAbstract;
  }
}
