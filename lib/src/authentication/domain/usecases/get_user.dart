import 'package:tdd_training/core/usescase/usecase.dart';
import 'package:tdd_training/core/utils/typedef.dart';
import 'package:tdd_training/src/authentication/domain/entities/user.dart';
import 'package:tdd_training/src/authentication/domain/repositories/auth_repository.dart';

class GetUsers extends UsecaseWithoutParams<List<User>> {
  const GetUsers(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFuture<List<User>> call() async => _repository.getUsers();
}
