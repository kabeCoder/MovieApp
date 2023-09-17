import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonTabBar extends StatelessWidget {
  CommonTabBar({
    super.key,
    required this.tabRoutes,
    required this.tabTexts,
    required this.dividerColor,
    required this.labelStyle,
    required this.unselectedLabelColor,
    required this.unselectedLabelStyle,
    this.leadingIcon,
  });

  final List<PageRouteInfo<dynamic>> tabRoutes;
  final List<Widget> tabTexts;
  final Color dividerColor;
  final TextStyle labelStyle;
  final Color unselectedLabelColor;
  final TextStyle unselectedLabelStyle;
  Widget? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: tabRoutes,
      builder: (context, child, controller) {
        return Scaffold(
          appBar: AppBar(
            leading: leadingIcon,
            title: TabBar(
              controller: controller,
              tabs: tabTexts,
              dividerColor: dividerColor,
              labelStyle: labelStyle,
              unselectedLabelColor: unselectedLabelColor,
              unselectedLabelStyle: unselectedLabelStyle,
            ),
          ),
          body: child,
        );
      },
    );
  }
}
