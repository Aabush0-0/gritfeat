import 'package:flutter_dotenv/flutter_dotenv.dart';

class Urls {
  static const baseUrl = 'https://jsonplaceholder.typicode.com/';

  static String get trefleToken => dotenv.env['TREFLE_TOKEN'] ?? '';
}
