import 'package:book_app/features/home/presentation/views/widgets/similar_book_list_view.dart';
import 'package:flutter/material.dart';
import '../../../../../core/util/style.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'You can also like',
            style: Style.textStyle14.copyWith(fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 16,
          ),
          const SimilarBookListView(),

        ],
      ),
    );
  }
}