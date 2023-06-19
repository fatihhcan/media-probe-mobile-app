import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/core/utility/arguments_detail.dart';
import 'package:media_probe_mobile_app/views/view/detail/detai_view.dart';
import 'package:media_probe_mobile_app/views/view/home/home_view.dart';

import '../constants/routes/navigation_constant.dart';


class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.DEFAULT:
        return normalNavigate( HomeView());

      case NavigationConstants.NEWS_DETAIL_VIEW:
        final DetailArguments argsDetail =
            args.arguments as DetailArguments;
               return MaterialPageRoute(
            builder: (_) => DetailView(imageUrl: argsDetail.imageUrl, title: argsDetail.title, text: argsDetail.text, publishedDate: argsDetail.publishedDate,));
      default:
        return normalNavigate( HomeView());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}