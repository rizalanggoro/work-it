import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:work_it/ui/pages/home/controller.dart';
import 'package:work_it/ui/pages/home/modules/dashboard/view.dart';
import 'package:work_it/ui/pages/home/modules/profile/view.dart';
import 'package:work_it/ui/pages/home/modules/transaction/view.dart';

class _NavItem {
  final String title;
  final IconData icon;
  final Widget view;

  const _NavItem({
    required this.title,
    required this.icon,
    required this.view,
  });
}

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const navItems = [
      _NavItem(
        title: 'Dashboard',
        icon: Icons.dashboard_rounded,
        view: HomeDashboardView(),
      ),
      _NavItem(
        title: 'Transaction',
        icon: Icons.wallet_rounded,
        view: HomeTransactionView(),
      ),
      _NavItem(
        title: 'Profile',
        icon: Icons.person_rounded,
        view: HomeProfileView(),
      ),
    ];

    return Scaffold(
      bottomNavigationBar: ObxValue(
        (navigationIndex) => NavigationBar(
          selectedIndex: navigationIndex.value,
          destinations: [
            for (var item in navItems)
              NavigationDestination(
                icon: Icon(item.icon),
                label: item.title,
              ),
          ],
          onDestinationSelected: (value) => controller.changeNavigation(value),
        ),
        controller.navigationIndex,
      ),
      body: ObxValue(
        (navigationIndex) => navItems[navigationIndex.value].view,
        controller.navigationIndex,
      ),
    );
  }
}
