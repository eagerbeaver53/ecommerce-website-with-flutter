import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/extensions/padding_extension.dart';

import '../../extensions/hover_extension.dart';
import '../../shared/ui/shared_styles.dart';
import '../../shared/ui/ui_helpers.dart';
import '../navigation_items/menu_navigation_item.dart';
import 'navigation_bar_logo.dart';

class MobileNavigationBar extends StatefulWidget {
  const MobileNavigationBar({Key? key}) : super(key: key);

  @override
  _MobileNavigationBarState createState() => _MobileNavigationBarState();
}

class _MobileNavigationBarState extends State<MobileNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 9,
      shadowColor: Colors.orange,
      backgroundColor: backgroundColor,
      centerTitle: false,
      title: const NavigationBarLogo().moveUpOnHover,
      actions: [
        const MenuNavigationItem().moveUpOnHover,
        horizontalSpaceTiny
      ],
    );
  }
}
