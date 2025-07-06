import 'package:dartz/dartz.dart';
import 'package:e_commerece_online_c13/core/errors/failures.dart';
import 'package:e_commerece_online_c13/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:e_commerece_online_c13/domain/entities/register_response_entity.dart';
import 'package:e_commerece_online_c13/domain/repo/auth/auth_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepoImpl({required this.remoteDataSource});
  @override
  Future<Either<Failures, RegisterResponseEntity>> register(String name,
      String email, String password, String rePassword, String phone) async {
    var either = await remoteDataSource.register(
        name, email, password, rePassword, phone);
    return either.fold(
      (error) => left(error),
      (response) => right(response),
    );
  }
}
