// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i11;
import 'package:firebase_auth/firebase_auth.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/landing/presentation/bloc/landing_bloc.dart' as _i13;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i7;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i10;
import '../../features/login/domain/entities/token/token_model.dart' as _i22;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i14;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i28;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i27;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i29;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i33;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i18;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i17;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i19;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i16;
import '../../localization/generated/l10n.dart' as _i3;
import '../../navigation/app_route.dart' as _i4;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_credential_repository_impl.dart'
    as _i31;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_credential_repository.dart'
    as _i30;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_credential_usecase.dart'
    as _i32;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i34;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i15;
import '../../shared/remote/api-service.dart' as _i23;
import '../../shared/remote/dio_api_service_impl.dart' as _i24;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i5;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i6;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage.dart'
    as _i8;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage_impl.dart'
    as _i9;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage.dart'
    as _i20;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage_impl.dart'
    as _i21;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i25;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i26;
import 'locator.dart' as _i35;

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
    final registerModule = _$RegisterModule();
    gh.factory<_i3.AppLocalizations>(() => registerModule.appLocalizations);
    gh.lazySingleton<_i4.AppRouter>(() => _i4.AppRouter());
    gh.factory<_i5.AppStateLocalStorage>(() => _i6.AppStateLocalStorageImpl());
    gh.factory<_i7.AppStateModel>(
        () => _i7.AppStateModel(loggedIn: gh<bool>()));
    gh.singleton<_i8.BiometricsLocalStorage>(_i9.BiometricsLocalStorageImpl());
    gh.factory<_i10.BiometricsModel>(
        () => _i10.BiometricsModel(biometrics: gh<bool>()));
    gh.factory<_i11.Dio>(() => registerModule.dio);
    gh.singleton<_i12.FirebaseAuth>(registerModule.firebaseAuth);
    gh.factory<_i13.LandingBloc>(() => _i13.LandingBloc());
    gh.factory<_i14.LoginBloc>(() => _i14.LoginBloc());
    gh.factory<_i15.ResendOTPBloc>(() => _i15.ResendOTPBloc());
    gh.factory<_i16.SignUpBloc>(() => _i16.SignUpBloc());
    gh.factory<_i17.SubmitSignUpRepository>(
        () => _i18.SubmitSignUpRepositoryImpl());
    gh.factory<_i19.SubmitSignUpUseCase>(() => _i19.SubmitSignUpUseCase(
        submitSignUpRepository: gh<_i17.SubmitSignUpRepository>()));
    gh.factory<_i20.TokenLocalStorage>(() => _i21.TokenLocalStorageImpl());
    gh.factory<_i22.TokenModel>(() => _i22.TokenModel(
          refreshToken: gh<String>(),
          accessToken: gh<String>(),
          tokenID: gh<String>(),
        ));
    gh.singleton<_i23.ApiService>(_i24.DioApiService(dio: gh<_i11.Dio>()));
    gh.factory<_i25.Authentication>(() =>
        _i26.PFirebaseAuthentication(firebaseAuth: gh<_i12.FirebaseAuth>()));
    gh.factory<_i27.ContinueClickedRepository>(() =>
        _i28.ContinueClickedRepositoryImpl(
            authentication: gh<_i25.Authentication>()));
    gh.factory<_i29.ContinueClickedUseCase>(() => _i29.ContinueClickedUseCase(
        continueClickedRepository: gh<_i27.ContinueClickedRepository>()));
    gh.factory<_i30.OTPGetCredentialRepository>(() =>
        _i31.OTPGetCredentialRepositoryImpl(
            authentication: gh<_i25.Authentication>()));
    gh.factory<_i32.OTPGetCredentialUseCase>(() => _i32.OTPGetCredentialUseCase(
        oTPGetCredentialRepository: gh<_i30.OTPGetCredentialRepository>()));
    gh.factory<_i33.RegisterBloc>(() => _i33.RegisterBloc(
        continueClickedUseCase: gh<_i29.ContinueClickedUseCase>()));
    gh.factory<_i34.otpBloc>(() => _i34.otpBloc(
        otpGetCredentialUseCase: gh<_i32.OTPGetCredentialUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i35.RegisterModule {}
