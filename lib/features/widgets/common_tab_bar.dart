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
    this.showBackArrow,
    this.leadingIcon,
    this.isTabScrollable,
    this.tabIndicator,
    this.enableOffsetValue,
  });

  final List<PageRouteInfo<dynamic>> tabRoutes;
  final List<Widget> tabTexts;
  final Color dividerColor;
  final TextStyle labelStyle;
  final Color unselectedLabelColor;
  final TextStyle unselectedLabelStyle;
  bool? showBackArrow;
  Widget? leadingIcon;
  bool? isTabScrollable;
  Decoration? tabIndicator;
  Offset? enableOffsetValue;

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: tabRoutes,
      builder: (context, child, controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: showBackArrow ?? true,
            leading: leadingIcon,
            title: Transform.translate(
              offset: enableOffsetValue ?? const Offset(0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  isScrollable: isTabScrollable ?? false,
                  controller: controller,
                  indicator: tabIndicator ??
                      const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.deepPurple,
                            width: 2.0,
                          ),
                        ),
                      ),
                  tabs: tabTexts,
                  dividerColor: dividerColor,
                  labelStyle: labelStyle,
                  unselectedLabelColor: unselectedLabelColor,
                  unselectedLabelStyle: unselectedLabelStyle,
                  labelPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
          body: child,
        );
      },
    );
  }
}
