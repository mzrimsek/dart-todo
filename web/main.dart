import 'package:http/http.dart';
import 'package:http/browser_client.dart';
import 'package:angular2/core.dart';
import 'package:angular2/platform/browser.dart';
import '../lib/components/app_component/app_component.dart';

void main()
{
  bootstrap(AppComponent,
    [provide(Client, useFactory: () => new BrowserClient(), deps: [])] 
  );
}