import 'package:flutter/material.dart';
import '../../../export_casekarao.dart';
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
        OtpScreenArgumentModel argumentModel =
            settings.arguments as OtpScreenArgumentModel;
        // final String email = settings.arguments as String;
        // final bool isForgotPw = settings.arguments as bool;
        return MaterialPageRoute(
          builder: (context) {
            return OtpScreen(
                phoneNumber: argumentModel.phoneNumber, //email,
                );
          },
        );
      case CustomRouteNames.kSetupProfileScreenRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const SetupProfileScreen();
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



      default:
        return null;
    }
  }
}
