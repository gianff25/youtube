
import 'package:fluro/fluro.dart';
import 'package:youtube/views/home_view.dart';
import 'package:youtube/views/not_found_view.dart';

class Handlers {

  static Handler home = Handler(
    handlerFunc: (context, parameters){

      return const HomeView();
    }
  );

  static Handler noPageFound = Handler(
    handlerFunc: (context, parameters){

    return const NoPageFound();
  });
}