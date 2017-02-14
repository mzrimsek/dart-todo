import 'package:angular2/core.dart';
import 'package:angular2/platform/common.dart';
import 'package:angular2/router.dart';
import '../todo_component/todo_component.dart';
import '../not_found_component/not_found_component.dart';
import '../../services/todo_service.dart';

@Component(
  selector: 'todo-app',
  templateUrl: 'app_component.html',
  styleUrls: const ['app_component.css'],
  directives: const [ROUTER_DIRECTIVES],
  providers: const [
    TodoService, 
    ROUTER_PROVIDERS,
    const Provider(LocationStrategy, useClass: HashLocationStrategy)
  ]
)

@RouteConfig(const [
  const Redirect(
    path: '/',
    redirectTo: const ['Todos']
  ),
  const Route(
    path: '/todos',
    name: 'Todos',
    component: TodoComponent
  ),
  const Route(
    path: '/**',
    name: '404',
    component: NotFoundComponent
  )
])

class AppComponent {
  String title = 'Dart Todo';
}