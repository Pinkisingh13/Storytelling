import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storytelling/utils/constants/colors.dart';
import 'package:storytelling/utils/device/device_utility.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar(
      {super.key,
      this.title,
      this.isCenterTitle= true,
      this.showBackArrow = true,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed});
  final bool? isCenterTitle;
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final Function()? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 30,
      scrolledUnderElevation: 20,
      centerTitle: isCenterTitle! ? true : false,
      title: title,
      toolbarHeight: TDeviceUtils.getAppBarHeight() * 1.50,
      leading: showBackArrow
          ? IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  size: 24, color: TColors.darkGrey),
            )
          : leadingIcon != null
              ? IconButton(
                  onPressed: leadingOnPressed,
                  icon: Icon(leadingIcon, size: 24, color: TColors.darkGrey,),
                )
              : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
