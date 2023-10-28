import 'package:book_app/core/util/color_data.dart';
import 'package:book_app/core/widgets/custom_button.dart';
import 'package:book_app/features/home/data/models/books_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookActionButtons extends StatelessWidget {
  const BookActionButtons({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 40.0),
      child:  Row(
        children: [
          const CustomButton(
            backgroundColor:ColorData.kWhiteColor,
            text: 'FREE',
            textColor: Colors.black,
            fontWeight: FontWeight.w900,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(14), topLeft: Radius.circular(14)),
          ),
          CustomButton(
            backgroundColor: ColorData.kPrimeColor,
            text: 'Preview',
            textColor: Colors.white,
            fontWeight: FontWeight.normal,
            borderRadius:const  BorderRadius.only(
                bottomRight: Radius.circular(14), topRight: Radius.circular(14)),
            onPressed:()async{
              Uri uri = Uri.parse(book.volumeInfo.previewLink!);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri);
              }
            },
          ),
        ],
      ),
    );
  }
}