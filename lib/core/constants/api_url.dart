class ApiUrl {

  static String liveBaseURL = 'http://localhost:3000';

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


}