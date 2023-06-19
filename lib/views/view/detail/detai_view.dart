import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/core/extensions/context_extensions.dart';

import '../../../core/constants/text/text_constant.dart';


class DetailView extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? text;
  final String? publishedDate;

  const DetailView({super.key, this.imageUrl, this.title, this.text, this.publishedDate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstant.newsDetail),
      ),
      body: ListView(
        padding: context.paddingLowAll,
        children: [
          Image.network(imageUrl!),
          context.sizedBoxLowVertical,
          Text(title!, style: context.textTheme.headlineMedium!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),),
          context.sizedBoxLowVertical,
          Text(text!, style: context.textTheme.headlineSmall,),
          context.sizedBoxLowVertical,
          Text(publishedDate!, style: context.textTheme.labelLarge,),
        ],
      ),
    );
  }
}