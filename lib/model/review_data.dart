import 'package:casekarao/model/review_model.dart';
import 'package:casekarao/presentation/resources/assets_manager.dart';

class ReviewData {
  static List<ReviewModel> lawyerReviews = [
    ReviewModel(
      reviewerName: "Jaylon Herwitz",
      reviewDate: "15 Jan, 2025",
      reviewText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      rating: 4.0,
      reviewerImage: ImageAssets.starUserImage1,
    ),
    ReviewModel(
      reviewerName: "Jaylon Herwitz",
      reviewDate: "15 Jan, 2025",
      reviewText:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      rating: 4.0,
      reviewerImage: ImageAssets.starUserImage2,
    ),
    ReviewModel(
      reviewerName: "Sarah Johnson",
      reviewDate: "10 Jan, 2025",
      reviewText:
          "Very professional and knowledgeable in his field. Helped me resolve my case quickly and efficiently.",
      rating: 5.0,
      reviewerImage: ImageAssets.starUserImage3,
    ),
    ReviewModel(
      reviewerName: "Michael Chen",
      reviewDate: "5 Jan, 2025",
      reviewText:
          "Great communication throughout the process. Would definitely recommend to others seeking legal advice.",
      rating: 4.5,
      reviewerImage: ImageAssets.starUserImage4,
    ),
  ];
}
