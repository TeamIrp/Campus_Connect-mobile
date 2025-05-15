// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../providers/home_provider.dart';
// import '../../../widgets/notification_screen.dart';
// import '../widgets/profile_card.dart';
//
// class HomeTab1 extends StatefulWidget {
//   final VoidCallback onFilterTap;
//   final VoidCallback onMapViewTap;
//
//   const HomeTab1({
//     Key? key,
//     required this.onFilterTap,
//     required this.onMapViewTap,
//   }) : super(key: key);
//
//   @override
//   State<HomeTab1> createState() => _HomeTab1State();
// }
//
// class _HomeTab1State extends State<HomeTab1> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: const Color(0xFF1D97D4),
//         elevation: 1,
//         centerTitle: true,
//         flexibleSpace: SafeArea(
//           child: Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Selector<HomeProvider, String>(
//                   selector: (_, prov) => prov.city,
//                   builder: (context, city, child) => Row(
//                     children: [
//                       Text(
//                         city,
//                         style: const TextStyle(
//                           fontFamily: 'Inter',
//                           fontWeight: FontWeight.w500,
//                           fontSize: 16,
//                           color: Colors.white,
//                         ),
//                       ),
//                       const SizedBox(width: 4),
//                       const Icon(
//                         Icons.location_on,
//                         color: Colors.white,
//                         size: 21,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Text(
//                   'Campus Connect',
//                   style: TextStyle(
//                     fontFamily: 'Inter',
//                     fontWeight: FontWeight.w700,
//                     fontSize: 20,
//                     color: Colors.white,
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).push(
//                       PageRouteBuilder(
//                         transitionDuration: const Duration(milliseconds: 250),
//                         pageBuilder: (_, __, ___) => const NotificationScreen(),
//                         transitionsBuilder: (_, anim, __, child) =>
//                             FadeTransition(opacity: anim, child: child),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     width: 40,
//                     height: 40,
//                     padding: const EdgeInsets.fromLTRB(7, 4, 6, 4),
//                     decoration: const BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                     ),
//                     child: const Center(
//                       child: Icon(
//                         Icons.notifications,
//                         size: 24,
//                         color: Color(0xFF1D97D4),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             color: const Color(0xFF1D97D4),
//             padding: const EdgeInsets.all(15),
//             child: Container(
//               height: 52,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Color.fromRGBO(0, 0, 0, 0.25),
//                     blurRadius: 4,
//                   ),
//                 ],
//               ),
//               child: Consumer<HomeProvider>(
//                 builder: (context, prov, child) => TextField(
//                   onChanged: prov.setSearchQuery,
//                   decoration: const InputDecoration(
//                     contentPadding: EdgeInsets.symmetric(vertical: 14),
//                     isDense: true,
//                     hintText: 'Search my_profile',
//                     hintStyle: TextStyle(
//                       fontFamily: 'Inter',
//                       fontSize: 14,
//                       color: Color(0xFFDCDCDC),
//                     ),
//                     border: InputBorder.none,
//                     prefixIcon:
//                         Icon(Icons.search, size: 28, color: Color(0xFFDCDCDC)),
//                   ),
//                   style: const TextStyle(
//                     fontFamily: 'Inter',
//                     fontSize: 14,
//                     color: Colors.black,
//                   ),
//                   cursorColor: const Color(0xFF1D97D4),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(height: 5),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: Row(
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: widget.onFilterTap,
//                   icon: const Icon(Icons.tune, size: 18, color: Colors.white),
//                   label: const Text(
//                     'Filter',
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.white,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF1D97D4),
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     minimumSize: const Size(78, 32),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(32),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton.icon(
//                   onPressed: widget.onMapViewTap,
//                   icon: const Icon(Icons.map, size: 18, color: Colors.white),
//                   label: const Text(
//                     'Map View',
//                     style: TextStyle(
//                       fontFamily: 'Inter',
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                       color: Colors.white,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF1D97D4),
//                     padding: const EdgeInsets.symmetric(horizontal: 15),
//                     minimumSize: const Size(78, 32),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(32),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 5),
//           const Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(bottom: 10),
//               child: Column(
//                 children: [
//                   Expanded(child: ProfileCard()),
//                   SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/home_provider.dart';
import '../../../sharedPreference/sharedpreference_constant.dart';
import '../../../sharedPreference/sharedpreference_helper.dart';
import '../../../widgets/notification_screen.dart';
import '../widgets/profile_card.dart';

class HomeTab1 extends StatefulWidget {
  final VoidCallback onFilterTap;
  final VoidCallback onMapViewTap;

  const HomeTab1({
    Key? key,
    required this.onFilterTap,
    required this.onMapViewTap,
  }) : super(key: key);

  @override
  State<HomeTab1> createState() => _HomeTab1State();
}

class _HomeTab1State extends State<HomeTab1> {
  final TextEditingController _searchController = TextEditingController();
  String? userId, token;

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((_) async {
  //     token =
  //         await SharedPreferenceHelper.getData(SharedPreferenceConstant.TOKEN);
  //     userId = await SharedPreferenceHelper.getData(
  //         SharedPreferenceConstant.USER_ID);
  //     print("token : $token");
  //     print("token : $userId");
  //     getHomeData(context, userId!, token!);
  //   });
  // }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF1D97D4),
        elevation: 1,
        centerTitle: true,
        flexibleSpace: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Text(
                      'City',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 21,
                    ),
                  ],
                ),
                const Text(
                  'Campus Connect',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 250),
                        pageBuilder: (_, __, ___) => const NotificationScreen(),
                        transitionsBuilder: (_, anim, __, child) =>
                            FadeTransition(opacity: anim, child: child),
                      ),
                    );
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.fromLTRB(7, 4, 6, 4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.notifications,
                        size: 24,
                        color: Color(0xFF1D97D4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: const Color(0xFF1D97D4),
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 14),
                  isDense: true,
                  hintText: 'Search my_profile',
                  hintStyle: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: Color(0xFFDCDCDC),
                  ),
                  border: InputBorder.none,
                  prefixIcon:
                      Icon(Icons.search, size: 28, color: Color(0xFFDCDCDC)),
                ),
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: Colors.black,
                ),
                cursorColor: Color(0xFF1D97D4),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                ElevatedButton.icon(
                  onPressed: widget.onFilterTap,
                  icon: const Icon(Icons.tune, size: 18, color: Colors.white),
                  label: const Text(
                    'Filter',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D97D4),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    minimumSize: const Size(78, 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: widget.onMapViewTap,
                  icon: const Icon(Icons.map, size: 18, color: Colors.white),
                  label: const Text(
                    'Map View',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1D97D4),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    minimumSize: const Size(78, 32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  Expanded(child: ProfileCard()),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> getHomeData(
  //     BuildContext context, String userId, String token) async {
  //   final homeProvider = Provider.of<HomeProvider>(context, listen: false);
  //   homeProvider.getHome(context, userId, token);
  // }
}
