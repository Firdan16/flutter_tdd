import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tdd_training/src/authentication/domain/entities/user.dart';
import 'package:tdd_training/src/authentication/domain/repositories/auth_repository.dart';
import 'package:tdd_training/src/authentication/domain/usecases/get_user.dart';

import 'auth_repository.mock.dart';

void main() {
  late AuthenticationRepository repository;
  late GetUsers usecase;

  setUp(() {
    repository = MockAuthRepo();
    usecase = GetUsers(repository);
  });

  const tResponse = [
    User.empty(),
  ];

  test(
    'Should call [AuthRepo.getUsers] and return [List<Users>]',
    () async {
      // 1. Arrange
      when(() => repository.getUsers()).thenAnswer(
        (_) async => const Right(tResponse),
      );

      // 2. Act
      final result = await usecase();

      // 3. Assert
      expect(result, equals(const Right<dynamic, List<User>>(tResponse)));
      verify(() => repository.getUsers()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
