import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:provider_template/domain/api_failure.dart';
import 'package:provider_template/domain/auth/login_response/login_response.dart';
import 'package:provider_template/infrastructure/auth/i_auth_repo.dart';
import 'package:provider_template/commons/shared_pref/i_shared_pref.dart';
import 'package:provider_template/provider/auth_provider.dart';

class MockAuthRepo extends Mock implements IAuthRepo {}

class MockSharedPref extends Mock implements ISharedPref {}

void main() {
  late AuthProvider authProvider;
  late MockAuthRepo mockAuthRepo;
  late MockSharedPref mockSharedPref;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    mockSharedPref = MockSharedPref();
    authProvider = AuthProvider(repo: mockAuthRepo, sharedPref: mockSharedPref);
  });
  test('initial values are correct', () {
    expect(authProvider.isAuthRequesting, false);
  });

  test(
      'given username and password then success response is given when auth is success',
      () async {
    // Arrange
    const username = 'testuser';
    const password = 'testpassword';
    final loginResponse = LoginResponse();

    when(() => mockAuthRepo.signInUser(username, password))
        .thenAnswer((_) async => Right(loginResponse));
    when(
      () => mockSharedPref.saveLoginData(loginResponse),
    ).thenAnswer((invocation) async {
      return;
    });

    // Act
    final result = await authProvider.loginUser(username, password);

    // Assert
    expect(result, Right(loginResponse));
    verify(() => mockAuthRepo.signInUser(username, password)).called(1);
    verify(() => mockSharedPref.saveLoginData(loginResponse)).called(1);
    verifyNoMoreInteractions(mockAuthRepo);
  });

  test('loginUser returns an ApiFailure on failure', () async {
    // Arrange
    const username = 'testuser';
    const password = 'testpassword';
    const apiFailure = ApiFailure.clientError(message: 'Client Error');

    when(() => mockAuthRepo.signInUser(username, password))
        .thenAnswer((_) async => const Left(apiFailure));

    // Act
    final result = await authProvider.loginUser(username, password);

    // Assert
    expect(result, const Left(apiFailure));
    verify(() => mockAuthRepo.signInUser(username, password)).called(1);
    verifyNoMoreInteractions(mockAuthRepo);
  });
}
