class ApiUrl {

  static String liveBaseURL = 'http://ec2-65-2-182-34.ap-south-1.compute.amazonaws.com:3000';

    //========================AUTH============================

  static String signUp = liveBaseURL + '/owner/ownerRegister';
  static String login = liveBaseURL + '/owner/ownerLogin';
  static String addCategoru = liveBaseURL + '/categories';
  static String addMenu = liveBaseURL + '/menu/menu';
  static String dashboard = liveBaseURL + '/owner/dashboard';
  static String order = liveBaseURL + '/order/orders';
  static String table = liveBaseURL + '/table/tables';
  static String addEmployee = liveBaseURL + '/employee/employees';
  static String employeeLogin = liveBaseURL + '/employee/login';
  static String sales = liveBaseURL + '/order/sales';
  static String uploadMedia = liveBaseURL + '/upload/uploadMedia';
  static String forgetPassword = liveBaseURL + '/owner/forgetPassword';
  static String verifyOTP = liveBaseURL + '/owner/verifyOTP';
  static String resetPassword = liveBaseURL + '/owner/resetPassword';


}