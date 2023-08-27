import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlConfig {
  //! before api link  http://20.203.31.58/queryquery
  static HttpLink link = HttpLink("http://127.0.0.1/query");
  GraphQLClient clientToQuery() =>
      GraphQLClient(link: link, cache: GraphQLCache());
}
