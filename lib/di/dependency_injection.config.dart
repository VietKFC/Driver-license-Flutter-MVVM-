// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:driver_license_test/data/database/database_manager.dart' as _i3;
import 'package:driver_license_test/data/repository/movie_repository.dart'
    as _i7;
import 'package:driver_license_test/data/service/api_service.dart' as _i5;
import 'package:driver_license_test/data/service/api_service_impl.dart' as _i6;
import 'package:driver_license_test/data/service/http_client.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final httpClient = _$HttpClient();
    gh.lazySingleton<_i3.DatabaseProvider>(() => _i3.DatabaseProvider());
    gh.lazySingleton<_i4.Dio>(() => httpClient.dioProvider());
    gh.lazySingleton<String>(
      () => httpClient.baseUrlProvider(),
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<String>(
      () => httpClient.baseImageUrlProvider(),
      instanceName: 'baseImageUrl',
    );
    gh.factory<_i5.ApiService>(() => _i6.ApiServiceImpl(
          gh<_i4.Dio>(),
          baseUrl: gh<String>(instanceName: 'baseUrl'),
        ));
    gh.lazySingleton<_i7.MovieRepository>(
        () => _i7.MovieRepository(gh<_i5.ApiService>()));
    return this;
  }
}

class _$HttpClient extends _i8.HttpClient {}
