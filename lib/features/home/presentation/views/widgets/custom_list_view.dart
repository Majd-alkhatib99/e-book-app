import 'package:book_app/core/widgets/error_text.dart';
import 'package:book_app/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/util/app_route.dart';
import '../../../../../core/widgets/progress_indicator.dart';
import 'custom_book_image.dart';

class HomeListViewBuilder extends StatelessWidget {
  const HomeListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is SuccessGetFeaturedBooksData) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                itemCount: state.books.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, items) => InkWell(
                  onTap: (){
                    GoRouter.of(context).push(AppRoutes.detailsView, extra: state.books[items]);
                  },
                  child: CustomBookImage(
                        imageURL:
                            state.books[items].volumeInfo.imageLinks!.thumbnail??'https://images.twinkl.co.uk/tw1n/image/private/t_630/u/ux/pc_ver_1.png',
                      ),
                )),
          );
        } else if (state is FailureGetFeaturedBooksData) {
          return ErrorText(errorText: state.errorMessage);
        }else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}
