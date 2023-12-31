import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/core/constants/routes/navigation_constant.dart';
import 'package:media_probe_mobile_app/core/constants/text/text_constant.dart';
import 'package:media_probe_mobile_app/core/extensions/context_extensions.dart';
import 'package:media_probe_mobile_app/core/utility/arguments_detail.dart';
import 'package:provider/provider.dart';
import '../../../core/components/card/news_card.dart';
import '../../view_model/view_model.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    Provider.of<ViewModel>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<ViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstant.appTitle),
      ),
      body: Container(
          padding: context.paddingLowAll,
          child: postMdl.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemBuilder: ((context, index) {
                    return NewsCard( 
                    title:  postMdl.sortNews()[index].title, 
                    abstractData: postMdl.isCheckAbstract(index),
                    publishedDate: postMdl.getDateFormat(index ,postMdl.data[index].publishedDate), 
                    imageURL: postMdl.isCheckMedia(index),
                    onTap: () => {
                      Navigator.of(context).pushNamed(NavigationConstants.NEWS_DETAIL_VIEW, arguments: 
                      DetailArguments(
                        imageUrl: postMdl.isCheckMedia(index),
                        title: postMdl.sortNews()[index].title, 
                        text: postMdl.sortNews()[index].dataModelAbstract, 
                        publishedDate: postMdl.getDateFormat(index ,postMdl.sortNews()[index].publishedDate), 
                      )
                      )
                    },
                    
                    );
                  }),
                  separatorBuilder: ((context, index) => context.sizedBoxLowVertical
                      ),
                  itemCount: postMdl.data.length)),
    );
  }
}
