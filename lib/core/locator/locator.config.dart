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
import '../../features/login/data/repository_impl/login_repository_impl/login_continue_clicked_repository_impl.dart'
    as _i30;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i7;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i10;
import '../../features/login/domain/entities/token/token_model.dart' as _i21;
import '../../features/login/domain/repository/login_repository/login_continue_clicked_repository.dart'
    as _i29;
import '../../features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart'
    as _i31;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i37;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i27;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i26;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i28;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i35;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i17;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i16;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i18;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i15;
import '../../localization/generated/l10n.dart' as _i3;
import '../../navigation/app_route.dart' as _i4;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_token_repository_impl.dart'
    as _i33;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart'
    as _i32;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart'
    as _i34;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i36;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i14;
import '../../shared/remote/api-service.dart' as _i22;
import '../../shared/remote/dio_api_service_impl.dart' as _i23;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i5;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i6;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage.dart'
    as _i8;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage_impl.dart'
    as _i9;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage.dart'
    as _i19;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage_impl.dart'
    as _i20;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i24;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i25;
import 'locator.dart' as _i38;

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
    gh.factory<_i14.ResendOTPBloc>(() => _i14.ResendOTPBloc());
    gh.factory<_i15.SignUpBloc>(() => _i15.SignUpBloc());
    gh.factory<_i16.SubmitSignUpRepository>(
        () => _i17.SubmitSignUpRepositoryImpl());
    gh.factory<_i18.SubmitSignUpUseCase>(() => _i18.SubmitSignUpUseCase(
        submitSignUpRepository: gh<_i16.SubmitSignUpRepository>()));
    gh.factory<_i19.TokenLocalStorage>(() => _i20.TokenLocalStorageImpl());
    gh.factory<_i21.TokenModel>(() => _i21.TokenModel(
          refreshToken: gh<String>(),
          accessToken: gh<String>(),
          tokenID: gh<String>(),
        ));
    gh.singleton<_i22.ApiService>(_i23.DioApiService(dio: gh<_i11.Dio>()));
    gh.factory<_i24.Authentication>(() =>
        _i25.PFirebaseAuthentication(firebaseAuth: gh<_i12.FirebaseAuth>()));
    gh.factory<_i26.ContinueClickedRepository>(() =>
        _i27.ContinueClickedRepositoryImpl(
            authentication: gh<_i24.Authentication>()));
    gh.factory<_i28.ContinueClickedUseCase>(() => _i28.ContinueClickedUseCase(
        continueClickedRepository: gh<_i26.ContinueClickedRepository>()));
    gh.factory<_i29.LoginContinueClickedRepository>(() =>
        _i30.LoginContinueClickedRepositoryImpl(
            authentication: gh<_i24.Authentication>()));
    gh.factory<_i31.LoginContinueClickedUseCase>(() =>
        _i31.LoginContinueClickedUseCase(
            loginContinueClickedRepository:
                gh<_i29.LoginContinueClickedRepository>()));
    gh.factory<_i32.OTPGetTokenRepository>(() =>
        _i33.OTPGetTokenRepositoryImpl(
            authentication: gh<_i24.Authentication>()));
    gh.factory<_i34.OTPGetTokenUseCase>(() => _i34.OTPGetTokenUseCase(
        oTPGetTokenRepository: gh<_i32.OTPGetTokenRepository>()));
    gh.factory<_i35.RegisterBloc>(() => _i35.RegisterBloc(
        continueClickedUseCase: gh<_i28.ContinueClickedUseCase>()));
    gh.factory<_i36.otpBloc>(() => _i36.otpBloc(
        otpGetTokenUseCase: gh<_i34.OTPGetTokenUseCase>()));
    gh.factory<_i37.LoginBloc>(() => _i37.LoginBloc(
        loginContinueClickedUsecase: gh<_i31.LoginContinueClickedUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i38.RegisterModule {}
