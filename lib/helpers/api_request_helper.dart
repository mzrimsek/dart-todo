part of dart_todo;

class ApiRequestHelper
{
  static dynamic decodeAndGetRequestBody(Request request)
  {
    request.decodeBody();
    return request.requestBodyObject;
  }
}