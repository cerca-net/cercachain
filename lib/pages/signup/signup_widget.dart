import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Auth0 configuration variables - replace with your own
const String auth0Domain = 'YOUR_AUTH0_DOMAIN';
const String auth0ClientId = 'YOUR_AUTH0_CLIENT_ID';
const String auth0RedirectUri = 'YOUR_AUTH0_REDIRECT_URI';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isBusy = false;
  String? _errorMessage;

  final FlutterAppAuth _appAuth = const FlutterAppAuth();
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<void> _signup() async {
    try {
      setState(() {
        _isBusy = true;
        _errorMessage = null;
      });

      // Auth0 doesn't directly support signup via authorizeAndExchangeCode.
      // Typically, signup is handled through a separate API or database.
      // For this example, I'm assuming a signup API exists.

      // Call to a make believe signup API endpoint

       setState(() {
          _errorMessage = 'Signup completed. Please login.';
          _isBusy = false;
        });

       Navigator.pushNamed(context, '/'); // Replace with your home route

    } catch (e, s) {
      print('Signup error: $e - stack: $s');
      setState(() {
        _isBusy = false;
        _errorMessage = 'An error occurred during signup.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: _isBusy
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //Remove Email and Password form fields
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _signup,
                      child: const Text('Sign Up with Auth0'),
                    ),
                    if (_errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          _errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ),
            ),
    );
  }
}