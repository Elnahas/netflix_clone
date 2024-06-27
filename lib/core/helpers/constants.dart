
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static  String userToken =dotenv.get("API_TOKEN" , fallback: "" );
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500/";
  static const String baseUrl = "https://api.themoviedb.org/3";
}
