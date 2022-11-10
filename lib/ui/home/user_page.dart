// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:twitter_clone/ui/home/provider/home_providers.dart';
//
// import '../utils/logger.dart';
// import '../widget/post_card.dart';
//
// class UserPage extends ConsumerWidget {
//   UserPage({super.key, required this.userId});
//
//   final String userId;
//
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ref.watch(homeProvider(widget.userId)).when(
//       data: (user) {
//         final userName = user.info.name;
//         final posts = user.post;
//
//         return Scaffold(
//           body: ListView(
//             children: [
//               Column(
//                 children: [
//                   ListView(
//                     physics: const BouncingScrollPhysics(
//                         parent: AlwaysScrollableScrollPhysics()),
//                     children: [
//                       Container(
//                         height: 150,
//                         decoration: const BoxDecoration(
//                           color: Colors.blue,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const SizedBox.shrink(),
//                             IconButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               icon: const Icon(
//                                 Icons.arrow_back,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         transform: Matrix4.translationValues(0.0, -40.0, 0.0),
//                         padding: const EdgeInsets.symmetric(horizontal: 20),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 const CircleAvatar(
//                                     radius: 45,
//                                     backgroundImage: const NetworkImage('')),
//                               ],
//                             ),
//                             const SizedBox(height: 10),
//                             const Text(
//                               'Name',
//                               style: const TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//                             const Text(
//                               'Hello japan',
//                               style: const TextStyle(
//                                 fontSize: 15,
//                               ),
//                             ),
//                             const SizedBox(height: 15),
//                             Row(
//                               children: const [
//                                 Text(
//                                   '200 フォロー',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                     letterSpacing: 2,
//                                   ),
//                                 ),
//                                 SizedBox(width: 20),
//                                 Text(
//                                   '2000 フォロワー',
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                     letterSpacing: 2,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 20),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: posts.length,
//                     itemBuilder: (context, index) => PostCard(
//                       post: posts[index],
//                       onPressed: () {},
//                       userInfo: user.info,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//       error: (error, __) {
//         logger.warning(error);
//         return const Center(
//           child: Text('error'),
//         );
//       },
//       loading: () => const Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//
//   }
// }
