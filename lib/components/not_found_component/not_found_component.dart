import 'package:angular2/core.dart';

@Component(
  selector: 'not-found',
  templateUrl: 'not_found_component.html',
  styleUrls: const ['not_found_component.css']
)

class NotFoundComponent
{
  String message = 'Page not found!';
}