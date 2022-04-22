import 'package:flutter/material.dart';

import '../../../../../core/consts/app_colors_consts.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColorsConst.background,
      body: Center(
        child: CircularProgressIndicator(
          color: AppColorsConst.whiteText,
        ),
      ),
    );
  }
}
