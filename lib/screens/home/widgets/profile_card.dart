import 'package:campus_connect/models/home_model.dart';
import 'package:campus_connect/sharedPreference/sharedpreference_constant.dart';
import 'package:campus_connect/sharedPreference/sharedpreference_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  String? userId, token;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      token = await SharedPreferenceHelper.getData(SharedPreferenceConstant.TOKEN);
      userId = await SharedPreferenceHelper.getData(SharedPreferenceConstant.USER_ID);
      print("token : $token");
      print("token : $userId");
     getHomeData(context, userId!, token!);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, _) {

        return PageView.builder(
          controller: _pageController,
          itemCount: homeProvider.homeData?.data?.length ?? 0,
          physics: const PageScrollPhysics(),
          itemBuilder: (context, index) {
           final homeData = homeProvider.homeData?.data?[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: _buildCard(
                imageList: homeData?.profilePicture,
                tag: "",
                name: homeData?.username ?? "",
                age:  homeData?.age ?? "",
                distance:  homeData?.distance ?? 0.0,
                verification:  homeData?.verification ?? 0,
                about:  homeData?.aboutcustomer ?? "",
              ),
            );
          },
        );
      }
    );
  }

  Widget _buildCard({
    required  List<ProfilePicture>? imageList,
    required String tag,
    required String name,
    required String age,
    required double distance,
    required int verification,
    required String about,
  }) {
    return GestureDetector(
      // onTap: () {
      //   Navigator.of(context).push(MaterialPageRoute(
      //       builder: (_) => PageDetailsScreen(imagePath: imagePath)));
      // },
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
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
                child: Stack(
                  children: [
                    // Positioned.fill(
                    //   child: Image.network(
                    //     imagePath,
                    //     fit: BoxFit.cover,
                    //     errorBuilder: (_, __, ___) => Image.asset(
                    //       'assets/images/sample_image1.png',
                    //       fit: BoxFit.cover,
                    //     ),
                    //   ),
                    // ),
                    Positioned(
                      left: 10,
                      bottom: 10,
                      right: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (tag == 'premium') const PremiumTag(),
                          if (tag == 'gold') const GoldTag(),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Text(
                                '$name, $age',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 8),
                              if (verification == 1)
                                SvgPicture.asset(
                                  'assets/images/green_tick.svg',
                                  width: 24,
                                  height: 24,
                                ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'About: $about',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.location_on, color: Colors.white, size: 16),
                              const SizedBox(width: 4),
                              Text('$distance km away', style: const TextStyle(color: Colors.white)),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _circleButton(Colors.black, Icons.close, () {}),
                    const SizedBox(width: 16),
                    _circleButton(Colors.red, Icons.favorite, () {}),
                    const SizedBox(width: 16),
                    _circleButton(Colors.orange, Icons.card_giftcard, () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => const GiftDrawer(),
                      );
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _circleButton(Color color, IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: const [BoxShadow(blurRadius: 6, color: Colors.black26)],
        ),
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    );
  }

  Future<void> getHomeData(BuildContext context, String userId, String token) async{
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    homeProvider.getHome(context, userId, token);
  }
}

class PremiumTag extends StatelessWidget {
  const PremiumTag({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(children: [
        Image.asset('assets/images/crown_black.png', width: 16, height: 16),
        const SizedBox(width: 4),
        const Text('Premium', style: TextStyle(fontWeight: FontWeight.bold)),
      ]),
    );
  }
}

class GoldTag extends StatelessWidget {
  const GoldTag({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: Color(0xFFE8B903), borderRadius: BorderRadius.circular(20)),
      child: Row(children: [
        Image.asset('assets/images/crown_white.png', width: 16, height: 16),
        const SizedBox(width: 4),
        const Text('Gold', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      ]),
    );
  }
}
