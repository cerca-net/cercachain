import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cercaend/main.dart'; // Assuming main.dart is in the lib directory
import 'package:cercaend/pages/login/login_widget.dart';
import 'package:cercaend/pages/userpage/userpage_widget.dart';

// Mock classes (you may need to adjust these based on your Auth0 implementation)
class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late MockFlutterSecureStorage mockSecureStorage;

  setUp(() {
    mockSecureStorage = MockFlutterSecureStorage();
  });

  Widget createWidgetUnderTest() {
    return const MaterialApp(
      home: AuthGate(), // Assuming AuthGate is the entry point of your app
    );
  }

  testWidgets('Successful login redirects to user page', (WidgetTester tester) async {
    // Mock successful token retrieval
    when(mockSecureStorage.read(key: 'id_token')).thenAnswer((_) => Future.value('mock_id_token'));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle(); // Wait for navigation to complete

    expect(find.byType(UserpageWidget), findsOneWidget(), reason: 'Should be on the user page');
  });

  testWidgets('Unsuccessful login shows login page', (WidgetTester tester) async {
    // Mock no tokens found
    when(mockSecureStorage.read(key: 'id_token')).thenAnswer((_) => Future.value(null));

    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pumpAndSettle();

    expect(find.byType(LoginWidget), findsOneWidget(), reason: 'Should be on the login page');
  });

  // Add more tests for logout and token persistence as needed
}