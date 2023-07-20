import 'package:get_it/get_it.dart';
import 'package:twitter_clone/data/data_source/graphql_service.dart';
import 'package:twitter_clone/data/repo/twitter_repo_impl.dart';
import 'package:twitter_clone/domain/repo/repo.dart';
import 'package:twitter_clone/domain/use_cases/twitter_usecase.dart';

final di = GetIt.I;

Future<void> init() async {
  di.registerFactory<TwitterRemoteDatasourcesImpl>(
      () => TwitterRemoteDatasourcesImpl());
  di.registerFactory<TwitterRepo>(() => TwitterRepoImpl(datasource: di()));
  di.registerFactory(() => TwitterUseCase(twitterRepo: di()));
}
