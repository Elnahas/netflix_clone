
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static  String userToken =dotenv.get("API_TOKEN" , fallback: "" );
}
