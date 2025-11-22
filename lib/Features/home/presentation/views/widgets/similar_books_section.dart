import 'package:bookly_app/Features/home/presentation/views/widgets/similar_box_list_view.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You Can also like',
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.w700),
        ),

        const SizedBox(height: 16),

        const SinilarBookdListView(),
      ],
    );
  }
}
