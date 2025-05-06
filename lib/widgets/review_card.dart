import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../export_casekarao.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel review;

  const ReviewCard({
    Key? key,
    required this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User info and rating row
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // User avatar
            CircleAvatar(
              backgroundImage: AssetImage(review.reviewerImage),
              radius: 20.r,
            ),
            SizedBox(width: 12.w),

            // Name and rating
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name and date row
                Text(
                  review.reviewerName,
                  style: getsemiboldStyle(
                    color: ColorManager.primary,
                    fontSize: ScreenUtil().setSp(AppSize.s14),
                  ),
                ),
                SizedBox(height: 4.h),
            
                // Star rating
                Row(
                  children: [
                    StarRating(
                      rating: review.rating,
                      size: 16,
                      color: ColorManager.kLightYellowColor,
                      borderColor: ColorManager.kLightYellowColor,
                    ),
                     Text(
                      review.reviewDate,
                      style: getRegularStyle(
                        color: ColorManager.kGreyColor,
                        fontSize: ScreenUtil().setSp(AppSize.s12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        // Review text
        Padding(
          padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
          child: Text(
            review.reviewText,
            style: getRegularStyle(
              color: ColorManager.kDarkGreyColor,
              fontSize: ScreenUtil().setSp(AppSize.s14),
            ),
          ),
        ),

        // Divider
        Divider(
          color: ColorManager.kGreyBackViewColor,
          thickness: 1,
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
