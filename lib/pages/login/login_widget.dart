import 'package:flutter/material.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Auth0 configuration variables - replace with your own
const String auth0Domain = 'YOUR_AUTH0_DOMAIN';
const String auth0ClientId = 'YOUR_AUTH0_CLIENT_ID';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
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

  Future<void> _login() async {
    try {
      setState(() {
        _isBusy = true;
        _errorMessage = null;
      });

      final AuthorizationTokenResponse result = await _appAuth
          .authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          auth0ClientId,
          'YOUR_AUTH0_REDIRECT_URI',
          issuer: 'https://$auth0Domain',
          scopes: ['openid', 'profile', 'email', 'offline_access'],
          promptValues: ['login'],
        ),
      );

      //  Successful login - process the result
      Navigator.pushNamed(context, '/'); // Replace with your home route
        } catch (e, s) {
      print('Login error: $e - stack: $s');
      setState(() {
        _isBusy = false;
        _errorMessage = 'An error occurred during login.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
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
                    //Removed email and password form fields
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _login,
                      child: const Text('Login with Auth0'),
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
