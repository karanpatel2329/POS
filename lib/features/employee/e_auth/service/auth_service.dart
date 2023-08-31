import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:pos_app/core/constants/api_url.dart';

class EmployeeAuthService {
  


    static Future employeeLogin({required String email, required int passcode}) async {
      try {
        final dio = Dio();
        final response = await dio.post(ApiUrl.employeeLogin,data: {
          "email":email,
          "passcode":passcode
        });
        print(response.statusCode);

        return response;
      }on Exception

      catch (e) {
        if (e is DioException) {
          //handle DioError here by error type or by error code
          if(e.type==DioExceptionType.badResponse){
            Get.snackbar("Error", "Invalid Passcode");
          }
        }
        return null;
      }
    }

}