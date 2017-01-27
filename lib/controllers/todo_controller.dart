part of dart_todo;

class TodoController extends HTTPController
{
  @httpGet
  getTodos() async
  {
    var todoQuery = new Query<Todo>();
    var todos = await todoQuery.fetch()
      ..sort((a,b) => a.id.compareTo(b.id));
    return new Response.ok(todos);
  }

  @httpPost
  createTodo() async 
  {
    var requestBody = ApiRequestHelper.DecodeAndGetRequestBody(request);
    var insertQuery = new Query<Todo>()
      ..valueMap = requestBody;
    var newTodo = await insertQuery.insert();
    return new Response.ok(newTodo);
  }

  @httpPut
  updateTodo(@HTTPPath("id") int id) async
  {
    var requestBody = ApiRequestHelper.DecodeAndGetRequestBody(request);
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

  @httpDelete
  deleteTodo(@HTTPPath("id") int id) async
  {
    var deleteQuery = new Query<Todo>()
      ..matchOn.id = id;
    var numDeleted = await deleteQuery.delete();

    if(numDeleted == 1)
    {
      return new Response.ok(null);
    }
    return new Response.notFound();
  }
}
