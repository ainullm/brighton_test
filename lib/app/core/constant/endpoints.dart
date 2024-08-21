
import 'constants.dart';

class Endpoint {
  //auth
  static const getDataMovie = "$API_BASE_URL?apikey=$APIKEY&s=batman&page=pageNumber";
  static const getDetailMovie = "$API_BASE_URL?apikey=$APIKEY&i=";
  static const getSearchMovie = "$API_BASE_URL?apikey=$APIKEY&s=";
}
