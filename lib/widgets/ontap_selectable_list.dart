// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../export_casekarao.dart';
// import '../export_dulex.dart';
//
//
// class OntapSelectableList extends StatelessWidget {
//   final int? selected;
//   final Function? callback;
//   final List? titles;
//
//   const OntapSelectableList(
//       {super.key, this.selected, this.callback, this.titles});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 70,
//       child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           itemCount: titles!.length,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () => callback!(index),
//               child:  ListTile(
//                 minTileHeight: 45.h,
//                 tileColor: ColorManager.kWhiteColor,
//                 title: Text(titles![index],),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(AppSize.s14.r), // Set border radius
//                 ),
//                 trailing: Container(
//                   height: 24.h,
//                   width: 24.w,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: ColorManager.kGreenColor,
//                   ),
//                   child:selected == index? Icon(Icons.check),
//                 ),
//               ),
//               // Container(
//               //   margin: EdgeInsets.only(
//               //       left: index == AppMargin.m0 ? AppMargin.m5 : AppMargin.m0,
//               //       right: AppMargin.m10,
//               //       top: AppMargin.m15,
//               //       bottom: AppMargin.m8),
//               //   padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
//               //   decoration: BoxDecoration(
//               //       color: selected == index
//               //           ? ColorManager.secondary
//               //           : ColorManager.kLightBlueColor,
//               //       borderRadius: BorderRadius.circular(AppSize.s15),
//               //       boxShadow: [
//               //         BoxShadow(color: Colors.grey.withOpacity(0.3)),
//               //       ]),
//               //   child: Center(
//               //     child: Text(categories![index],
//               //         style: getmediumStyle(
//               //           fontSize: AppSize.s12,
//               //           color: selected == index
//               //               ? ColorManager.kWhiteColor
//               //               : ColorManager.kGreyColor,
//               //         )),
//               //   ),
//               // ),
//             );
//           }),
//     );
//   }
// }
