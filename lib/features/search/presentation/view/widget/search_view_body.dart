import 'package:book_app/core/widgets/error_text.dart';
import 'package:book_app/core/widgets/progress_indicator.dart';
import 'package:book_app/features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/util/style.dart';
import 'custom_search_text_field.dart';
import 'search_result_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSearchTextField(),
              state is SuccessGetSearchResult
                  ? Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          const Text(
                            'Search Result:',
                            style: Style.textStyle18,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Expanded(
                            child: SearchResultListView(books: state.booksModel),
                          ),
                        ],
                      ),
                  )
                  : Container(),
              state is LoadingGetSearchResult
                  ? const CustomProgressIndicator()
                  : Container(),
              state is FailureGetSearchResult
                  ? ErrorText(errorText: state.errorMessage)
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}


