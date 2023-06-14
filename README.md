# media_probe_mobile_app
It is a mobile application that shows the most popular news of the New York Times newspaper of the last 7 days.

## API

**New York Times API**

https://developer.nytimes.com/docs/most-popular-product/1/overview

- You can register and access the key.


## Video

https://github.com/fatihhcan/media-probe-mobile-app/assets/45641833/9fcf12ae-0ef3-4709-beb0-2f365d4c61f6


# Subject

- Provider, a wrapper around InheritedWidget to make them easier to use and more reusable.
- Http was used for API requests.
- Intl was used for the date format.
- Google Fonts was used for the fonts.

# Tasks 📋
API call. 
**data_services.dart**
```dart
 Future<List<DataModel>> getData(context) async {
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
```


**home_view.dart**
News card.
```dart
  ListView.separated(
                  itemBuilder: ((context, index) {
                    return NewsCard( 
                    title:  postMdl.sortNews()[index].title, 
                    caption: postMdl.isCheckCaption(index),
                    publishedDate: postMdl.getDateFormat(index ,postMdl.data[index].publishedDate), 
                    imageURL: postMdl.isCheckMedia(index),
                    onTap: () => {
                      Navigator.of(context).pushNamed(NavigationConstants.NEWS_DETAIL_VIEW, arguments: 
                      DetailArguments(
                        imageUrl: postMdl.isCheckMedia(index),
                        title: postMdl.sortNews()[index].title, 
                        text: postMdl.sortNews()[index].dataModelAbstract, 
                        publishedDate: postMdl.getDateFormat(index ,postMdl.data[index].publishedDate), 
                      )
                      )
                    },
                    
                    );
                  }),
                  separatorBuilder: ((context, index) => context.sizedBoxLowVertical
                      ),
                  itemCount: postMdl.data.length)
```

Sorting of news by date. Create functions in the provider to ensure that the dates and contents are included in the correct cards.
**data_provider.dart**

```dart
  String getDateFormat(int index, DateTime publishedDate) {
    final sortDate = data.map((item) => item).toList()
      ..sort((a, b) => a.publishedDate.compareTo(b.publishedDate));

    String formattedDate =
        DateFormat.yMMMEd().format(sortDate[index].publishedDate);
    return formattedDate;
  }
```
```dart
  List<DataModel> sortNews() {
    final sortData = data.map((item) => item).toList()
      ..sort((a, b) => a.publishedDate.compareTo(b.publishedDate));

    return sortData;
  }
  ```
Provide control because the media and caption can be empty in incoming responses.
```dart
  String isCheckMedia(int index) {
    if (data[index].media.isEmpty) {
      return AppConstants.EMPTY_MEDIA_URL;
    }
    return data[index].media[0].mediaMetadata[2].url;
  }
  ```

  ```dart
  String isCheckCaption(int index) {
    if (data[index].media[0].caption.isEmpty ||data[index].media[0].caption == "") {
      return TextConstant.captionNotFound;
    }

    return data[index].media[0].caption;
  }
  ```
  On the detail page, move the selected arguments. Navigation setup.
    **arguments_detail.dart**
```dart
 class DetailArguments {
  final String? imageUrl;
  final String? title;
  final String? text;
  final String? publishedDate;
  DetailArguments({
    this.imageUrl,
    this.title,
    this.text,
    this.publishedDate
  });
}
  ```
  **navigation_routes.dart**

```dart
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
  ```

  # Folder Structure

```
media_probe_mobile_app
│   
└───lib
    │
    └───core
    │    │    
    │    └───components
    │    │
    │    └───constants
    │    │    
    │    └───extensions
    │    │
    │    └───models
    │    │
    │    └───navigation
    │    │
    │    └───providers
    │    │
    │    └───services
    │    │
    │    └───theme
    │    │
    │    └───utility
    └───views
         └───detail
         └───home
```
