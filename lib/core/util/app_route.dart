import 'package:book_app/core/util/service_locator.dart';
import 'package:book_app/features/home/data/models/books_model/book_model.dart';
import 'package:book_app/features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_app/features/home/presentation/views/book_details_view.dart';
import 'package:book_app/features/home/presentation/views/home_view.dart';
import 'package:book_app/features/search/data/repo/search_repo_impl.dart';
import 'package:book_app/features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:book_app/features/search/presentation/view/search_view.dart';
import 'package:book_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/data/repo/home_repo_impl.dart';

abstract class AppRoutes {
  static const String homeView = '/HomeView';
  static const String detailsView = '/DetailsView';
  static const String searchView = '/searchView';

  static final route = GoRouter(routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashView()),
    GoRoute(path: homeView, builder: (context, state) => const HomeView()),
    GoRoute(
        path: detailsView,
        builder: (context, state) => BlocProvider(
            create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
            child: BookDetailsView(
              books: state.extra as BookModel,
            ))),
    GoRoute(
        path: searchView,
        builder: (context, state) => BlocProvider(
              create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
              child: const SearchView(),
            )),
  ]);
}
