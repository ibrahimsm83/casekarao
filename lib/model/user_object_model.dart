class UserObjectModel {
  final bool status;
  final String message;
  final UserData data;
  final Map<String, dynamic> errors;
  final String apiToken;

  UserObjectModel({
    required this.status,
    required this.message,
    required this.data,
    required this.errors,
    required this.apiToken,
  });

  factory UserObjectModel.fromJson(Map<String, dynamic> json) {
    return UserObjectModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: UserData.fromJson(json['data'] ?? {}),
      errors: json['errors'] != null ? Map<String, dynamic>.from(json['errors']) : {},
      apiToken: json['api_token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
      'errors': errors,
      'api_token': apiToken,
    };
  }
}

class UserData {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String? dob;
  final int rating;
  final String? image;
  final String? otp;
  final String? barLicenseNo;
  final String? practiceState;
  final String? experience;
  final String? organization;
  final String? lawSchool;
  final String? degree;
  final String? graduationYear;
  final String? address;
  final String? bio;
  final String? languages;
  final int isPersonalInfo;
  final int isLegalExperience;
  final int isEducation;
  final int isBusiness;
  final int isGovIdUploaded;
  final int isBarIdUploaded;
  final int isSelfie;
  final int isOptionalDetails;
  final String apiToken;
  final String? fcmToken;
  final int isOtpVerified;
  final int isNotified;
  final int isMilestoneNotified;
  final int isPayoutNotified;
  final int isCaseNotified;
  final int isVerified;
  final int isProfileCompleted;
  final String? providerId;
  final String? providerName;
  final int status;
  final String? emailVerifiedAt;
  final String password;
  final String? rememberToken;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.dob,
    required this.rating,
    this.image,
    this.otp,
    this.barLicenseNo,
    this.practiceState,
    this.experience,
    this.organization,
    this.lawSchool,
    this.degree,
    this.graduationYear,
    this.address,
    this.bio,
    this.languages,
    required this.isPersonalInfo,
    required this.isLegalExperience,
    required this.isEducation,
    required this.isBusiness,
    required this.isGovIdUploaded,
    required this.isBarIdUploaded,
    required this.isSelfie,
    required this.isOptionalDetails,
    required this.apiToken,
    this.fcmToken,
    required this.isOtpVerified,
    required this.isNotified,
    required this.isMilestoneNotified,
    required this.isPayoutNotified,
    required this.isCaseNotified,
    required this.isVerified,
    required this.isProfileCompleted,
    this.providerId,
    this.providerName,
    required this.status,
    this.emailVerifiedAt,
    required this.password,
    this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      dob: json['dob'],
      rating: json['rating'] ?? 0,
      image: json['image'],
      otp: json['otp'].toString(),
      barLicenseNo: json['bar_license_no'],
      practiceState: json['practice_state'],
      experience: json['experience'],
      organization: json['organization'],
      lawSchool: json['law_school'],
      degree: json['degree'],
      graduationYear: json['graduation_year'],
      address: json['address'],
      bio: json['bio'],
      languages: json['languages'],
      isPersonalInfo: json['is_personal_info'] ?? 0,
      isLegalExperience: json['is_legal_experience'] ?? 0,
      isEducation: json['is_education'] ?? 0,
      isBusiness: json['is_business'] ?? 0,
      isGovIdUploaded: json['is_gov_id_uploaded'] ?? 0,
      isBarIdUploaded: json['is_barid_uploaded'] ?? 0,
      isSelfie: json['is_selfie'] ?? 0,
      isOptionalDetails: json['is_optional_details'] ?? 0,
      apiToken: json['api_token'] ?? '',
      fcmToken: json['fcm_token'],
      isOtpVerified: json['is_otp_verified'] ?? 0,
      isNotified: json['is_notified'] ?? 0,
      isMilestoneNotified: json['is_milestone_notified'] ?? 0,
      isPayoutNotified: json['is_payout_notified'] ?? 0,
      isCaseNotified: json['is_case_notified'] ?? 0,
      isVerified: json['is_verified'] ?? 0,
      isProfileCompleted: json['is_profile_completed'] ?? 0,
      providerId: json['provider_id'],
      providerName: json['provider_name'],
      status: json['status'] ?? false,
      emailVerifiedAt: json['email_verified_at'],
      password: json['password'] ?? '',
      rememberToken: json['remember_token'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'dob': dob,
      'rating': rating,
      'image': image,
      'otp': otp,
      'bar_license_no': barLicenseNo,
      'practice_state': practiceState,
      'experience': experience,
      'organization': organization,
      'law_school': lawSchool,
      'degree': degree,
      'graduation_year': graduationYear,
      'address': address,
      'bio': bio,
      'languages': languages,
      'is_personal_info': isPersonalInfo,
      'is_legal_experience': isLegalExperience,
      'is_education': isEducation,
      'is_business': isBusiness,
      'is_gov_id_uploaded': isGovIdUploaded,
      'is_barid_uploaded': isBarIdUploaded,
      'is_selfie': isSelfie,
      'is_optional_details': isOptionalDetails,
      'api_token': apiToken,
      'fcm_token': fcmToken,
      'is_otp_verified': isOtpVerified,
      'is_notified': isNotified,
      'is_milestone_notified': isMilestoneNotified,
      'is_payout_notified': isPayoutNotified,
      'is_case_notified': isCaseNotified,
      'is_verified': isVerified,
      'is_profile_completed': isProfileCompleted,
      'provider_id': providerId,
      'provider_name': providerName,
      'status': status,
      'email_verified_at': emailVerifiedAt,
      'password': password,
      'remember_token': rememberToken,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'deleted_at': deletedAt,
    };
  }
}
