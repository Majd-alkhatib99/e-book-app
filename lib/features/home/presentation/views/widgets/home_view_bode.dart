import 'package:book_app/core/util/style.dart';
import 'package:book_app/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'best_seller_list_view.dart';
import 'custom_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(),
        Expanded(
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeListViewBuilder(),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        'Best Seller',
                        style: Style.textStyle18,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: BestSellerListView(),
              )
            ],
          ),
        )

      ],
    );
  }
}


