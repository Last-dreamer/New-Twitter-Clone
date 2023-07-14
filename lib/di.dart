
import 'package:get_it/get_it.dart';
import 'package:twitter_clone/data/graph/graphql_service.dart';

final  di = GetIt.I;

Future<void> init() async {

  di.registerFactory(() => GraphqlService());

}