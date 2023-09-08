import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlConfig {
  // ! older dashboard  api
  //! before api link  http://20.203.31.58/queryquery

  static HttpLink link = HttpLink("http://62.72.59.126:8001/query");
  GraphQLClient clientToQuery() =>
      GraphQLClient(link: link, cache: GraphQLCache());
}
