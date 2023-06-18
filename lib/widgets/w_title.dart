import 'package:flutter/material.dart';

import '../utils/colors.dart';

class WTittle extends StatelessWidget {
  const WTittle({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
      const TextStyle(fontSize: 42, color: AppColors.white, shadows: [
        Shadow(
          color: AppColors.shadow,
          blurRadius: 15,
        )
      ]),
    );
  }
}
