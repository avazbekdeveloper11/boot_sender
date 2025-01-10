// import 'package:flutter/material.dart';
// import '../../../../../core/extension/extension.dart';
// import '../../../../../core/utils/utils.dart';
//
// class CashbackWidget extends StatelessWidget {
//   const CashbackWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) => SliverPadding(
//         padding: AppUtils.kPaddingAll16,
//         sliver: SliverList(
//           delegate: SliverChildListDelegate(
//             [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Кэшбэк',
//                     style: TextStyle(
//                       fontSize: 17,
//                       height: 22 / 17,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   Text(
//                     'Мониторинг',
//                     style: TextStyle(
//                       fontSize: 15,
//                       height: 20 / 15,
//                       fontWeight: FontWeight.w600,
//                       color: context.colorScheme.primary,
//                     ),
//                   ),
//                 ],
//               ),
//               AppUtils.kGap12,
//               Row(
//                 children: [
//                   Expanded(
//                     child: ListTile(
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: AppUtils.kBorderRadius10,
//                       ),
//                       tileColor: context.colorScheme.secondaryContainer,
//                       title: Text(
//                         'Начислено',
//                         style: TextStyle(
//                           fontSize: 13,
//                           height: 18 / 13,
//                           fontWeight: FontWeight.w400,
//                           color: context.color.secondaryText,
//                         ),
//                       ),
//                       subtitle: Text(
//                         '${32456.moneyFormat} сум',
//                         style: const TextStyle(
//                           fontSize: 15,
//                           height: 20 / 15,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                   AppUtils.kGap12,
//                   Expanded(
//                     child: ListTile(
//                       shape: const RoundedRectangleBorder(
//                         borderRadius: AppUtils.kBorderRadius10,
//                       ),
//                       tileColor: context.colorScheme.secondaryContainer,
//                       title: Text(
//                         'Поступит',
//                         style: TextStyle(
//                           fontSize: 13,
//                           height: 18 / 13,
//                           fontWeight: FontWeight.w400,
//                           color: context.color.secondaryText,
//                         ),
//                       ),
//                       subtitle: Text(
//                         '${32456} сум',
//                         style: const TextStyle(
//                           fontSize: 15,
//                           height: 20 / 15,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       );
// }
