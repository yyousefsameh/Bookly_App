import 'package:bookly_app/core/utils/styles_manager.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/books_list_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_home_view_app_bar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_horizontal_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHomeViewAppBar(),
              FeaturedBooksHorizontalListView(),
              SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  'Newest Books',
                  style: StylesManager.textStyle18,
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          child: BooksListView(),
        ),
      ],
    );
  }
}
