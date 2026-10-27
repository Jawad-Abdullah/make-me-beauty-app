import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/app_widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    required this.onContinue,
    required this.onRegister,
    super.key,
  });

  final VoidCallback onContinue;
  final VoidCallback onRegister;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  const BrandMark(size: 70),
                  const SizedBox(height: 15),
                  const Text(
                    'Make Me',
                    style: TextStyle(
                      color: blush,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 42),
                  const AppTextField(
                    hint: 'Email address',
                    icon: Icons.mail_outline_rounded,
                  ),
                  const SizedBox(height: 14),
                  TextField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock_outline_rounded),
                      suffixIcon: IconButton(
                        onPressed: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xFFF1E8EA)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Color(0xFFF1E8EA)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: blush),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () =>
                          showAppMessage(context, 'Password reset'),
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(color: blush, fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  PrimaryButton(label: 'SIGN IN', onPressed: widget.onContinue),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 22),
                    child: Text(
                      'or sign in with',
                      style: TextStyle(color: muted, fontSize: 12),
                    ),
                  ),
                  Row(
                    children: [
                      SocialButton(
                        icon: const Text('G',
                            style: TextStyle(
                                color: Color(0xFF4285F4),
                                fontWeight: FontWeight.bold,
                                fontSize: 17)),
                        onTap: widget.onContinue,
                      ),
                      const SizedBox(width: 12),
                      SocialButton(
                        icon: const Icon(Icons.facebook_rounded,
                            color: Color(0xFF1877F2), size: 19),
                        onTap: widget.onContinue,
                      ),
                      const SizedBox(width: 12),
                      SocialButton(
                        icon: const Icon(Icons.apple, color: ink, size: 20),
                        onTap: widget.onContinue,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      const Text(
                        'Don’t have an account yet? ',
                        style: TextStyle(fontSize: 12, color: muted),
                      ),
                      GestureDetector(
                        onTap: widget.onRegister,
                        child: const Text(
                          'REGISTER',
                          style: TextStyle(
                            color: blush,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
