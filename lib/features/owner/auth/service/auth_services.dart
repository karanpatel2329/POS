import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/api_url.dart';
import 'package:pos_app/features/owner/auth/models/owner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  

  // SIGN UP
    static Future signUp(OwnerModel owner) async {
    try {
      print('object');
      print(owner.toJson());
      final dio = Dio();
      final response = await dio.post(ApiUrl.signUp,data: owner.toJson());
      print('object');
      print(response.data);
      print('object');
      print(response.statusCode);
      return response;
    }catch (e) {
      print(e);
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

  static Future forgotPassword({required String email}) async {
    try {
      final dio = Dio();
      final response = await dio.post(ApiUrl.forgetPassword,data: {
        "email":email,
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

  static Future verifyOTP({required String email, required int otp}) async {
    try {
      final dio = Dio();
      final response = await dio.post(ApiUrl.verifyOTP,data: {
        "email":email,
        "otp":otp
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

  static Future resetPassword({required String password}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final dio = Dio();
      print(prefs.getString('ownerId'));
      final response = await dio.post(ApiUrl.resetPassword,data: {
        "ownerId": prefs.getString('ownerId'),
        "newPassword": password
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