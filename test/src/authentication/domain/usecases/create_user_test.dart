// 1. What does the class depend on
// - AuthenticationRepository

// 2. How can we create a fake version of the dependency
// - Use Mocktail

// 3. How do we control what our dependency do
// - Using the Mocktail's API

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_training/src/authentication/domain/repositories/auth_repository.dart';
import 'package:tdd_training/src/authentication/domain/usecases/create_user.dart';

import 'auth_repository.mock.dart';

void main() {
  late CreateUser usecase;
  late AuthenticationRepository repository;

  setUpAll(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
  });

  const params = CreateUserParams.empty();
  test(
    'Should call the [AuthRepo.createUser]',
    () async {
      // 1. Arrange
      when(
        () => repository.createUser(
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
        ),
      ).thenAnswer((_) async => const Right(null));

      // 2. Act
      final result = await usecase(params);

      // 3. Assert
      expect(result, equals(const Right<dynamic, void>(null)));
      verify(
        () => repository.createUser(
          createdAt: any(named: 'createdAt'),
          name: any(named: 'name'),
          avatar: any(named: 'avatar'),
        ),
      ).called(1);

      verifyNoMoreInteractions(repository);
    },
  );
}
