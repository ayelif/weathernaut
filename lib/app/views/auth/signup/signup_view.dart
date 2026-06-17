import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathernaut/app/routes/app_router.dart';
import 'package:weathernaut/app/views/auth/bloc/auth_bloc.dart';
import 'package:weathernaut/core/base/background_view.dart';
import 'package:weathernaut/core/extensions/context_extension.dart';
import 'package:weathernaut/core/resources/resources.g.dart';
import 'package:weathernaut/core/widgets/inputs/custom_text_form_field.dart';

@RoutePage()
class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.t.auth.errorEmptyFields)),
      );
      return;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.t.auth.errorInvalidEmail)),
      );
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.t.auth.errorPasswordTooShort)),
      );
      return;
    }

    context.read<AuthBloc>().add(SignUpRequested(email, password, name));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          context.router.replace(const MainWrapperRoute());
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is AuthLoading;

        return BackgroundView(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      context.t.auth.createAccount,
                      style: context.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      context.t.auth.signUpToGetStarted,
                      style: context.textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomTextFormField(
                      hintText: context.t.auth.fullName,
                      prefixIcon: Icons.person_outline_rounded,
                      controller: _nameController,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      hintText: context.t.auth.email,
                      prefixIcon: Icons.email_outlined,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 16),
                    CustomTextFormField(
                      hintText: context.t.auth.password,
                      prefixIcon: Icons.lock_outline_rounded,
                      obscureText: true,
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isLoading ? null : _submit,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : Text(
                                context.t.auth.signUp,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          context.t.auth.alreadyHaveAccount,
                          style: context.textTheme.bodyLarge,
                        ),
                        TextButton(
                          onPressed: () => context.router.pop(),
                          child: Text(context.t.auth.signIn),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
