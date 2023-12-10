import 'package:equatable/equatable.dart';
import 'package:tdd_training/core/usescase/usecase.dart';
import 'package:tdd_training/core/utils/typedef.dart';
import 'package:tdd_training/src/authentication/domain/repositories/auth_repository.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultVoid call(CreateUserParams params) async => _repository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar,
      );
}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.createdAt,
    required this.name,
    required this.avatar,
  });

  const CreateUserParams.empty()
      : createdAt = 'empty_createdAt',
        name = 'empty_name',
        avatar = 'empty_avatar';

  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [createdAt, name, avatar];
}
