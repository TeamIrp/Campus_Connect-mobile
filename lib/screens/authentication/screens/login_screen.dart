import 'package:flutter/material.dart';
import 'package:campus_connect/routes/route_constant.dart';
import 'package:campus_connect/utils/show_toast.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../providers/auth_provider.dart';
import '../../../sharedPreference/sharedpreference_constant.dart';
import '../../../sharedPreference/sharedpreference_helper.dart';
import '../../../utils/app_color_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePasswordText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePasswordText = !_obscurePasswordText;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
          backgroundColor: AppColorConstant.white,
          body: Consumer<AuthProvider>(builder: (context, authProvider, _) {
            return SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 55, 20, 20),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          child: ConstrainedBox(
                            constraints:
                            BoxConstraints(minHeight: constraints.maxHeight),
                            child: IntrinsicHeight(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Center(
                                    child: SvgPicture.asset(
                                      'assets/images/campus_logo.svg',
                                      width: screenSize.width * 0.45,
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  Center(
                                    child: Text(
                                      "Login",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Center(
                                    child: Text(
                                      "Enter your email address and password to continue",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  const _Label("Email Address"),
                                  const SizedBox(height: 8),
                                  Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColorConstant.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0),
                                      child: Center(
                                        // Centers the TextFormField inside the container
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          maxLines: 1,
                                          cursorColor: AppColorConstant.yellow,
                                          controller: _emailController,
                                          onChanged: (value) {},
                                          decoration: InputDecoration(
                                            hintText: "Enter email",
                                            hintStyle: const TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              color: AppColorConstant.gray,
                                            ),
                                            contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0),
                                            border: OutlineInputBorder(
                                              // default border
                                              borderRadius:
                                              BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(
                                                color: AppColorConstant.black,
                                                width: 1.0,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              // when not focused
                                              borderRadius:
                                              BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(
                                                color: AppColorConstant.black,
                                                width: 1.0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              // when focused
                                              borderRadius:
                                              BorderRadius.circular(8.0),
                                              borderSide: BorderSide(
                                                color: AppColorConstant.black,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Password",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Inter",
                                            color: AppColorConstant.black),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          context.goNamed(RouteConstant.FORGOT_PASSWORD_SCREEN);
                                        },
                                        child: Text(
                                          "Forgot Password",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: "Inter",
                                            color: AppColorConstant.blue,
                                            decoration: TextDecoration
                                                .underline,
                                            // Adds underline
                                            decorationColor:
                                            AppColorConstant.blue,
                                            // Sets underline color
                                            decorationThickness:
                                            1.5, // Adjusts the thickness of the underline
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    height: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColorConstant.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16.0),
                                      // Adjust horizontal padding
                                      child: Center(
                                        // Centers the TextFormField inside the container
                                        child: TextFormField(
                                          keyboardType: TextInputType.text,
                                          maxLines: 1,
                                          cursorColor: AppColorConstant.yellow,
                                          obscureText: _obscurePasswordText,
                                          controller: _passwordController,
                                          onChanged: (value) {},
                                          decoration: InputDecoration(
                                            hintText: "Enter Password",
                                            hintStyle: const TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w400,
                                              color: AppColorConstant.gray,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                _obscurePasswordText
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                              ),
                                              onPressed: _togglePasswordVisibility,
                                            ),
                                            contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 12.0,
                                                horizontal: 16.0),
                                            border: OutlineInputBorder(
                                              // default border
                                              borderRadius:
                                              BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(
                                                color: AppColorConstant.black,
                                                width: 1.0,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              // when not focused
                                              borderRadius:
                                              BorderRadius.circular(8.0),
                                              borderSide: const BorderSide(
                                                color: AppColorConstant.black,
                                                width: 1.0,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              // when focused
                                              borderRadius:
                                              BorderRadius.circular(8.0),
                                              borderSide: BorderSide(
                                                color: AppColorConstant.black,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (_emailController.text.isEmpty &&
                                            _emailController.text == "") {
                                          ShowToast.showToastError(
                                              "Please enter register email address");
                                        } else if (_passwordController
                                            .text.isEmpty &&
                                            _passwordController.text == "") {
                                          ShowToast.showToastError(
                                              "Please enter password");
                                        } else {
                                          getLogin(
                                              context, _emailController.text,
                                              _passwordController.text);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColorConstant.blue,
                                        minimumSize: const Size.fromHeight(52),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        ),
                                      ),
                                      child: Text("Login",
                                          style:
                                          const TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                  const SizedBox(height: 32),
                                  const Center(
                                    child: Text(
                                      "Don’t have an account?",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context.pushNamed(
                                            RouteConstant.REGISTRATION_SCREEN);
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColorConstant.black,
                                        minimumSize: const Size.fromHeight(52),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10),
                                        ),
                                      ),
                                      child: Text("Signup",
                                          style:
                                          const TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Center(
                                    child: Text(
                                      "OR",
                                      style: TextStyle(
                                          color: Color(0xFF686161)),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      _buildSocialButton(
                                        'assets/images/google_icon.svg',
                                        "Google",
                                      ),
                                      _buildSocialButton(
                                        'assets/images/facebook_icon.svg',
                                        "Facebook",
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (authProvider.isLoading)
                    Container(
                      // width: MediaQuery.of(context).size.width,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height,
                      color: Colors.black.withOpacity(0.0),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColorConstant.blue,
                        ),
                      ),
                    ),
                ],
              ),
            );
          }),
        );
  }

  Widget _buildSocialButton(String iconPath, String label) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: SvgPicture.asset(iconPath, width: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        minimumSize: const Size(140, 52),
      ),
    );
  }

  Future<void> getLogin(BuildContext context,String email,String password,) async {
    final loginProvider = Provider.of<AuthProvider>(context, listen: false);
    await loginProvider.getlogin(context, email, password);
    if (loginProvider.loginResponse?.statusCode == 200 && loginProvider.loginResponse?.status == true) {
      context.goNamed(RouteConstant.HOME_SCREEN);
      //   SharedPreferenceHelper.saveLoginState(true);
      SharedPreferenceHelper.saveData(SharedPreferenceConstant.USER_ID, loginProvider.loginResponse?.data?.userDetails?.id.toString());
      SharedPreferenceHelper.saveData(SharedPreferenceConstant.TOKEN, loginProvider.loginResponse?.data?.token.toString());
    }
  }
}

class _Label extends StatelessWidget {
  final String text;

  const _Label(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    );
  }
}
