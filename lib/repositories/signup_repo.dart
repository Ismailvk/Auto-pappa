import 'package:auto_pappa/data/network/api_services.dart';
import 'package:auto_pappa/data/network/api_urls.dart';

class SignupRepo {
  EitherResponse userSignup(Map<String, dynamic> signupData) {
    const url = '${ApiUrls.baseUrl}${ApiUrls.signup}';
    return ApiService.postApi(signupData, url);
  }
}
