


import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:twitter_clone/data/graph/grpahql_config.dart';

import '../model/twitter.dart';

class GraphqlService {
  static GraphQlConfig config = GraphQlConfig();
  GraphQLClient client  = config.clientToQuery();

 Future<bool> login({String? email, String? password}) async {

  try {
    QueryResult result = await  client.mutate(
      MutationOptions(
        fetchPolicy:FetchPolicy.noCache,
        document: gql(''' 
         
         mutation {
    login(
        input: {
            email: \$email,
            password: \$password,
        }
    ) {
        user {
           id,
           email,
           username,
           createdAt
        },
        accessToken
    }
}
    ''')));

   
    if(result.hasException){
      return false;
    }else{
      return true;
    }


  } catch (e) {
    throw Exception(e);
  }
 }




 Future<List<TweetModel>> getTweets()async {

  try {
    QueryResult result = await  client.query(
      QueryOptions(
        fetchPolicy:FetchPolicy.noCache,
        document: gql(''' 
        query {
    tweets {
        id,
        userId,
        user {
            id,
            email,
            username,
            createdAt
        }
        body,
        createdAt
    } 
}
    ''')));


    List? res = result.data?["tweets"];

    if(res == null || res.isEmpty){
      return [];
    }


    if(result.hasException){
      throw Exception(result.exception);
    }
    List<TweetModel> tweets = res.map((e) => TweetModel.fromMap(e)).toList();

 
    return tweets;
  } catch (e) {
    throw Exception(e);
  }
 }





}