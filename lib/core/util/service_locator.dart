import 'package:book_app/features/home/data/repo/home_repo_impl.dart';
import 'package:book_app/features/search/data/repo/search_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServerLocator() {
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl());
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl());
}