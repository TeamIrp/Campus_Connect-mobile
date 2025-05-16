// import 'package:campus_connect/models/home_model.dart';
// import 'package:campus_connect/providers/home_provider.dart';
// import 'package:campus_connect/sharedPreference/sharedpreference_constant.dart';
// import 'package:campus_connect/sharedPreference/sharedpreference_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';
//
// import 'gift_drawer.dart';
//
// class ProfileCard extends StatefulWidget {
//   const ProfileCard({super.key});
//
//   @override
//   State<ProfileCard> createState() => _ProfileCardState();
// }
//
// class _ProfileCardState extends State<ProfileCard> {
//   final PageController _controller = PageController(viewportFraction: 0.95);
//   static const String baseImageUrl = 'https://campusconnect-web.irpinnovative.com/';
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchUserData();
//   }
//
//   Future<void> _fetchUserData() async {
//     final token = await SharedPreferenceHelper.getData(SharedPreferenceConstant.TOKEN);
//     final userId = await SharedPreferenceHelper.getData(SharedPreferenceConstant.USER_ID);
//     if (context.mounted) {
//       await Provider.of<HomeProvider>(context, listen: false).getHome(context, userId!, token!);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<HomeProvider>(
//       builder: (context, provider, _) {
//         final data = provider.homeData?.data;
//
//         if (data == null || data.isEmpty) {
//           return _buildShimmer();
//         }
//
//         return PageView.builder(
//           controller: _controller,
//           itemCount: data.length,
//           itemBuilder: (context, index) {
//             return _buildProfileCard(data[index]);
//           },
//         );
//       },
//     );
//   }
//
//   Widget _buildProfileCard(HomeData data) {
//     final rawImage = data.profilePicture?.isNotEmpty == true
//         ? data.profilePicture!.first.picture ?? ''
//         : '';
//     final imageUrl = rawImage.isNotEmpty
//         ? (rawImage.startsWith('http') ? rawImage : '$baseImageUrl$rawImage')
//         : '';
//
//     return GestureDetector(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
//         child: Container(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 5)],
//           ),
//           child: Column(
//             children: [
//               Expanded(
//                 flex: 4,
//                 child: ClipRRect(
//                   borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//                   child: Stack(
//                     children: [
//                       SizedBox.expand(
//                         child: imageUrl.isNotEmpty
//                             ? Image.network(imageUrl, fit: BoxFit.cover)
//                             : Image.asset('assets/images/sample_image1.png', fit: BoxFit.cover),
//                       ),
//                       Positioned(
//                         bottom: 10,
//                         left: 10,
//                         right: 10,
//                         child: _buildProfileInfo(data),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: _buildBottomButtons(imageUrl),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildProfileInfo(HomeData data) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (data.subscriptionType == 'premium') const PremiumTag(),
//         if (data.subscriptionType == 'gold') const GoldTag(),
//         const SizedBox(height: 6),
//         Row(
//           children: [
//             Expanded(
//               child: Text(
//                 '${data.firstName ?? ''}, ${data.age ?? ''}',
//                 style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             if (data.verification == 1)
//               SvgPicture.asset('assets/images/green_tick.svg', height: 20, width: 20),
//           ],
//         ),
//         const SizedBox(height: 4),
//         if (data.distance != null)
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//             decoration: BoxDecoration(
//               color: Colors.white70,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Icon(Icons.location_on, size: 14),
//                 const SizedBox(width: 4),
//                 Text('${data.distance!.toStringAsFixed(1)} km away'),
//               ],
//             ),
//           ),
//         const SizedBox(height: 6),
//         const Text('About', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//         Text(
//           data.aboutcustomer?.toString() ?? '',
//           maxLines: 2,
//           overflow: TextOverflow.ellipsis,
//           style: const TextStyle(color: Colors.white),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildBottomButtons(String imagePath) {
//     return Center(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           _circleButton(
//             icon: Icons.close,
//             color: Colors.black,
//             onPressed: () {},
//           ),
//           const SizedBox(width: 16),
//           _circleButton(
//             icon: Icons.favorite,
//             color: Colors.red,
//             onPressed: () {},
//           ),
//           const SizedBox(width: 16),
//           _circleButton(
//             icon: Icons.card_giftcard,
//             color: Colors.orange,
//             onPressed: () {
//               showModalBottomSheet(
//                 context: context,
//                 isScrollControlled: true,
//                 backgroundColor: Colors.transparent,
//                 builder: (_) => const GiftDrawer(),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _circleButton({
//     required IconData icon,
//     required Color color,
//     required VoidCallback onPressed,
//   }) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         width: 56,
//         height: 56,
//         decoration: BoxDecoration(
//           color: color,
//           shape: BoxShape.circle,
//           boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
//         ),
//         child: Icon(icon, color: Colors.white, size: 24),
//       ),
//     );
//   }
//
//   Widget _buildShimmer() {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey.shade300,
//       highlightColor: Colors.grey.shade100,
//       child: ListView.builder(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         itemCount: 2,
//         itemBuilder: (context, index) => Container(
//           margin: const EdgeInsets.symmetric(vertical: 12),
//           height: 350,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class PremiumTag extends StatelessWidget {
//   const PremiumTag({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Image.asset('assets/images/crown_black.png', width: 16, height: 16),
//           const SizedBox(width: 4),
//           const Text('Premium', style: TextStyle(fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
// }
//
// class GoldTag extends StatelessWidget {
//   const GoldTag({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       decoration: BoxDecoration(color: const Color(0xFFE8B903), borderRadius: BorderRadius.circular(20)),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Image.asset('assets/images/crown_white.png', width: 16, height: 16),
//           const SizedBox(width: 4),
//           const Text('Gold', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
// }
//
//

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
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       token =
//           await SharedPreferenceHelper.getData(SharedPreferenceConstant.TOKEN);
//       userId = await SharedPreferenceHelper.getData(
//           SharedPreferenceConstant.USER_ID);
//       print("token : $token");
//       print("token : $userId");
//       getHomeData(context, userId!, token!);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<HomeProvider>(builder: (context, homeProvider, _) {
//       return PageView.builder(
//         controller: _pageController,
//         itemCount: homeProvider.homeData?.data?.length ?? 0,
//         physics: const PageScrollPhysics(),
//         itemBuilder: (context, index) {
//           final homeData = homeProvider.homeData?.data?[index];
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
//             child: _buildCard(
//               imageList: homeData?.profilePicture,
//               tag: "",
//               name: homeData?.username ?? "",
//               age: homeData?.age ?? "",
//               distance: homeData?.distance ?? 0.0,
//               verification: homeData?.verification ?? 0,
//               about: homeData?.aboutcustomer ?? "",
//             ),
//           );
//         },
//       );
//     });
//   }
//
//   Widget _buildCard({
//     required List<ProfilePicture>? imageList,
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
//                 borderRadius:
//                     const BorderRadius.vertical(top: Radius.circular(20)),
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
//                               const Icon(Icons.location_on,
//                                   color: Colors.white, size: 16),
//                               const SizedBox(width: 4),
//                               Text('$distance km away',
//                                   style: const TextStyle(color: Colors.white)),
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
//   Future<void> getHomeData(
//       BuildContext context, String userId, String token) async {
//     final homeProvider = Provider.of<HomeProvider>(context, listen: false);
//     homeProvider.getHome(context, userId, token);
//   }
// }
//
// class PremiumTag extends StatelessWidget {
//   const PremiumTag({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//       decoration: BoxDecoration(
//           color: Color(0xFFE8B903), borderRadius: BorderRadius.circular(20)),
//       child: Row(children: [
//         Image.asset('assets/images/crown_white.png', width: 16, height: 16),
//         const SizedBox(width: 4),
//         const Text('Gold',
//             style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
//       ]),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:campus_connect/models/home_model.dart';
import 'package:campus_connect/providers/home_provider.dart';
import 'package:campus_connect/sharedPreference/sharedpreference_constant.dart';
import 'package:campus_connect/sharedPreference/sharedpreference_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'gift_drawer.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  final PageController _controller = PageController(viewportFraction: 0.95);
  static const String _baseImageUrl =
      "https://campusconnect-web.irpinnovative.com/";

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final token =
        await SharedPreferenceHelper.getData(SharedPreferenceConstant.TOKEN);
    final userId =
        await SharedPreferenceHelper.getData(SharedPreferenceConstant.USER_ID);
    if (context.mounted) {
      await Provider.of<HomeProvider>(context, listen: false)
          .getHome(context, userId!, token!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, _) {
        final data = provider.homeData?.data;

        if (data == null || data.isEmpty) {
          return _buildShimmer();
        }

        return PageView.builder(
          controller: _controller,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return _buildProfileCard(data[index]);
          },
        );
      },
    );
  }

  Widget _buildProfileCard(HomeData data) {
    final imageUrl = data.profilePicture?.isNotEmpty == true
        ? _baseImageUrl + (data.profilePicture!.first.picture ?? '')
        : '';

    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 5)],
          ),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                  child: Stack(
                    children: [
                      SizedBox.expand(
                        child: imageUrl.isNotEmpty
                            ? Image.network(imageUrl, fit: BoxFit.cover)
                            : Image.asset('assets/images/sample_image1.png',
                                fit: BoxFit.cover),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: _buildProfileInfo(data),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: _buildBottomButtons(imageUrl),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo(HomeData data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (data.subscriptionType == 'Premium') const PremiumTag(),
        if (data.subscriptionType == 'Golden') const GoldTag(),
        const SizedBox(height: 6),
        Row(
          children: [
            Expanded(
              child: Text(
                '${data.firstName ?? ''} ${data.lastName ?? ''}, ${data.age ?? ''}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 6),
            if (data.verification == 1)
              SvgPicture.asset('assets/images/green_tick.svg', height: 20, width: 20),
            const SizedBox(width: 6),
            if (data.distance != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.location_on, size: 11),
                    const SizedBox(width: 4),
                    Text(
                      '${data.distance!.toStringAsFixed(1)} km away',
                      style: TextStyle(fontSize: 11),
                    ),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(height: 6),
        const Text('About',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(
          data.aboutcustomer?.toString() ?? '',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  Widget _buildBottomButtons(String imagePath) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _circleButton(
            icon: Icons.close,
            color: Colors.black,
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          _circleButton(
            icon: Icons.favorite,
            color: Color(0xFF1D97D4),
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          _circleButton(
            icon: Icons.card_giftcard,
            color: Colors.orange,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (_) => const GiftDrawer(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _circleButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 2,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

class PremiumTag extends StatelessWidget {
  const PremiumTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/crown_black.png', width: 16, height: 16),
          const SizedBox(width: 4),
          const Text('Premium', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class GoldTag extends StatelessWidget {
  const GoldTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
          color: const Color(0xFFE8B903),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/crown_white.png', width: 16, height: 16),
          const SizedBox(width: 4),
          const Text('Gold',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
