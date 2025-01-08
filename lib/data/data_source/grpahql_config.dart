import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlConfig {
  // ! older dashboard  api
  //! before api link  http://20.203.31.58/queryquery

  static HttpLink link = HttpLink("http://10.0.2.2:8001/query");
  GraphQLClient clientToQuery() =>
      GraphQLClient(link: link, cache: GraphQLCache());
}
