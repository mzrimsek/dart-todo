part of dart_todo;

class ApiRequestHelper
{
  static dynamic DecodeAndGetRequestBody(Request request)
  {
    request.decodeBody();
    return request.requestBodyObject;
  }
}