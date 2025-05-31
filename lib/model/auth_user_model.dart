class UserModel {
    final bool status;
    final String message;
    final Data data;
    final Errors errors;
    final String apiToken;

    UserModel({
        required this.status,
        required this.message,
        required this.data,
        required this.errors,
        required this.apiToken,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) {
        return UserModel(
            status: json['status'] ?? false,
            message: json['message'] ?? '',
            data: Data.fromJson(json['data'] ?? {}),
            errors: Errors.fromJson(json['errors'] ?? {}),
            apiToken: json['api_token'] ?? '',
        );
    }

    Map<String, dynamic> toJson() {
        return {
            'status': status,
            'message': message,
            'data': data.toJson(),
            'errors': errors.toJson(),
            'api_token': apiToken,
        };
    }
}

class Data {
    final int id;
    final String name;
    final String email;
    final String phone;
    final dynamic dob;
    final int rating;
    final dynamic image;
    final String otp;
    final dynamic barLicenseNo;
    final dynamic practiceState;
    final dynamic experience;
    final dynamic organization;
    final dynamic lawSchool;
    final dynamic degree;
    final dynamic graduationYear;
    final dynamic address;
    final dynamic bio;
    final dynamic languages;
    final int isPersonalInfo;
    final int isLegalExperience;
    final int isEducation;
    final int isBusiness;
    final int isGovIdUploaded;
    final int isBaridUploaded;
    final int isSelfie;
    final int isOptionalDetails;
    final String apiToken;
    final dynamic fcmToken;
    final int isOtpVerified;
    final int isNotified;
    final int isMilestoneNotified;
    final int isPayoutNotified;
    final int isCaseNotified;
    final int isVerified;
    final int isProfileCompleted;
    final dynamic providerId;
    final dynamic providerName;
    final int status;
    final dynamic emailVerifiedAt;
    final String password;
    final dynamic rememberToken;
    final String createdAt;
    final String updatedAt;
    final dynamic deletedAt;
    final bool isUser;

    Data({
        required this.id,
        required this.name,
        required this.email,
        required this.phone,
        required this.dob,
        required this.rating,
        required this.image,
        required this.otp,
        required this.barLicenseNo,
        required this.practiceState,
        required this.experience,
        required this.organization,
        required this.lawSchool,
        required this.degree,
        required this.graduationYear,
        required this.address,
        required this.bio,
        required this.languages,
        required this.isPersonalInfo,
        required this.isLegalExperience,
        required this.isEducation,
        required this.isBusiness,
        required this.isGovIdUploaded,
        required this.isBaridUploaded,
        required this.isSelfie,
        required this.isOptionalDetails,
        required this.apiToken,
        required this.fcmToken,
        required this.isOtpVerified,
        required this.isNotified,
        required this.isMilestoneNotified,
        required this.isPayoutNotified,
        required this.isCaseNotified,
        required this.isVerified,
        required this.isProfileCompleted,
        required this.providerId,
        required this.providerName,
        required this.status,
        required this.emailVerifiedAt,
        required this.password,
        required this.rememberToken,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.isUser,
    });

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            id: json['id'] ?? 0,
            name: json['name'] ?? '',
            email: json['email'] ?? '',
            phone: json['phone'] ?? '',
            dob: json['dob'],
            rating: json['rating'] ?? 0,
            image: json['image'],
            otp: json['otp']?.toString() ?? '',
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
            isBaridUploaded: json['is_barid_uploaded'] ?? 0,
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
            status: json['status'] ?? 0,
            emailVerifiedAt: json['email_verified_at'],
            password: json['password'] ?? '',
            rememberToken: json['remember_token'],
            createdAt: json['created_at'] ?? '',
            updatedAt: json['updated_at'] ?? '',
            deletedAt: json['deleted_at'],
            isUser: json['isUser'] ?? false,
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
            'is_barid_uploaded': isBaridUploaded,
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
            'isUser': isUser,
        };
    }
}

class Errors {
    final Map<String, dynamic> errors;

    Errors({this.errors = const {}});

    factory Errors.fromJson(Map<String, dynamic> json) {
        return Errors(
            errors: json,
        );
    }

    Map<String, dynamic> toJson() {
        return errors;
    }
}
