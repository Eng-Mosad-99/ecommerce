// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_sources/remote/auth_remote_data_source.dart' as _i865;
import '../../data/data_sources/remote/impl/auth_remote_data_source_impl.dart'
    as _i335;
import '../../data/repos/auth_repo_impl.dart' as _i666;
import '../../domain/repo/auth/auth_repo.dart' as _i894;
import '../../domain/use_cases/register_use_case.dart' as _i479;
import '../../features/ui/auth/register/cubit/register_view_model.dart'
    as _i873;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i865.AuthRemoteDataSource>(() =>
        _i335.AuthRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i894.AuthRepo>(() =>
        _i666.AuthRepoImpl(remoteDataSource: gh<_i865.AuthRemoteDataSource>()));
    gh.factory<_i479.RegisterUseCase>(
        () => _i479.RegisterUseCase(authRepo: gh<_i894.AuthRepo>()));
    gh.factory<_i873.RegisterViewModel>(
        () => _i873.RegisterViewModel(gh<_i479.RegisterUseCase>()));
    return this;
  }
}
