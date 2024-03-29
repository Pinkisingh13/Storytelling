import 'package:flutter/material.dart';
import 'package:storytelling/utils/constants/colors.dart';

class SigninButton extends StatelessWidget {
  const SigninButton({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            blurStyle: BlurStyle.inner,
            color: TColors.primary,
            spreadRadius: 2,
            offset: Offset(5, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}
