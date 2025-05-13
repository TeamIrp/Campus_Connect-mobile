// import 'package:campus_connect/models/home_model.dart';
// import 'package:campus_connect/sharedPreference/sharedpreference_constant.dart';
// import 'package:campus_connect/sharedPreference/sharedpreference_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import '../../../providers/home_provider.dart';
// import 'gift_drawer.dart';
//
// class ProfileCard extends StatefulWidget {
//   const ProfileCard({Key? key}) : super(key: key);
//
//   @override
//   State<ProfileCard> createState() => _ProfileCardState();
// }
//
// class _ProfileCardState extends State<ProfileCard> {
//   final PageController _pageController = PageController(viewportFraction: 0.95);
//   String? userId, token;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_)async{
//       token = await SharedPreferenceHelper.getData(SharedPreferenceConstant.TOKEN);
//       userId = await SharedPreferenceHelper.getData(SharedPreferenceConstant.USER_ID);
//       print("token : $token");
//       print("token : $userId");
//      getHomeData(context, userId!, token!);
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<HomeProvider>(
//       builder: (context, homeProvider, _) {
//
//         return PageView.builder(
//           controller: _pageController,
//           itemCount: homeProvider.homeData?.data?.length ?? 0,
//           physics: const PageScrollPhysics(),
//           itemBuilder: (context, index) {
//            final homeData = homeProvider.homeData?.data?[index];
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//               child: _buildCard(
//                 imageList: homeData?.profilePicture,
//                 tag: "",
//                 name: homeData?.username ?? "",
//                 age:  homeData?.age ?? "",
//                 distance:  homeData?.distance ?? 0.0,
//                 verification:  homeData?.verification ?? 0,
//                 about:  homeData?.aboutcustomer ?? "",
//               ),
//             );
//           },
//         );
//       }
//     );
//   }
//
//   Widget _buildCard({
//     required  List<ProfilePicture>? imageList,
//     required String tag,
//     required String name,
//     required String age,
//     required double distance,
//     required int verification,
//     required String about,
//   }) {
//     return GestureDetector(
//       // onTap: () {
//       //   Navigator.of(context).push(MaterialPageRoute(
//       //       builder: (_) => PageDetailsScreen(imagePath: imagePath)));
//       // },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: const [
//             BoxShadow(color: Color(0x66000000), blurRadius: 4.5),
//           ],
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               flex: 4,
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//                 child: Stack(
//                   children: [
//                     // Positioned.fill(
//                     //   child: Image.network(
//                     //     imagePath,
//                     //     fit: BoxFit.cover,
//                     //     errorBuilder: (_, __, ___) => Image.asset(
//                     //       'assets/images/sample_image1.png',
//                     //       fit: BoxFit.cover,
//                     //     ),
//                     //   ),
//                     // ),
//                     Positioned(
//                       left: 10,
//                       bottom: 10,
//                       right: 10,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           if (tag == 'premium') const PremiumTag(),
//                           if (tag == 'gold') const GoldTag(),
//                           const SizedBox(height: 6),
//                           Row(
//                             children: [
//                               Text(
//                                 '$name, $age',
//                                 style: const TextStyle(
//                                   fontSize: 22,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               const SizedBox(width: 8),
//                               if (verification == 1)
//                                 SvgPicture.asset(
//                                   'assets/images/green_tick.svg',
//                                   width: 24,
//                                   height: 24,
//                                 ),
//                             ],
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             'About: $about',
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 12,
//                             ),
//                           ),
//                           const SizedBox(height: 6),
//                           Row(
//                             children: [
//                               const Icon(Icons.location_on, color: Colors.white, size: 16),
//                               const SizedBox(width: 4),
//                               Text('$distance km away', style: const TextStyle(color: Colors.white)),
//                             ],
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     _circleButton(Colors.black, Icons.close, () {}),
//                     const SizedBox(width: 16),
//                     _circleButton(Colors.red, Icons.favorite, () {}),
//                     const SizedBox(width: 16),
//                     _circleButton(Colors.orange, Icons.card_giftcard, () {
//                       showModalBottomSheet(
//                         context: context,
//                         isScrollControlled: true,
//                         backgroundColor: Colors.transparent,
//                         builder: (_) => const GiftDrawer(),
//                       );
//                     }),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _circleButton(Color color, IconData icon, VoidCallback onPressed) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         width: 60,
//         height: 60,
//         decoration: BoxDecoration(
//           color: color,
//           shape: BoxShape.circle,
//           boxShadow: const [BoxShadow(blurRadius: 6, color: Colors.black26)],
//         ),
//         child: Icon(icon, color: Colors.white, size: 28),
//       ),
//     );
//   }
//
//   Future<void> getHomeData(BuildContext context, String userId, String token) async{
//     final homeProvider = Provider.of<HomeProvider>(context, listen: false);
//     homeProvider.getHome(context, userId, token);
//   }
// }
//
// class PremiumTag extends StatelessWidget {
//   const PremiumTag({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
//       child: Row(children: [
//         Image.asset('assets/images/crown_black.png', width: 16, height: 16),
//         const SizedBox(width: 4),
//         const Text('Premium', style: TextStyle(fontWeight: FontWeight.bold)),
//       ]),
//     );
//   }
// }
//
// class GoldTag extends StatelessWidget {
//   const GoldTag({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//       decoration: BoxDecoration(color: Color(0xFFE8B903), borderRadius: BorderRadius.circular(20)),
//       child: Row(children: [
//         Image.asset('assets/images/crown_white.png', width: 16, height: 16),
//         const SizedBox(width: 4),
//         const Text('Gold', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
//       ]),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../providers/home_provider.dart';
// import '../profile_detail_screen.dart';
// import 'gift_drawer.dart';
//
// class ProfileCard extends StatefulWidget {
//   const ProfileCard({Key? key}) : super(key: key);
//
//   @override
//   State<ProfileCard> createState() => _ProfileCardState();
// }
//
// class _ProfileCardState extends State<ProfileCard> {
//   final PageController _pageController = PageController(viewportFraction: 0.95);
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _loadAndCallHome();
//     });
//   }
//
//   Future<void> _loadAndCallHome() async {
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//     final userId = prefs.getString('userId');
//
//     if (token == null || userId == null) {
//       print("Token or userId not found in SharedPreferences");
//       return;
//     }
//
//     await getHome(context, userId, token);
//   }
//
//   Future<void> getHome(BuildContext context, String userId, String token) async {
//     final homeProvider = Provider.of<HomeProvider>(context, listen: false);
//     await homeProvider.getHome(context, userId, token);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<HomeProvider>(
//       builder: (context, homeProv, child) {
//         if (homeProv.isLoading) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         final tag = homeProv.tags;
//         final name = homeProv.name;
//         final age = homeProv.age;
//         final distance = homeProv.distance;
//         final verification = homeProv.verification;
//         final about = homeProv.aboutUser;
//         final imagePath = homeProv.imagePath.isNotEmpty
//             ? 'https://campusconnect-web.irpinnovative.com/${homeProv.imagePath}'
//             : 'assets/images/sample_image1.png';
//
//         return PageView.builder(
//           controller: _pageController,
//           itemCount: 1,
//           physics: const PageScrollPhysics(),
//           itemBuilder: (context, index) => Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//             child: _buildCard(
//               imagePath: imagePath,
//               tag: tag,
//               name: name,
//               age: age,
//               distance: distance,
//               verification: verification,
//               about: about,
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildCard({
//     required String imagePath,
//     required String tag,
//     required String name,
//     required String age,
//     required String distance,
//     required int verification,
//     required String about,
//   }) {
//     return GestureDetector(
//       behavior: HitTestBehavior.translucent,
//       onTapUp: (details) {
//         final box = context.findRenderObject() as RenderBox;
//         final local = box.globalToLocal(details.globalPosition);
//         if (local.dy < MediaQuery.of(context).size.height * 0.65) {
//           Navigator.of(context).push(
//             PageRouteBuilder(
//               pageBuilder: (_, __, ___) =>
//                   PageDetailsScreen(imagePath: imagePath),
//               transitionDuration: Duration.zero,
//               reverseTransitionDuration: Duration.zero,
//             ),
//           );
//         }
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: const [
//             BoxShadow(color: Color(0x66000000), blurRadius: 4.5)
//           ],
//         ),
//         child: Column(
//           children: [
//             // IMAGE + OVERLAY
//             Expanded(
//               flex: 4,
//               child: ClipRRect(
//                 borderRadius:
//                     const BorderRadius.vertical(top: Radius.circular(20)),
//                 child: LayoutBuilder(builder: (c, constr) {
//                   return Stack(
//                     children: [
//                       SizedBox.expand(
//                         child: Image.network(
//                           imagePath,
//                           fit: BoxFit.cover,
//                           // shows a spinner while loading
//                           loadingBuilder: (context, child, progress) {
//                             if (progress == null) return child;
//                             return const Center(
//                                 child: CircularProgressIndicator());
//                           },
//                           // fallback to the local placeholder on error
//                           errorBuilder: (context, error, stack) {
//                             return Image.asset(
//                               'assets/images/sample_image1.png',
//                               fit: BoxFit.cover,
//                             );
//                           },
//                         ),
//                       ),
//
//                       Positioned(
//                         left: constr.maxWidth * 0.03,
//                         right: constr.maxWidth * 0.03,
//                         bottom: constr.maxHeight * 0.03,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             if (tag == 'premium') const PremiumTag(),
//                             if (tag == 'gold') const GoldTag(),
//                             const SizedBox(height: 6),
//                             Stack(
//                               children: [
//                                 Row(
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Flexible(
//                                       child: Text(
//                                         '$name, $age',
//                                         style: const TextStyle(
//                                           fontFamily: 'Inter',
//                                           fontWeight: FontWeight.w700,
//                                           fontSize: 24,
//                                           color: Colors.white,
//                                         ),
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                     ),
//                                     const SizedBox(width: 8),
//                                     if (verification == 1)
//                                       SvgPicture.asset(
//                                         'assets/images/green_tick.svg',
//                                         width: 24,
//                                         height: 24,
//                                       ),
//                                   ],
//                                 ),
//                                 Positioned(
//                                   right: 0,
//                                   top: 0,
//                                   bottom: 0,
//                                   child: Container(
//                                     width: 90,
//                                     height: 25,
//                                     decoration: BoxDecoration(
//                                       color: const Color(0xFFFAE8FF),
//                                       borderRadius: BorderRadius.circular(20),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         const Icon(
//                                           Icons.location_on,
//                                           size: 12,
//                                           color: Colors.black,
//                                         ),
//                                         const SizedBox(width: 4),
//                                         Text(
//                                           '$distance Away',
//                                           style: const TextStyle(
//                                             fontSize: 10,
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 4),
//                             const Text(
//                               'About',
//                               style: TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 12,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             const SizedBox(height: 2),
//                             Text(
//                               about,
//                               style: const TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w300,
//                                 fontSize: 12,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   );
//                 }),
//               ),
//             ),
//
//             // BUTTON BAR
//             Expanded(
//               flex: 1,
//               child: Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     _circleButton(
//                       backgroundColor: Colors.black,
//                       icon: Icons.close,
//                       iconSize: 18,
//                       iconColor: Colors.white,
//                       onPressed: () => Navigator.of(context).push(
//                         PageRouteBuilder(
//                           pageBuilder: (_, __, ___) =>
//                               PageDetailsScreen(imagePath: imagePath),
//                           transitionDuration: Duration.zero,
//                           reverseTransitionDuration: Duration.zero,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(width: 16),
//                     _circleButton(
//                       backgroundColor: const Color(0xFF1D97D4),
//                       icon: Icons.favorite,
//                       iconSize: 25,
//                       iconColor: Colors.white,
//                       onPressed: () {},
//                     ),
//                     const SizedBox(width: 16),
//                     _circleButton(
//                       backgroundColor: const Color(0xFFFF9500),
//                       icon: Icons.card_giftcard,
//                       iconSize: 25,
//                       iconColor: Colors.white,
//                       onPressed: () => showModalBottomSheet(
//                         context: context,
//                         isScrollControlled: true,
//                         backgroundColor: Colors.transparent,
//                         builder: (_) => const GiftDrawer(),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _circleButton({
//     required Color backgroundColor,
//     required IconData icon,
//     required double iconSize,
//     required Color iconColor,
//     required VoidCallback onPressed,
//   }) =>
//       GestureDetector(
//         onTap: onPressed,
//         child: Container(
//           width: 60,
//           height: 60,
//           decoration: BoxDecoration(
//             color: backgroundColor,
//             shape: BoxShape.circle,
//             boxShadow: const [
//               BoxShadow(
//                   color: Color(0x66000000), blurRadius: 8, offset: Offset(0, 4))
//             ],
//           ),
//           child: Center(child: Icon(icon, size: iconSize, color: iconColor)),
//         ),
//       );
// }
//
// class PremiumTag extends StatelessWidget {
//   const PremiumTag({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       height: 28,
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(28)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset('assets/images/crown_black.png', width: 15, height: 15),
//           const SizedBox(width: 4),
//           const Text(
//             'Premium',
//             style: TextStyle(
//               fontFamily: 'Inter',
//               fontWeight: FontWeight.w500,
//               fontSize: 14,
//               color: Colors.black,
//               height: 1.0,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class GoldTag extends StatelessWidget {
//   const GoldTag({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 80,
//       height: 28,
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//           color: const Color(0xFFE8B903),
//           borderRadius: BorderRadius.circular(28)),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset('assets/images/crown_white.png', width: 18, height: 18),
//           const SizedBox(width: 4),
//           const Text(
//             'Gold',
//             style: TextStyle(
//               fontFamily: 'Inter',
//               fontWeight: FontWeight.w500,
//               fontSize: 14,
//               color: Colors.white,
//               height: 1.0,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../../providers/home_provider.dart';
import '../profile_detail_screen.dart';
import 'gift_drawer.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  final PageController _pageController = PageController(viewportFraction: 0.95);

  @override
  Widget build(BuildContext context) {
    final tag = context.select((HomeProvider p) => p.tags);
    final name = context.select((HomeProvider p) => p.name);
    final age = context.select((HomeProvider p) => p.age);
    final distance = context.select((HomeProvider p) => p.distance);
    final imagePath = context.select((HomeProvider p) => p.imagePath);
    final verification = context.select((HomeProvider p) => p.verification);
    final aboutUser = context.select((HomeProvider p) => p.aboutUser);

    final user = {
      'tag': tag,
      'name': name,
      'age': age,
      'distance': distance,
      'verification': verification,
      'about': aboutUser,
    };

    return PageView.builder(
      controller: _pageController,
      itemCount: 1,
      physics: const PageScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (ctx, i) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: _buildCard(imagePath, user),
      ),
    );
  }

  Widget _buildCard(String imagePath, Map<String, dynamic> user) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapUp: (details) {
        final RenderBox box = context.findRenderObject() as RenderBox;
        final localPosition = box.globalToLocal(details.globalPosition);
        final buttonAreaTop = MediaQuery.of(context).size.height * 0.65;
        if (localPosition.dy < buttonAreaTop) {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) =>
                  PageDetailsScreen(imagePath: imagePath),
              transitionDuration: Duration.zero,
              reverseTransitionDuration: Duration.zero,
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Color(0x66000000), blurRadius: 4.5),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                child: LayoutBuilder(
                  builder: (c, constr) => Stack(
                    children: [
                      SizedBox.expand(
                        child: Image.asset(
                          imagePath.isNotEmpty
                              ? imagePath
                              : 'assets/images/sample_image1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: constr.maxWidth * 0.03,
                        right: constr.maxWidth * 0.03,
                        bottom: constr.maxHeight * 0.03,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (user['tag'] == 'premium')
                              const PremiumTag()
                            else if (user['tag'] == 'gold')
                              const GoldTag(),
                            const SizedBox(height: 6),
                            Stack(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        '${user['name']}, ${user['age']}',
                                        style: const TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24,
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    if (user['verification'] == 1)
                                      SvgPicture.asset(
                                        'assets/images/green_tick.svg',
                                        width: 24,
                                        height: 24,
                                      ),
                                  ],
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  bottom: 0,
                                  child: Container(
                                    width: 90,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFAE8FF),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          size: 12,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${user['distance']} Away',
                                          style: const TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              'About',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              user['about'] ?? '',
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _circleButton(
                      backgroundColor: Colors.black,
                      icon: Icons.close,
                      iconSize: 18,
                      iconColor: Colors.white,
                      onPressed: () => Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) =>
                              PageDetailsScreen(imagePath: imagePath),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    _circleButton(
                      backgroundColor: const Color(0xFF1D97D4),
                      icon: Icons.favorite,
                      iconSize: 25,
                      iconColor: Colors.white,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 16),
                    _circleButton(
                      backgroundColor: const Color(0xFFFF9500),
                      icon: Icons.card_giftcard,
                      iconSize: 25,
                      iconColor: Colors.white,
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => const GiftDrawer(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleButton({
    required Color backgroundColor,
    required IconData icon,
    required double iconSize,
    required Color iconColor,
    required VoidCallback onPressed,
  }) =>
      GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: Color(0x66000000),
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Center(child: Icon(icon, size: iconSize, color: iconColor)),
        ),
      );
}

class PremiumTag extends StatelessWidget {
  const PremiumTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/crown_black.png', width: 15, height: 15),
          const SizedBox(width: 4),
          const Text(
            'Premium',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}

class GoldTag extends StatelessWidget {
  const GoldTag({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFE8B903),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/crown_white.png', width: 18, height: 18),
          const SizedBox(width: 4),
          const Text(
            'Gold',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.white,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
