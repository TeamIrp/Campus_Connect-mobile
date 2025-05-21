// import 'package:campus_connect/screens/publication/publication_details.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';
// import 'package:shimmer/shimmer.dart';
//
// import '../../models/publications_model.dart';
// import '../../providers/publications_provider.dart';
// import '../../sharedPreference/sharedpreference_constant.dart';
// import '../../sharedPreference/sharedpreference_helper.dart';
// import '../../widgets/advertisement_screen.dart';
// import '../../widgets/comment_drawer.dart';
// import '../../widgets/share_drawer.dart';
//
// class PublicationTabScreen extends StatefulWidget {
//   const PublicationTabScreen({Key? key}) : super(key: key);
//
//   @override
//   State<PublicationTabScreen> createState() => _PublicationTabScreenState();
// }
//
// class _PublicationTabScreenState extends State<PublicationTabScreen> {
//   bool isLiked = false;
//   int likeCount = 100, commentCount = 25, shareCount = 10;
//
//   void _toggleLike() {
//     setState(() {
//       isLiked = !isLiked;
//       likeCount += isLiked ? 1 : -1;
//     });
//   }
//
//   void _openBottomSheet(Widget sheet) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (_) => sheet,
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       final token = await SharedPreferenceHelper.getData(
//         SharedPreferenceConstant.TOKEN,
//       );
//       if (token != null) {
//         context.read<PublicationsProvider>().getPublications(context, token);
//       }
//     });
//   }
//
//   Widget _buildShimmer() {
//     return Shimmer.fromColors(
//       baseColor: Colors.grey.shade300,
//       highlightColor: Colors.grey.shade100,
//       child: ListView.builder(
//         physics: const NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         itemCount: 2,
//         itemBuilder: (_, __) => Container(
//           margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//           height: 500,
//           decoration: BoxDecoration(
//             color: Colors.grey[300],
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPublicationItem(PublicationDatum pub) {
//     final imageUrl =
//         (pub.publicationimage != null && pub.publicationimage!.isNotEmpty)
//             ? pub.publicationimage
//             : null;
//
//     final dateText = pub.publicationDate != null
//         ? DateFormat('yyyy-MM-dd').format(pub.publicationDate!)
//         : '';
//
//     final categoryText = pub.publicationCategory ?? '';
//
//     return GestureDetector(
//       onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (_) => PublicationDetailsScreen(publication: pub),
//           )),
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 8),
//         height: 500,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.grey[200],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: Stack(
//             fit: StackFit.expand,
//             children: [
//               imageUrl != null
//                   ? Image.network(
//                       imageUrl,
//                       fit: BoxFit.cover,
//                       errorBuilder: (_, __, ___) => Image.asset(
//                         'assets/images/publication_image1.png',
//                         fit: BoxFit.cover,
//                       ),
//                     )
//                   : Image.asset(
//                       'assets/images/publication_image1.png',
//                       fit: BoxFit.cover,
//                     ),
//               Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.black.withOpacity(0.6), Colors.transparent],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                   ),
//                 ),
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Spacer(),
//                     Row(
//                       children: [
//                         Text(
//                           pub.publicationTitle ?? '',
//                           style: const TextStyle(
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w600,
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         if (categoryText.isNotEmpty)
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
//                             decoration: BoxDecoration(
//                               color: const Color(0xFF1D97D4),
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             child: Text(
//                               categoryText.toUpperCase(),
//                               style: const TextStyle(
//                                 fontFamily: 'Inter',
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 12,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Row(
//                       children: [
//                         const Icon(Icons.calendar_today, size: 14, color: Colors.white),
//                         const SizedBox(width: 6),
//                         Text(
//                           dateText,
//                           style: const TextStyle(
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w500,
//                             fontSize: 12,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Positioned(
//                 bottom: 50,
//                 right: 5,
//                 child: Column(
//                   children: [
//                     IconButton(
//                       icon: Icon(
//                           isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
//                           size: 28,
//                           color: isLiked ? const Color(0xFF1D97D4) : Colors.white),
//                       onPressed: _toggleLike,
//                     ),
//                     Text('$likeCount', style: const TextStyle(color: Colors.white)),
//                     IconButton(
//                       icon: const Icon(Icons.comment, color: Colors.white),
//                       onPressed: () => _openBottomSheet(const CommentDrawer()),
//                     ),
//                     Text('$commentCount',
//                         style: const TextStyle(color: Colors.white)),
//                     GestureDetector(
//                       onTap: () => _openBottomSheet(const ShareDrawer()),
//                       child: Padding(
//                         padding: const EdgeInsets.all(6.0),
//                         child: SvgPicture.asset(
//                           'assets/images/share_icon.svg',
//                           width: 25,
//                           height: 25,
//                           colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
//                         ),
//                       ),
//                     ),
//                     Text('$shareCount', style: const TextStyle(color: Colors.white)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Consumer<PublicationsProvider>(
//         builder: (context, provider, _) {
//           if (provider.isLoading) {
//             return _buildShimmer();
//           }
//
//           final publications = provider.publicationList?.data;
//           if (publications == null || publications.isEmpty) {
//             return const Center(child: Text('No publications found'));
//           }
//
//           return ListView.builder(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             physics: const BouncingScrollPhysics(),
//             itemCount: publications.length + 1,
//             itemBuilder: (context, index) {
//               if (index == 1 && publications.length > 1) {
//                 return Column(
//                   children: [
//                     _buildPublicationItem(publications[0]),
//                     const SizedBox(height: 16),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => const AdvertisementScreen(),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         width: double.infinity,
//                         height: 80,
//                         decoration: BoxDecoration(
//                           color: const Color(0xFF797979),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         alignment: Alignment.center,
//                         child: const Text(
//                           'Advertisements',
//                           style: TextStyle(
//                             fontFamily: 'Inter',
//                             fontWeight: FontWeight.w700,
//                             fontSize: 18,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 );
//               }
//
//               final pubIndex = index > 1 ? index - 1 : index;
//               if (pubIndex < publications.length) {
//                 return _buildPublicationItem(publications[pubIndex]);
//               }
//
//               return const SizedBox.shrink(); // safety fallback
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:campus_connect/screens/publication/publication_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/publications_model.dart';
import '../../providers/publications_provider.dart';
import '../../sharedPreference/sharedpreference_constant.dart';
import '../../sharedPreference/sharedpreference_helper.dart';
import '../../widgets/advertisement_screen.dart';
import '../../widgets/comment_drawer.dart';
import '../../widgets/share_drawer.dart';

class PublicationTabScreen extends StatefulWidget {
  const PublicationTabScreen({Key? key}) : super(key: key);

  @override
  State<PublicationTabScreen> createState() => _PublicationTabScreenState();
}

class _PublicationTabScreenState extends State<PublicationTabScreen> {
  bool isLiked = false;
  int likeCount = 100, commentCount = 25, shareCount = 10;
  static const String _baseUrl = "https://campusconnect-web.irpinnovative.com/";

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
    });
  }

  void _openBottomSheet(Widget sheet) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => sheet,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final token = await SharedPreferenceHelper.getData(
        SharedPreferenceConstant.TOKEN,
      );
      if (token != null) {
        context.read<PublicationsProvider>().getPublications(context, token);
      }
    });
  }

  Widget _buildShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 2,
        itemBuilder: (_, __) => Container(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          height: 500,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _buildPublicationItem(PublicationDatum pub) {

    final imageUrl = pub.publicationimage?.isNotEmpty == true
        ? _baseUrl + pub.publicationimage!
        : '';

    final dateText = pub.publicationDate != null
        ? DateFormat('yyyy-MM-dd').format(pub.publicationDate!)
        : '';

    final categoryText = pub.publicationCategory ?? '';

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PublicationDetailsScreen(publication: pub),
          )),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            fit: StackFit.expand,
            children: [

              imageUrl.isNotEmpty
                  ? Image.network(imageUrl, fit: BoxFit.cover)
                  : Image.asset('assets/images/publication_image1.png', fit: BoxFit.cover),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          pub.publicationTitle ?? '',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 8),
                        if (categoryText.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1D97D4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              categoryText.toUpperCase(),
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
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today,
                            size: 14, color: Colors.white),
                        const SizedBox(width: 6),
                        Text(
                          dateText,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.white,
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
                          isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                          size: 28,
                          color:
                              isLiked ? const Color(0xFF1D97D4) : Colors.white),
                      onPressed: _toggleLike,
                    ),
                    Text('$likeCount',
                        style: const TextStyle(color: Colors.white)),
                    IconButton(
                      icon: const Icon(Icons.comment, color: Colors.white),
                      onPressed: () => _openBottomSheet(const CommentDrawer()),
                    ),
                    Text('$commentCount',
                        style: const TextStyle(color: Colors.white)),
                    GestureDetector(
                      onTap: () => _openBottomSheet(const ShareDrawer()),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgPicture.asset(
                          'assets/images/share_icon.svg',
                          width: 25,
                          height: 25,
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                        ),
                      ),
                    ),
                    Text('$shareCount',
                        style: const TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PublicationsProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return _buildShimmer();
          }

          final publications = provider.publicationList?.data;
          if (publications == null || publications.isEmpty) {
            return const Center(child: Text('No publications found'));
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            physics: const BouncingScrollPhysics(),
            itemCount: publications.length + 1,
            itemBuilder: (context, index) {
              if (index == 1 && publications.length > 1) {
                return Column(
                  children: [
                    _buildPublicationItem(publications[0]),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AdvertisementScreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFF797979),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'Advertisements',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }

              final pubIndex = index > 1 ? index - 1 : index;
              if (pubIndex < publications.length) {
                return _buildPublicationItem(publications[pubIndex]);
              }

              return const SizedBox.shrink(); // safety fallback
            },
          );
        },
      ),
    );
  }
}
