import 'package:book_app/features/search/presentation/manger/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return TextField(
          decoration: InputDecoration(
            enabledBorder: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            hintText: 'Search',
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Opacity(
                opacity: .8,
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 22,
                ),
              ),
            ),
          ),
          onChanged: (value) {
            BlocProvider.of<SearchCubit>(context).fetchSearchResult(search: value);
          },
        );
      },
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.white,
      ),
      borderRadius: BorderRadius.circular(
        12,
      ),
    );
  }
}