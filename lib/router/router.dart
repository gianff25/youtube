
import 'package:fluro/fluro.dart';
import 'package:youtube/router/handlers.dart';

class Flurorouter {

  static final FluroRouter router = new FluroRouter();

  static String rootRoute = '/';


  static void configureRoutes(){

    router.define(rootRoute, handler: Handlers.home);

    router.notFoundHandler = Handlers.noPageFound;
  }

}