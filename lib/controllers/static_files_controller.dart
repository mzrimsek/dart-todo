part of dart_todo;

class StaticFilesController extends HTTPController 
{
  final String basePath;
  final String defaultFile;

  StaticFilesController({this.basePath: "build/web", this.defaultFile: "index.html"});

  @httpGet getFile() async 
  {
    String realPath = request.path.remainingPath;
    if (realPath.length == 0) 
    {
      realPath = defaultFile;
    }
    
    String filePath = path.join(basePath, realPath);
    io.File file = new io.File(filePath);
    List<int> fileContents = file.readAsBytesSync();

    String contentType = mime.lookupMimeType(filePath);

    return new Response.ok(fileContents)
      ..contentType = io.ContentType.parse(contentType);
  }
}