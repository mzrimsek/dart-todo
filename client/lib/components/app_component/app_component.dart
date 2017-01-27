import 'package:angular2/core.dart';
import 'package:angular2/router.dart';

import '../../dart_todo_client.dart';

@Component(
  selector: 'todo-app',
  templateUrl: 'app_component.html',
  styleUrls: const ['app_component.css'],
  directives: const [ROUTER_DIRECTIVES],
  providers: const [TodoService, ROUTE_PROVIDERS]
)

@RouteConfig(const [
  const Route(
    path: '/todos',
    name: 'Todos',
    component: TodoComponent,
    useAsDefault: true
  )
])

class AppComponent {
  String title = 'Todos';
}