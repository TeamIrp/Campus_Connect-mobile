import 'package:campus_connect/providers/publications_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../sharedPreference/sharedpreference_constant.dart';
import '../../sharedPreference/sharedpreference_helper.dart';
import '../../widgets/comment_drawer.dart';
import '../../widgets/share_drawer.dart';
import '../../widgets/advertisement_screen.dart';
import 'publication_details.dart';

class PublicationTabScreen extends StatefulWidget {
  const PublicationTabScreen({super.key});

  @override
  State<PublicationTabScreen> createState() => _PublicationTabScreenState();
}

class _PublicationTabScreenState extends State<PublicationTabScreen> {
  final List<Map<String, dynamic>> _publications = [
    {
      "id": 1,
      "imagePath": "assets/images/publication_image1.png",
      "type": "Event",
      "publishDate": "24-12-2024",
      "likes": 12,
      "comments": 8,
      "shares": 5,
      "views": 102,
      "isLiked": false,
    },
    {
      "id": 2,
      "imagePath": "assets/images/publication_image2.png",
      "type": "News",
      "publishDate": "15-01-2025",
      "likes": 20,
      "comments": 10,
      "shares": 7,
      "views": 215,
      "isLiked": false,
    },
    {
      "id": 3,
      "imagePath": "assets/images/publication_image3.png",
      "type": "Event",
      "publishDate": "05-02-2025",
      "likes": 15,
      "comments": 6,
      "shares": 3,
      "views": 178,
      "isLiked": false,
    },
  ];

  String?  token;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      token =  await SharedPreferenceHelper.getData(SharedPreferenceConstant.TOKEN);
      print("token : $token");
      getPublicationsData(context, token!);
    });
  }

  void _toggleLike(Map<String, dynamic> pub) {
    setState(() {
      pub["isLiked"] = !(pub["isLiked"] ?? false);
      if (pub["isLiked"]) {
        pub["likes"] += 1;
      } else {
        pub["likes"] -= 1;
      }
    });
  }

  void _openCommentDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const CommentDrawer(),
    );
  }

  void _openShareDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      isScrollControlled: true,
      builder: (_) => const ShareDrawer(),
    );
  }

  void _navigateToAdvertisement(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AdvertisementScreen()),
    );
  }

  void _navigateToDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const PublicationDetailsScreen()),
    );
  }

  Widget _buildAdvertisementBox() {
    return GestureDetector(
      onTap: () => _navigateToAdvertisement(context),
      child: Container(
        width: double.infinity,
        height: 80,
        margin: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFF797979),
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: const Text(
          "Advertisements",
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildImage(Map<String, dynamic> pub) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 32,
          height: 500,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(pub["imagePath"]),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _navigateToDetails,
                child: Row(
                  children: [
                    const Text(
                      "Event title 123",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 62,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Color(0xFF1D97D4),
                        borderRadius: BorderRadius.circular(32),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        pub["type"],
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.event, color: Colors.white, size: 20),
                  const SizedBox(width: 6),
                  Text(
                    pub["publishDate"],
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.remove_red_eye_outlined,
                      color: Color(0xFF1D97D4), size: 12),
                  const SizedBox(width: 6),
                  Text(
                    '${pub["views"]}',
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF1D97D4),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF1D97D4),
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Text(
                    "View",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xFF1D97D4),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 50,
          right: 5,
          child: Column(
            children: [
              IconButton(
                icon: Icon(
                  Icons.thumb_up,
                  size: 28,
                  color:
                      pub["isLiked"] ? const Color(0xFF1D97D4) : Colors.white,
                ),
                onPressed: () => _toggleLike(pub),
              ),
              Text(
                '${pub["likes"]}',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              IconButton(
                icon: const Icon(Icons.comment, size: 28, color: Colors.white),
                onPressed: () => _openCommentDrawer(context),
              ),
              Text(
                '${pub["comments"]}',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () => _openShareDrawer(context),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SvgPicture.asset(
                    'assets/images/share_icon.svg',
                    width: 25,
                    height: 25,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '${pub["shares"]}',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            for (int i = 0; i < _publications.length; i++) ...[
              _buildImage(_publications[i]),
              if (i == 0) _buildAdvertisementBox(),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> getPublicationsData(BuildContext context, String token) async {
    final publicationsProvider = Provider.of<PublicationsProvider>(context, listen: false);
    await publicationsProvider.getPublications(context, token);
  }
}


