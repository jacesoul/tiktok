import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/login_screen.dart';
import 'package:tiktok/features/authentication/username_screen.dart';
import 'package:tiktok/features/authentication/view_models/social_auth_view_model.dart';
import 'package:tiktok/features/authentication/widgets/auth_button.dart';
import 'package:tiktok/generated/l10n.dart';
import 'package:tiktok/utils.dart';

class SignUpScreen extends ConsumerWidget {
  static String routeName = "signup";
  static String routeURL = "/";
  const SignUpScreen({super.key});

  // PageRouteBuilder는 page route에 animation, duration등을 설정할 수 있게 해주는 위젯이다.
  void _onLoginTap(BuildContext context) async {
    context.pushNamed(LoginScreen.routeName);
  }

  void _onEmailTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UsernameScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    S.of(context).signUpTitle(
                          "TikTok",
                        ),
                    style: GoogleFonts.mulish(
                      textStyle:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: Sizes.size28,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                  ),
                  Gaps.v20,
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      S.of(context).signUpSubtitle(12),
                      style: const TextStyle(
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
                      child: AuthButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.user,
                        ),
                        text: S.of(context).emailPasswordButton,
                      ),
                    ),
                    Gaps.v16,
                    GestureDetector(
                      onTap: () => ref
                          .read(socialAuthViewModelProvider.notifier)
                          .githubSignIn(context),
                      child: const AuthButton(
                          icon: FaIcon(
                            FontAwesomeIcons.github,
                          ),
                          text: "Continue with Github"),
                    ),
                  ],
                  if (orientation == Orientation.landscape)
                    Row(
                      children: [
                        // FractionallySizedBox가 Row 안에 있다면 Expanded로 감싸줘야 한다. 그럼 Expanded가 부모로서 크기를 결정한다.
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _onEmailTap(context),
                            child: AuthButton(
                              icon: const FaIcon(
                                FontAwesomeIcons.user,
                              ),
                              text: S.of(context).emailPasswordButton,
                            ),
                          ),
                        ),
                        Gaps.h16,
                        Expanded(
                          child: AuthButton(
                            icon: const FaIcon(
                              FontAwesomeIcons.apple,
                            ),
                            text: S.of(context).appleButton,
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            // shadow를 없애준다.
            color: isDarkMode(context) ? null : Colors.grey.shade50,
            child: Padding(
              padding: const EdgeInsets.only(
                top: Sizes.size36,
                bottom: Sizes.size60,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).alreadyHaveAnAccount,
                  ),
                  Gaps.h5,
                  GestureDetector(
                    onTap: () => _onLoginTap(context),
                    child: Text(
                      S.of(context).logIn("female"),
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
