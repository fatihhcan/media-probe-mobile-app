import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/core/constants/text/text_constant.dart';
import 'package:media_probe_mobile_app/core/extensions/context_extensions.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String caption;
  final String publishedDate;
  final String imageURL;
  final void Function()? onTap;

  const NewsCard(
      {super.key,
      required this.title,
      required this.caption,
      required this.publishedDate,
      required this.imageURL,
      required this.onTap
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      padding: const EdgeInsets.only(
        top: 40,
        bottom: 20,
      ),
      child: Column(
        children: [
          Image.network(imageURL),
          context.sizedBoxLowVertical,
          Text(
            publishedDate,
            textAlign: TextAlign.justify,
            style: context.textTheme.labelLarge,
          ),
          context.sizedBoxLowVertical,

          Text(
            title,
            textAlign: TextAlign.center,
            style: context.textTheme.headlineMedium!.copyWith(color: Colors.orangeAccent, fontWeight: FontWeight.bold),
          ),
          context.sizedBoxLowVertical,

          Text(
            caption,
            textAlign: TextAlign.center,
            style: context.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
          ),
          context.sizedBoxLowVertical,
          GestureDetector(
            key: Key("readMore"),
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  TextConstant.readMore,
                  style: TextStyle(color: Colors.brown),
                ),
                Icon(
                  Icons.keyboard_double_arrow_right,
                  color: Colors.brown,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
