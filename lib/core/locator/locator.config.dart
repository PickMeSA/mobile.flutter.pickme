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
    as _i39;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i7;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i10;
import '../../features/login/domain/entities/token/token_model.dart' as _i30;
import '../../features/login/domain/repository/login_repository/login_continue_clicked_repository.dart'
    as _i38;
import '../../features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart'
    as _i40;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i50;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i36;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i35;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i37;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i47;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_get_local_profile_repository_impl.dart'
    as _i22;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart'
    as _i21;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart'
    as _i23;
import '../../features/setup_profile/presentation/bloc/setup_profile_bloc.dart'
    as _i48;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i26;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i25;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i27;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i24;
import '../../localization/generated/l10n.dart' as _i3;
import '../../navigation/app_route.dart' as _i4;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/login_otp_complete_event_repository_impl.dart'
    as _i42;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_token_repository_impl.dart'
    as _i45;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/register_otp_complete_repository_impl.dart'
    as _i18;
import '../../shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart'
    as _i41;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart'
    as _i44;
import '../../shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart'
    as _i17;
import '../../shared/features/otp/domain/use_cases/otp_usecase/login_otp_complete_event_usecase.dart'
    as _i43;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart'
    as _i46;
import '../../shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart'
    as _i19;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i49;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i20;
import '../../shared/remote/api-service.dart' as _i31;
import '../../shared/remote/dio_api_service_impl.dart' as _i32;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i5;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i6;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage.dart'
    as _i8;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage_impl.dart'
    as _i9;
import '../../shared/services/local/Hive/profile_local_storage/profile/profile_model.dart'
    as _i16;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage.dart'
    as _i14;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage_impl.dart'
    as _i15;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage.dart'
    as _i28;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage_impl.dart'
    as _i29;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i33;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i34;
import 'locator.dart' as _i51;

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
    gh.factory<_i14.ProfileLocalStorage>(() => _i15.ProfileLocalStorageImpl());
    gh.factory<_i16.ProfileModel>(() => _i16.ProfileModel(
          workPermitNumber: gh<String>(),
          idNumber: gh<String>(),
          emailAddress: gh<String>(),
          phoneNumber: gh<String>(),
          surname: gh<String>(),
          firstName: gh<String>(),
          passportNumber: gh<String>(),
        ));
    gh.factory<_i17.RegisterOTPCompleteRepository>(() =>
        _i18.RegisterOTPCompleteRepositoryImpl(
            profileLocalStorage: gh<_i14.ProfileLocalStorage>()));
    gh.factory<_i19.RegisterOTPCompleteUseCase>(() =>
        _i19.RegisterOTPCompleteUseCase(
            registerOTPCompleteEventRepository:
                gh<_i17.RegisterOTPCompleteRepository>()));
    gh.factory<_i20.ResendOTPBloc>(() => _i20.ResendOTPBloc());
    gh.factory<_i21.SetupProfileGetLocalProfileRepository>(() =>
        _i22.SetupProfileGetLocalProfileRepositoryImpl(
            profileLocalStorage: gh<_i14.ProfileLocalStorage>()));
    gh.factory<_i23.SetupProfileGetLocalProfileUseCase>(() =>
        _i23.SetupProfileGetLocalProfileUseCase(
            setupProfileGetLocalProfileRepository:
                gh<_i21.SetupProfileGetLocalProfileRepository>()));
    gh.factory<_i24.SignUpBloc>(() => _i24.SignUpBloc());
    gh.factory<_i25.SubmitSignUpRepository>(
        () => _i26.SubmitSignUpRepositoryImpl());
    gh.factory<_i27.SubmitSignUpUseCase>(() => _i27.SubmitSignUpUseCase(
        submitSignUpRepository: gh<_i25.SubmitSignUpRepository>()));
    gh.factory<_i28.TokenLocalStorage>(() => _i29.TokenLocalStorageImpl());
    gh.factory<_i30.TokenModel>(() => _i30.TokenModel(
          refreshToken: gh<String>(),
          accessToken: gh<String>(),
          tokenID: gh<String>(),
        ));
    gh.singleton<_i31.ApiService>(_i32.DioApiService(dio: gh<_i11.Dio>()));
    gh.singleton<_i33.Authentication>(
        _i34.PFirebaseAuthentication(firebaseAuth: gh<_i12.FirebaseAuth>()));
    gh.factory<_i35.ContinueClickedRepository>(() =>
        _i36.ContinueClickedRepositoryImpl(
            authentication: gh<_i33.Authentication>()));
    gh.factory<_i37.ContinueClickedUseCase>(() => _i37.ContinueClickedUseCase(
        continueClickedRepository: gh<_i35.ContinueClickedRepository>()));
    gh.factory<_i38.LoginContinueClickedRepository>(() =>
        _i39.LoginContinueClickedRepositoryImpl(
            authentication: gh<_i33.Authentication>()));
    gh.factory<_i40.LoginContinueClickedUseCase>(() =>
        _i40.LoginContinueClickedUseCase(
            loginContinueClickedRepository:
                gh<_i38.LoginContinueClickedRepository>()));
    gh.factory<_i41.LoginOTPCompleteEventRepository>(() =>
        _i42.LoginOTPCompleteEventRepositoryImpl(
            profileLocalStorage: gh<_i14.ProfileLocalStorage>()));
    gh.factory<_i43.LoginOTPCompleteEventUseCase>(() =>
        _i43.LoginOTPCompleteEventUseCase(
            loginOTPCompleteEventRepository:
                gh<_i41.LoginOTPCompleteEventRepository>()));
    gh.factory<_i44.OTPGetTokenRepository>(() => _i45.OTPGetTokenRepositoryImpl(
        authentication: gh<_i33.Authentication>()));
    gh.factory<_i46.OTPGetTokenUseCase>(() => _i46.OTPGetTokenUseCase(
        oTPGetTokenRepository: gh<_i44.OTPGetTokenRepository>()));
    gh.factory<_i47.RegisterBloc>(() => _i47.RegisterBloc(
        continueClickedUseCase: gh<_i37.ContinueClickedUseCase>()));
    gh.factory<_i48.SetupProfileBloc>(() => _i48.SetupProfileBloc(
        setupProfileGetLocalProfileUseCase:
            gh<_i23.SetupProfileGetLocalProfileUseCase>()));
    gh.factory<_i49.otpBloc>(() => _i49.otpBloc(
          registerOTPCompleteUseCase: gh<_i19.RegisterOTPCompleteUseCase>(),
          otpGetTokenUseCase: gh<_i46.OTPGetTokenUseCase>(),
        ));
    gh.factory<_i50.LoginBloc>(() => _i50.LoginBloc(
        loginContinueClickedUsecase: gh<_i40.LoginContinueClickedUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i51.RegisterModule {}
