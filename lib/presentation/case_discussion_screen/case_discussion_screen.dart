import 'package:casekarao/export_casekarao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CaseDiscussionScreen extends StatelessWidget {
  final bool? isCaseFiled;

  const CaseDiscussionScreen({super.key, this.isCaseFiled = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
            child: Container(
              height: 40.h,
              width: 40.h,
              decoration: BoxDecoration(
                color: ColorManager.kWhiteColor,
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: SvgPicture.asset(ImageAssets.backArrowIcon),
              ),
            ),
          ),
        ),
        actions: [
          isCaseFiled ?? false
              ? viewOffer()
              : InkWell(
                onTap:
                    () => Navigator.pushNamed(
                      context,
                      CustomRouteNames.kDocumentsScreenRoute,
                    ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, bottom: 5.0),
                  child: Container(
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                      color: ColorManager.kWhiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(16.r)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SvgPicture.asset(ImageAssets.kDocumentsIcon),
                    ),
                  ),
                ),
              ),
        ],
        title:
            isCaseFiled ?? false
                ? userInfo()
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.kCaseDiscussion,
                      style: getsemiboldStyle(
                        color: ColorManager.primary,
                        fontSize: ScreenUtil().setSp(FontSize.s16),
                      ),
                    ),
                    Text(
                      AppStrings.k1stMilestone,
                      style: getsemiboldStyle(
                        color: ColorManager.secondary,
                        fontSize: ScreenUtil().setSp(FontSize.s10),
                      ),
                    ),
                  ],
                ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.sizeWidth(context!) * 0.03,
        ),
        child: Column(
          children: [
            Divider(),
            Expanded(
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 50),
                  userChatBubble('I just started a new book'),
                  SizedBox(height: 10),

                  otherUserChatBubble(
                    'Im Good, What\'s up',
                    ImageAssets.userImage,
                  ),

                  SizedBox(height: 10),
                  userChatBubble('How are you?'),
                  SizedBox(height: 10),
                  userChatBubble('Hi There'),
                  SizedBox(height: 20),
                  otherUserChatBubble(
                    'Im Good, What\'s up',
                    ImageAssets.userImage,
                  ),

                  SizedBox(height: 10),
                  userChatBubble('How are you?'),
                  SizedBox(height: 10),
                  userChatBubble('Hi There'),
                  SizedBox(height: 20),
                ],
              ),
            ),

            ///Input TextField
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 0.0),
              decoration: BoxDecoration(color: ColorManager.kWhiteColor),
              child: Row(
                children: [
                  SvgPicture.asset(ImageAssets.kPlusIcon),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: CustomTextFormField(
                        hintText: AppStrings.kTypeAMessage,
                        fillColor: ColorManager.kBackgroundColor,
                        //controller: _firstNameController,
                        horizontalMergin: 0.0,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(ImageAssets.kSmileCircleIcon),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset(
                      ImageAssets.kAttachmentIcon,
                      //height: 18,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  userChatBubble(String message) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 40,
              alignment: Alignment.topCenter,
              //  width: 200,
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              decoration: BoxDecoration(
                color: ColorManager.secondary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: Center(
                child: Text(message, style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(width: 5),
            Container(
              height: 40,
              width: 40,
              margin: EdgeInsets.only(
                left: 0.0,
                right: 8.0,
                top: 8.0,
                bottom: 8.0,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(ImageAssets.userImage),
                  fit: BoxFit.cover,
                ),
                color: Colors.white,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text('4.15 pm', style: TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  otherUserChatBubble(String message, String image) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              decoration: BoxDecoration(
                color: ColorManager.kChatBgColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
              ),
              child: Center(
                child: Text(
                  message,
                  style: getRegularStyle(color: ColorManager.primary),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text('4.15 pm', style: TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget userInfo() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8), // adjust for roundness
          child: Image.asset(
            ImageAssets.userImage,
            width: 30,
            height: 30,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 3.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "David Watson",
              style: getsemiboldStyle(
                color: ColorManager.primary,
                fontSize: ScreenUtil().setSp(FontSize.s16),
              ),
            ),
            Text(
              AppStrings.kViewProfile,
              style: getmediumStyle(
                color: ColorManager.secondary,
                fontSize: ScreenUtil().setSp(FontSize.s10),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget viewOffer() {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.kLightGreenColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(AppSize.s8.r),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.kGreenColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.4),
                  child: Text(
                    '\$',
                    style: getsemiboldStyle(
                      color: ColorManager.kWhiteColor,
                      fontSize: ScreenUtil().setSp(AppSize.s10),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5.0),
              Text(
                AppStrings.kViewOffer,
                style: getRegularStyle(
                  color: ColorManager.kGreenColor,
                  fontSize: ScreenUtil().setSp(AppSize.s12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
