import 'package:book_app/core/util/api_serves.dart';
import 'package:book_app/core/util/app_route.dart';
import 'package:book_app/core/util/service_locator.dart';
import 'package:book_app/features/home/data/repo/home_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/util/color_data.dart';
import 'features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';


void main() {
  ApiServes.initial();
  setupServerLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>FeaturedBooksCubit(HomeRepoImpl())..fetchFeaturedBooks() ,),
        BlocProvider(create: (context)=>NewestBooksCubit(getIt.get<HomeRepoImpl>())..fetchNewestBooks() ,),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.route,
        title: 'Book App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorData.kBackGroundColor,
          useMaterial3: true,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}


