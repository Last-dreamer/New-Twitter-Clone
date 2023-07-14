
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlConfig {
  static  HttpLink link = HttpLink("http://20.203.31.58/queryquery");

  GraphQLClient clientToQuery () =>  GraphQLClient(link: link, cache: GraphQLCache());
}