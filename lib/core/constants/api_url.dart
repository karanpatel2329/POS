class ApiUrl {

  static String liveBaseURL = 'http://ec2-65-2-182-34.ap-south-1.compute.amazonaws.com:3000';

    //========================AUTH============================

  static String signUp = liveBaseURL + '/owner/ownerRegister';
  static String login = liveBaseURL + '/owner/ownerLogin';
  static String addMenu = liveBaseURL + '/menu/menu';
  static String order = liveBaseURL + '/order/orders';
  static String table = liveBaseURL + '/table/tables';

}