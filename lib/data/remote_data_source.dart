import 'package:http/http.dart' as http;

class RemoteDataSource {
  static const String url =
      "https://firebasestorage.googleapis.com/v0/b/collect-plus-6ccd0.appspot.com/o/mobile_tasks%2Fform_task.json?alt=media&token=d048a623-415e-41dd-ad28-8f77e6c546be";
  static Future<http.Response> fetchConfig() {
    return http.get(url);
  }
}
