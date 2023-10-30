import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/username_screen.dart';
import 'package:tiktok/features/authentication/login_screen.dart';
import 'package:tiktok/features/authentication/widgets/auth_button.dart';
import 'package:tiktok/utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UsernameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        /* if (orientation == Orientation.landscape) {
          return const Scaffold(
              body: Center(
            child: Text(
              "This screen is not supported in landscape mode",
            ),
          ));
        } */
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size40,
              ),
              child: Column(
                children: [
                  Gaps.v80,
                  // copyWith은 style은 그대로 사용하고 거기에 다른 요소를 추가할수 있다.
                  // headlineSmall이 정의되어 있다는걸 dart에 알려주기 위해 ! 를 추가해줘야한다.
                  Text(
                    "Sign up for TikTok",
                    style: GoogleFonts.lato(
                      textStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: Sizes.size32,
                              ),
                    ),
                  ),
                  Gaps.v20,
                  const Opacity(
                    opacity: 0.7,
                    child: Text(
                      "Create a profile, follow other accounts, make your own videos, and more.",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Gaps.v40,
                  // Collection if와 for는 하나의 대상에만 작동한다.
                  if (orientation == Orientation.portrait) ...[
                    GestureDetector(
                      onTap: () => _onEmailTap(context),
                      child: const AuthButton(
                          icon: FaIcon(
                            FontAwesomeIcons.user,
                          ),
                          text: "Use email & password"),
                    ),
                    Gaps.v16,
                    const AuthButton(
                      icon: FaIcon(
                        FontAwesomeIcons.apple,
                      ),
                      text: "Continue with Apple",
                    ),
                  ],
                  if (orientation == Orientation.landscape)
                    Row(
                      children: [
                        // FractionallySizedBox가 Row 안에 있다면 Expanded로 감싸줘야 한다. 그럼 Expanded가 부모로서 크기를 결정한다.
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _onEmailTap(context),
                            child: const AuthButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.user,
                                ),
                                text: "Use email & password"),
                          ),
                        ),
                        Gaps.h16,
                        const Expanded(
                          child: AuthButton(
                            icon: FaIcon(
                              FontAwesomeIcons.apple,
                            ),
                            text: "Continue with Apple",
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            // shadow를 없애준다.
            elevation: 2,
            color: isDarkMode(context) ? null : Colors.grey.shade50,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Sizes.size36,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  Gaps.h5,
                  GestureDetector(
                    onTap: () => _onLoginTap(context),
                    child: Text(
                      "Log in",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
