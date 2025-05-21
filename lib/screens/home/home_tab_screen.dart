// import 'package:flutter/material.dart';
// import '../../widgets/filter_screen.dart';
// import '../../widgets/map_view_screen.dart';
// import 'tabs/home_tab1.dart';
// import 'tabs/home_tab2.dart';
//
// class HomeTabScreen extends StatefulWidget {
//   const HomeTabScreen({super.key});
//
//   @override
//   State<HomeTabScreen> createState() => _HomeTabScreenState();
// }
//
// class _HomeTabScreenState extends State<HomeTabScreen> {
//   int currentTabIndex = 0;
//
//   void switchToTab(int index) {
//     if (!mounted) return;
//     setState(() => currentTabIndex = index);
//   }
//
//   Future<void> openFilterScreen(BuildContext context) async {
//     final result = await Navigator.push<bool>(
//       context,
//       MaterialPageRoute(builder: (_) => const FilterScreen()),
//     );
//     if (result == true) {
//       switchToTab(1); // Switch to HomeTab2
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Widget tabContent;
//     switch (currentTabIndex) {
//       case 1:
//         tabContent = HomeTab2(onBackPressed: () => switchToTab(0));
//         break;
//       case 2:
//         tabContent = MapViewScreen(onBackPressed: () => switchToTab(0));
//         break;
//       default:
//         tabContent = HomeTab1(
//           onFilterTap: () => openFilterScreen(context),
//           onMapViewTap: () => switchToTab(2),
//         );
//     }
//
//     return Scaffold(body: tabContent);
//   }
// }



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/home_provider.dart';
import '../../widgets/filter_screen.dart';
import '../../widgets/map_view_screen.dart';
import 'tabs/home_tab1.dart';
import 'tabs/home_tab2.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  Future<void> _openFilterScreen(BuildContext context) async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(builder: (_) => const FilterScreen()),
    );
    if (result == true) {
      context.read<HomeProvider>().setHomeTabIndex(1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hp = context.watch<HomeProvider>();
    final current = hp.homeTabIndex;

    Widget content;
    switch (current) {
      case 1:
        content = HomeTab2(
          onBackPressed: () => hp.setHomeTabIndex(0),
        );
        break;
      case 2:
        content = MapViewScreen(
          onBackPressed: () => hp.setHomeTabIndex(0),
        );
        break;
      default:
        content = HomeTab1(
          onFilterTap: () => _openFilterScreen(context),
          onMapViewTap: () => hp.setHomeTabIndex(2),
        );
    }
    return Scaffold(body: content);
  }
}
