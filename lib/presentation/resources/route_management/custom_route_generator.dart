import 'package:casekarao/presentation/case_details_screen/user_case_details_screen.dart';
import 'package:casekarao/presentation/lawyer_details_screen/lawyer_details_screen.dart';
import 'package:casekarao/presentation/rate_reviews/rate_review.dart';
import 'package:flutter/material.dart';
import '../../../export_casekarao.dart';
import '../../send_offer_screen/send_offer_screen.dart';
import '../export_resources.dart';

class CustomRouteGenerator {
  CustomRouteGenerator._();

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case CustomRouteNames.kBookDetailScreenRoute:
      //   final argument = settings.arguments as BookDetailPageArgumentModel;
      //   BookModel temp = BookModel.empty();
      //   if (argument.argumentIsBookModel) {
      //     temp = argument.bookModel;
      //   } else {
      //     temp.bookId = argument.resumeBookModel.bookId;
      //     temp.coverImageUrl = argument.resumeBookModel.coverImageUrl;
      //   }
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return BlocProvider<BookDetailsBloc>(
      //         create: (context) => BookDetailsBloc(),
      //         child: BookDetailsPage(
      //           book: temp,
      //         ),
      //       );
      //     },
      //   );
      case CustomRouteNames.kInitialRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const SplashScreen();
          },
        );
      case CustomRouteNames.kLetsGetStartedScreenRouteRoute:
        return MaterialPageRoute(
          builder: (context) {
            return LetsGetStartedView();
          },
        );
      //
      case CustomRouteNames.kLoginScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        );
      //
      case CustomRouteNames.kCreateNewAccountScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const CreateNewAccountScreen();
          },
        );
      case CustomRouteNames.kOtpVerificationScreenRoute:
        AuthUserModel argumentModel =
            settings.arguments as AuthUserModel;
        // final String email = settings.arguments as String;
        // final bool isForgotPw = settings.arguments as bool;
        return MaterialPageRoute(
          builder: (context) {
            return OtpScreen(
                data: argumentModel,//email,
                );
          },
        );
      case CustomRouteNames.kSetupProfileScreenRoute:
        final bool isCompleteAllRequiredFields = settings.arguments as bool;
        return MaterialPageRoute(
          builder: (context) {
            return SetupProfileScreen(isCompleteAllRequiredField: isCompleteAllRequiredFields,);
          },
        );
      case CustomRouteNames.kPersonalInformationScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const PersonalInformationScreen();
          },
        );
      case CustomRouteNames.kLegalExperienceScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const LegalExperienceScreen();
          },
        );
      case CustomRouteNames.kEducationAndCertificationScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const EducationAndCertificationScreen();
          },
        );
      case CustomRouteNames.kBusinessAndAvailabilityScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return BusinessAndAvailabilityScreen();
          },
        );
      //
      case CustomRouteNames.kOptionalDetailsScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return OptionalDetailsScreen();
          },
        );
      case CustomRouteNames.kCNICUploadScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return CNICUploadScreen();
          },
        );
      case CustomRouteNames.kBarIdCardUploadScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return BarIdCardUploadScreen();
          },
        );
        case CustomRouteNames.kIdentityVerificationScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return IdentityVerificationScreen();
          },
        );
        case CustomRouteNames.kApplicationUnderReviewScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return ApplicationUnderReviewScreen();
          },
        );
        case CustomRouteNames.kDashboardScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return DashboardScreen();
          },
        );
        case CustomRouteNames.kPendingScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return RequestsScreen();
          },
        );
        case CustomRouteNames.kOnGoingScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return OnGoingScreen();
          },
        );
        case CustomRouteNames.kCanceledScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return CanceledScreen();
          },
        );
        case CustomRouteNames.kCompletedScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return CompletedScreen();
          },
        );
        case CustomRouteNames.kConsultationRequestsDetailsScreenRoute:
          final argument = settings.arguments as PendingStatusItemModel;
        return MaterialPageRoute(
          builder: (context) {
            return ConsultationRequestsDetailsScreen(data: argument,);
          },
        );

        case CustomRouteNames.kConsultationRequestsDetailsUserScreenRoute:
          final argument = settings.arguments as PendingStatusItemModel;
        return MaterialPageRoute(
          builder: (context) {
            return ConsultationRequestsDetailsUserScreen(data: argument,);
          },
        );
         case CustomRouteNames.klawyerDetailsScreen:
          final argument = settings.arguments as PendingStatusItemModel;
        return MaterialPageRoute(
          builder: (context) {
            return LawyerDetailsScreen(data: argument,);
          },
        );

      case CustomRouteNames.kCreateMilestonesScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return CreateMilestonesScreen();
          },
        );

        case CustomRouteNames.kCaseDetailsScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return CaseDetailsScreen();
          },
        );
        case CustomRouteNames.kDocumentsScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return DocumentsScreen();
          },
        );
        case CustomRouteNames.kPayoutDetailsScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return PayoutDetailsScreen();
          },
        );
        case CustomRouteNames.kCaseDiscussionScreenRoute:
          final isFiled = settings.arguments as bool;
        return MaterialPageRoute(
          builder: (context) {
            return CaseDiscussionScreen(isCaseFiled: isFiled,);
          },
        );
      case CustomRouteNames.kAddPayoutScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return AddPayoutScreen();
          },
        );
        case CustomRouteNames.kNotificationSettingScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return NotificationSettingScreen();
          },
        );
        case CustomRouteNames.kDisputeScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return DisputeScreen();
          },
        );
        case CustomRouteNames.kAddDisputeScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return AddDisputeScreen();
          },
        );
        case CustomRouteNames.kLiveChatScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return LiveChatScreen();
          },
        );
        case CustomRouteNames.kTermsConditionScreenRoute:
          TermsAndConditionArgumentModel argumentModel =
          settings.arguments as TermsAndConditionArgumentModel;
        return MaterialPageRoute(
          builder: (context) {
            return TermsConditionScreen(
              title: argumentModel.title,
              details: argumentModel.details,
            );
          },
        );
      case CustomRouteNames.kChangePasswordScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return ChangePasswordScreen();
          },
        );
        case CustomRouteNames.kAccountInformationScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return AccountInformationScreen();
          },
        );
        case CustomRouteNames.kSendOfferScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const SendOfferScreen();
          },
        );
        case CustomRouteNames.kUserCaseDetailsScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const UserCaseDetailsScreen();
          },
        );
        case CustomRouteNames.kRateReviewScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const RateReviewScreen();
          },
        );

 case CustomRouteNames.kPendingCaseDetailsUserScreenRoute:
   String  caseStatus =
   settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) {
            return PendingCaseDetailsUserScreen(status: caseStatus,);
          },
        );

 case CustomRouteNames.kViewBankDetailsScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return ViewBankDetailsScreen();
          },
        );

      default:
        return null;
    }
  }
}
