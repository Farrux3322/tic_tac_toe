import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/utils/colors.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class WButton extends StatelessWidget {
  const WButton({Key? key, required this.icon, required this.onTab}) : super(key: key);

  final String icon;
  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTab,
      child: Container(
        width: 143,
        height: 143,
        padding: const EdgeInsets.all(36),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [BoxShadow(
            color: AppColors.shadow,
          )]
        ),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
