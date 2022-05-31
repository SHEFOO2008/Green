// import 'package:tadweer_recycling_shop/modules/web_view/web_view_screen.dart';
// import 'package:tadweer_recycling_shop/shared/cubit/cubit.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/material.dart';
//
// Widget buildArticleItem(article, context) => Padding(
//   padding: const EdgeInsets.all(8.0),
//   child: InkWell(
//     onTap: (){
//       Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewScreen(article['url'])));
//     },
//     child: Row(
//       children: [
//         Container(
//             width: 120.0,
//             height: 120.0,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.0),
//                 image: DecorationImage(
//                     image: NetworkImage('${article['urlToImage']}'),
//                     fit: BoxFit.cover
//                 )
//             )
//         ),
//         const SizedBox(
//           width: 20.0,
//         ),
//         Expanded(
//           child: SizedBox(
//             height: 120.0,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Text(
//                     '${article['title']}',
//                     style: Theme.of(context).textTheme.bodyText1,
//                     maxLines: 3,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 Text(
//                   '${article['publishedAt']}',
//                   style: const TextStyle(
//                     color: Colors.grey,
//                     fontSize: 15.0
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         )
//       ],
//     ),
//   ),
// );
//
// Widget myDivider()
// {
//   return Padding(
//     padding: const EdgeInsets.symmetric(
//         horizontal: 20.0
//     ),
//     child: Container(
//       width: double.infinity,
//       height: 1.0,
//       color: Colors.grey[300],
//     ),
//   );
// }
//
// Widget articleBuilder(list, context)
// {
//   NewsCubit cubit = NewsCubit.get(context);
//   return ConditionalBuilder(
//     condition: list.isNotEmpty,
//     builder: (context) => ListView.separated(
//       physics: const BouncingScrollPhysics(),
//       itemBuilder: (context, index) => buildArticleItem(list[index], context),
//       separatorBuilder: (context, index) => myDivider(),
//       itemCount: list.length,
//     ),
//     fallback: (context) => const Center(child: CircularProgressIndicator(),),
//   );
// }