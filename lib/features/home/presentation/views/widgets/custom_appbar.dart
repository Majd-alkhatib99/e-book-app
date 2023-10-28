import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/util/app_route.dart';
import '../../../../../core/util/assets_data.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40,bottom: 20, left: 20,right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetsData.titleLogo,
            height: 30 ,
          ),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRoutes.searchView,);
            },
            icon: const Icon(
              Icons.search,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
