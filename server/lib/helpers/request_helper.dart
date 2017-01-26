import '../dart_todo_server.dart';

class RequestHelper
{
  static dynamic DecodeAndGetRequestBody(Request request)
  {
    request.decodeBody();
    return request.requestBodyObject;
  }
}