import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok/constants/gaps.dart';
import 'package:tiktok/constants/sizes.dart';
import 'package:tiktok/features/authentication/widgets/form_button.dart';

import 'birthday_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    // _passwordController와 관련된 이벤트 리스너들을 지운다.
    _passwordController.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.length > 8 && _password.isNotEmpty;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Sign Up",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v20,
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _passwordController,
                obscureText: _obscureText,
                onEditingComplete: _onSubmit,
                autocorrect: false,
                decoration: InputDecoration(
                  suffix: Row(mainAxisSize: MainAxisSize.min, children: [
                    GestureDetector(
                      onTap: _onClearTap,
                      child: FaIcon(
                        FontAwesomeIcons.solidCircleXmark,
                        color: Colors.grey.shade500,
                        size: Sizes.size20,
                      ),
                    ),
                    Gaps.h10,
                    GestureDetector(
                      onTap: _toggleObscureText,
                      child: FaIcon(
                        _obscureText
                            ? FontAwesomeIcons.eye
                            : FontAwesomeIcons.eyeSlash,
                        color: Colors.grey.shade500,
                        size: Sizes.size20,
                      ),
                    ),
                  ]),
                  hintText: "Make it strong!",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v16,
              Text("Your password must have:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.size14,
                    color: Colors.grey.shade500,
                  )),
              Gaps.v10,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    color: _isPasswordValid()
                        ? Colors.green
                        : Colors.grey.shade400,
                    size: Sizes.size20,
                  ),
                  Gaps.h5,
                  const Text(
                    "8 to 20 characters",
                    style: TextStyle(
                      fontSize: Sizes.size14,
                    ),
                  ),
                ],
              ),
              Gaps.v28,
              GestureDetector(
                  onTap: _onSubmit,
                  child: FormButton(disabled: !_isPasswordValid())),
            ],
          ),
        ),
      ),
    );
  }
}
