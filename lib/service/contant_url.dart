class ConstantUrl {
  static final ConstantUrl _appColors = ConstantUrl._internal();

  factory ConstantUrl() => _appColors;

  ConstantUrl._internal();
  static const String baseUrl = "https://campusconnect-web.irpinnovative.com/api/";
  static const String register = "userregistration";
  static const String login = "userlogin";
  static const String forgotPassword = "user/forgotpassword";
  static const String home = "usergethome";
  static const String updateProfile = "editprofile";
}