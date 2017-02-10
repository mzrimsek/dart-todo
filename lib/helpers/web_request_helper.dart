import 'dart:convert';
import 'package:http/http.dart';

class WebRequestHelper
{
  static dynamic extractData(Response resp) => JSON.decode(resp.body);
  
  static Exception handleError(dynamic e) {
    return new Exception('Server error; cause: $e');
  }
}