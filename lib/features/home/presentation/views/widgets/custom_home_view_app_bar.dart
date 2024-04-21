import 'package:bookly_app/core/utils/assets_manager.dart';
import 'package:bookly_app/core/utils/routes_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomHomeViewAppBar extends StatelessWidget {
  const CustomHomeViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40.0,
        horizontal: 18.0,
      ),
      child: Row(
        children: [
          Image.asset(
            AppImageAssets.appLogo,
            height: 20.0,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(Routes.kSearchView);
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22.0,
            ),
          ),
        ],
      ),
    );
  }
}
