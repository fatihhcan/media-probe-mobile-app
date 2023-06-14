import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:media_probe_mobile_app/core/services/data_service.dart';

void main() async{
  Services services = Services();
  await dotenv.load(fileName: ".env");
  test("Fetch API", () async {
    bool done = false;
    var fetch = (await services.getData());
    if (fetch != null) {
      done = true;
    }
    expect(done, true);
  });
}
