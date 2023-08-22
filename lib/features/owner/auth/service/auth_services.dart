import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/api_url.dart';
import 'package:pos_app/features/owner/auth/models/owner.dart';

class AuthService {
  

  // SIGN UP
    static Future signUp(Owner owner) async {
    try {
      final dio = Dio();
      final response = await dio.post(ApiUrl.signUp,data: owner.toJson() );
      return response;
    } catch (e) {
      return null;
    }
  }

    static Future login({required String email, required String password}) async {
      try {
        final dio = Dio();
        final response = await dio.post(ApiUrl.login,data: {
          "email":email,
          "password":password
        });
        print(response.statusCode);

        return response;
      }on Exception

      catch (e) {
        if (e is DioException) {
          //handle DioError here by error type or by error code
          if(e.type==DioExceptionType.badResponse){

              Get.snackbar("Error", "Invalid Password");
                     }
        }
        return null;
      }
    }

}