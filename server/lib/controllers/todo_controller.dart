import '../dart_todo_server.dart';

class TodoController extends HTTPController
{
  @httpGet
  getAllTodos() async
  {
    var todoQuery = new Query<Todo>();
    var todos = await todoQuery.fetch()
      ..sort((a,b) => a.id.compareTo(b.id));
    return new Response.ok(todos);
  }

  @httpPost
  createTodo() async 
  {
    request.decodeBody();
    var requestBody = request.requestBodyObject;
    var insertQuery = new Query<Todo>()
      ..valueMap = requestBody;
    var newTodo = await insertQuery.insert();
    return new Response.ok(newTodo);
  }

  @httpPut
  updateTodo(@HTTPPath("id")int id) async
  {
    request.decodeBody();
    var requestBody = request.requestBodyObject;
    print(requestBody);
    var updateQuery = new Query<Todo>()
      ..valueMap = requestBody
      ..matchOn.id = id;
    var updatedTodo = await updateQuery.updateOne();
    
    if(updatedTodo != null)
    {
      return new Response.ok(updatedTodo);
    }
    return new Response.notFound();
  }
}
