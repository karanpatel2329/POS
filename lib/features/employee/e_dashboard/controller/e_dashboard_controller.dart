import 'package:get/get.dart';

class EDashboardController extends GetxController {
  RxBool isLoadingDashboard = false.obs;

  // Rx<DashboardModel> dashboard = DashboardModel().obs;
  // Future getDashboard() async {
  //   try {
  //     isLoadingDashboard.value = true;
  //     final response = await DashboardService.getDashboard();

  //     if (response != null) {
  //       dashboard.value = DashboardModel.fromJson(response.data);
  //       print("+++>>");
  //     } else {}
  //     isLoadingDashboard.value = false;
  //   } catch (e) {
  //     print(e);
  //     isLoadingDashboard.value = false;
  //     Get.snackbar("Error", "Something went wrong");
  //   }
  // }
}