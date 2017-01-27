import 'dart:convert';

import 'package:http/http.dart';

class RequestHelper
{
  static dynamic extractData(Response resp) => JSON.decode(resp.body)['data'];
  
  static Exception handleError(dynamic e) {
    return new Exception('Server error; cause: $e');
  }
}