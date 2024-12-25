import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sec_me/manager/auth_manager.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late MockHttpClient mockHttpClient;
  late MockSharedPreferences mockSharedPreferences;
  late AuthManager authManager;

  setUp(() {
    mockHttpClient = MockHttpClient();
    mockSharedPreferences = MockSharedPreferences();
    authManager = AuthManager();
  });

  group('AuthManager', () {
    test('login réussi avec des informations valides', () async {
      const email = 'test@example.com';
      const password = 'Password123!';
      final responseMock = http.Response(
        jsonEncode({'token': 'mock_token'}),
        200,
      );

      when(mockHttpClient.post(
        Uri.parse('http://localhost:3000/login'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => responseMock);

      when(mockSharedPreferences.setString('user', jsonEncode(any)))
          .thenAnswer((_) async => true);

      final user = await authManager.login(email, password);

      expect(user, isNotNull);
      expect(user?.token, 'mock_token');
      verify(mockHttpClient.post(
        Uri.parse('http://localhost:3000/login'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      ));
      verify(mockSharedPreferences.setString('user', jsonEncode(user)));
    });

    test('login échoue avec des informations invalides', () async {
      const email = 'test@example.com';
      const password = 'WrongPassword';
      final responseMock = http.Response(
        jsonEncode({'error': 'Invalid credentials'}),
        400,
      );

      when(mockHttpClient.post(
        Uri.parse('http://localhost:3000/login'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => responseMock);

      final user = await authManager.login(email, password);

      expect(user, isNull);
      verify(mockHttpClient.post(
        Uri.parse('http://localhost:3000/login'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      ));
    });

    test('register réussi avec des informations valides', () async {
      const email = 'test@example.com';
      const password = 'Password123!';
      final responseMock = http.Response(
        jsonEncode({'token': 'mock_token'}),
        200,
      );

      when(mockHttpClient.post(
        Uri.parse('http://localhost:3000/register'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => responseMock);

      when(mockSharedPreferences.setString('user', jsonEncode(any)))
          .thenAnswer((_) async => true);

      final user = await authManager.register(email, password);

      expect(user, isNotNull);
      expect(user?.token, 'mock_token');
      verify(mockHttpClient.post(
        Uri.parse('http://localhost:3000/register'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      ));
      verify(mockSharedPreferences.setString(
        'user',
        jsonEncode(any),
      ));
    });

    test('register échoue avec des informations invalides', () async {
      const email = 'test@example.com';
      const password = 'Short';
      final responseMock = http.Response(
        jsonEncode({'error': 'Invalid data'}),
        400,
      );

      when(mockHttpClient.post(
        Uri.parse('http://localhost:3000/register'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer((_) async => responseMock);

      final user = await authManager.register(email, password);

      expect(user, isNull);
      verify(mockHttpClient.post(
        Uri.parse('http://localhost:3000/register'),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      ));
    });

    test('getUser retourne un utilisateur sauvegardé', () async {
      final userJson = jsonEncode({
        'name': 'test@example.com',
        'email': 'test@example.com',
        'password': 'Password123!',
        'token': 'mock_token'
      });
      when(mockSharedPreferences.getString('user')).thenReturn(userJson);

      final user = await authManager.getUser();

      expect(user, isNotNull);
      expect(user?.email, 'test@example.com');
    });

    test('getUser retourne null si aucun utilisateur n\'est sauvegardé',
        () async {
      when(mockSharedPreferences.getString('user')).thenReturn(null);

      final user = await authManager.getUser();

      expect(user, isNull);
    });

    test('logout supprime l\'utilisateur sauvegardé', () async {
      when(mockSharedPreferences.remove('user')).thenAnswer((_) async => true);

      await authManager.logout();

      verify(mockSharedPreferences.remove('user'));
    });
  });
}
