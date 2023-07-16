import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:twitter_clone/data/exception/exception.dart'; 
import '../model/twitter.dart';
import 'grpahql_config.dart';


abstract class TwitterRemoteDatasources {
  Future<AuthResponse> login({String? email,String? password});
  Future<AuthResponse> register({String? username, String? email,String? password, String? confirmPassword});
  Future<List<TweetModel>> getTweets();

}

class TwitterRemoteDatasourcesImpl extends TwitterRemoteDatasources {
  static GraphQlConfig config = GraphQlConfig();
  GraphQLClient client  = config.clientToQuery();

  @override
  Future<AuthResponse> login({String? email, String? password}) async {
  try {
    QueryResult result = await client.mutate(
      MutationOptions(
        fetchPolicy:FetchPolicy.noCache,
        variables: {
            "email": "$email",
            "password": "$password"
        },
        document: gql('''  
         mutation Mutation(\$email: String!, \$password: String!){
           login(input:  {
              email: \$email,
              password: \$password
           }) {
            accessToken,
            user {
              id,
              email,
              username,
              createdAt
            }
           }
         }
    ''',
    )));

    if(result.hasException){
      log("testing rr ${result.exception} :: ${result.exception?.graphqlErrors.first.message}");
      throw Exception(result.exception?.graphqlErrors.first.message);
    }else{
      log("testingee2 e${result.data}");
      var res =  result.data?["login"];

      if(res == null  && res.isEmpty){
        throw MissingFieldsException();
      }
      AuthResponse map = AuthResponse.fromMap(res);
      return map;
    }
  } catch (e) {
    throw Exception(e);
  }
 }
 
  @override
  Future<AuthResponse> register({String? username, String? email, String? password, String? confirmPassword})async {
     try {
    QueryResult result = await client.mutate(
      MutationOptions(
        fetchPolicy:FetchPolicy.noCache,
        variables: {
            "username": "$username",
            "email": "$email",
            "password": "$password",
            "confirmPassword": "$confirmPassword"
        },
        document: gql('''  
          mutation Mutation(\$username: String!, \$email: String!, \$password: String!, \$confirmPassword: String!){
    register (
        input: {
            username: \$username,
            email: \$email,
            password: \$password,
            confirmPassword: \$confirmPassword
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
    ''',
    )));

    if(result.hasException){      
      throw Exception(result.exception?.graphqlErrors.first.message);
    }else{
      log("testingee2 e${result.data}");
      var res =  result.data?["register"];

      if(res == null  && res.isEmpty){
        throw MissingFieldsException();
      }
      AuthResponse map = AuthResponse.fromMap(res);
      return map;
    }
  } catch (e) {
    throw Exception(e);
  }
  }
 
 @override 
  Future<List<TweetModel>> getTweets() async {
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

    log("testin res $res");

    if(res == null || res.isEmpty){
      return [];
    }

    if(result.hasException){
      throw Exception(result.exception);
    }
    List<TweetModel> tweets =  res.map((e) => TweetModel.fromMap(e)).toList();
    return tweets;
  } catch (e) {
    throw Exception(e);
  }
 }

}