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
    as _i45;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i7;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i10;
import '../../features/login/domain/entities/token/token_model.dart' as _i36;
import '../../features/login/domain/repository/login_repository/login_continue_clicked_repository.dart'
    as _i44;
import '../../features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart'
    as _i46;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i56;
import '../../features/membership_information/presentation/bloc/membership_information_bloc.dart'
    as _i14;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i42;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i41;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i43;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i53;
import '../../features/register_account_step_1/presentation/bloc/register_account_step1_bloc.dart'
    as _i18;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_get_local_profile_repository_impl.dart'
    as _i24;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart'
    as _i23;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart'
    as _i25;
import '../../features/setup_profile/presentation/bloc/setup_profile_bloc.dart'
    as _i54;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i31;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i30;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i32;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i26;
import '../../features/terms_and_conditions/presentation/bloc/terms_and_conditions_bloc.dart'
    as _i33;
import '../../localization/generated/l10n.dart' as _i3;
import '../../navigation/app_route.dart' as _i4;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/login_otp_complete_event_repository_impl.dart'
    as _i48;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_token_repository_impl.dart'
    as _i51;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/register_otp_complete_repository_impl.dart'
    as _i20;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/submit_button_clicked_repository_impl.dart'
    as _i28;
import '../../shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart'
    as _i47;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart'
    as _i50;
import '../../shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart'
    as _i19;
import '../../shared/features/otp/domain/repository/otp_repository/submit_button_clicked_repository.dart'
    as _i27;
import '../../shared/features/otp/domain/use_cases/otp_usecase/login_otp_complete_event_usecase.dart'
    as _i49;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart'
    as _i52;
import '../../shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart'
    as _i21;
import '../../shared/features/otp/domain/use_cases/otp_usecase/submit_button_clicked_usecase.dart'
    as _i29;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i55;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i22;
import '../../shared/remote/api-service.dart' as _i37;
import '../../shared/remote/dio_api_service_impl.dart' as _i38;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i5;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i6;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage.dart'
    as _i8;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage_impl.dart'
    as _i9;
import '../../shared/services/local/Hive/profile_local_storage/profile/profile_model.dart'
    as _i17;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage.dart'
    as _i15;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage_impl.dart'
    as _i16;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage.dart'
    as _i34;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage_impl.dart'
    as _i35;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i39;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i40;
import 'locator.dart' as _i57;

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
    gh.factory<_i14.MembershipInformationBloc>(
        () => _i14.MembershipInformationBloc());
    gh.factory<_i15.ProfileLocalStorage>(() => _i16.ProfileLocalStorageImpl());
    gh.factory<_i17.ProfileModel>(() => _i17.ProfileModel(
          workPermitNumber: gh<String>(),
          idNumber: gh<String>(),
          emailAddress: gh<String>(),
          phoneNumber: gh<String>(),
          surname: gh<String>(),
          firstName: gh<String>(),
          passportNumber: gh<String>(),
        ));
    gh.factory<_i18.RegisterAccountStep1Bloc>(
        () => _i18.RegisterAccountStep1Bloc());
    gh.factory<_i19.RegisterOTPCompleteRepository>(() =>
        _i20.RegisterOTPCompleteRepositoryImpl(
            profileLocalStorage: gh<_i15.ProfileLocalStorage>()));
    gh.factory<_i21.RegisterOTPCompleteUseCase>(() =>
        _i21.RegisterOTPCompleteUseCase(
            registerOTPCompleteEventRepository:
                gh<_i19.RegisterOTPCompleteRepository>()));
    gh.factory<_i22.ResendOTPBloc>(() => _i22.ResendOTPBloc());
    gh.factory<_i23.SetupProfileGetLocalProfileRepository>(() =>
        _i24.SetupProfileGetLocalProfileRepositoryImpl(
            profileLocalStorage: gh<_i15.ProfileLocalStorage>()));
    gh.factory<_i25.SetupProfileGetLocalProfileUseCase>(() =>
        _i25.SetupProfileGetLocalProfileUseCase(
            setupProfileGetLocalProfileRepository:
                gh<_i23.SetupProfileGetLocalProfileRepository>()));
    gh.factory<_i26.SignUpBloc>(() => _i26.SignUpBloc());
    gh.factory<_i27.SubmitButtonClickedRepository>(
        () => _i28.SubmitButtonClickedRepositoryImpl());
    gh.factory<_i29.SubmitButtonClickedUsecase>(
        () => _i29.SubmitButtonClickedUsecase());
    gh.factory<_i30.SubmitSignUpRepository>(
        () => _i31.SubmitSignUpRepositoryImpl());
    gh.factory<_i32.SubmitSignUpUseCase>(() => _i32.SubmitSignUpUseCase(
        submitSignUpRepository: gh<_i30.SubmitSignUpRepository>()));
    gh.factory<_i33.TermsAndConditionsBloc>(
        () => _i33.TermsAndConditionsBloc());
    gh.factory<_i34.TokenLocalStorage>(() => _i35.TokenLocalStorageImpl());
    gh.factory<_i36.TokenModel>(() => _i36.TokenModel(
          refreshToken: gh<String>(),
          accessToken: gh<String>(),
          tokenID: gh<String>(),
        ));
    gh.singleton<_i37.ApiService>(_i38.DioApiService(dio: gh<_i11.Dio>()));
    gh.singleton<_i39.Authentication>(
        _i40.PFirebaseAuthentication(firebaseAuth: gh<_i12.FirebaseAuth>()));
    gh.factory<_i41.ContinueClickedRepository>(() =>
        _i42.ContinueClickedRepositoryImpl(
            authentication: gh<_i39.Authentication>()));
    gh.factory<_i43.ContinueClickedUseCase>(() => _i43.ContinueClickedUseCase(
        continueClickedRepository: gh<_i41.ContinueClickedRepository>()));
    gh.factory<_i44.LoginContinueClickedRepository>(() =>
        _i45.LoginContinueClickedRepositoryImpl(
            authentication: gh<_i39.Authentication>()));
    gh.factory<_i46.LoginContinueClickedUseCase>(() =>
        _i46.LoginContinueClickedUseCase(
            loginContinueClickedRepository:
                gh<_i44.LoginContinueClickedRepository>()));
    gh.factory<_i47.LoginOTPCompleteEventRepository>(() =>
        _i48.LoginOTPCompleteEventRepositoryImpl(
            profileLocalStorage: gh<_i15.ProfileLocalStorage>()));
    gh.factory<_i49.LoginOTPCompleteEventUseCase>(() =>
        _i49.LoginOTPCompleteEventUseCase(
            loginOTPCompleteEventRepository:
                gh<_i47.LoginOTPCompleteEventRepository>()));
    gh.factory<_i50.OTPGetTokenRepository>(() => _i51.OTPGetTokenRepositoryImpl(
        authentication: gh<_i39.Authentication>()));
    gh.factory<_i52.OTPGetTokenUseCase>(() => _i52.OTPGetTokenUseCase(
        oTPGetTokenRepository: gh<_i50.OTPGetTokenRepository>()));
    gh.factory<_i53.RegisterBloc>(() => _i53.RegisterBloc(
        continueClickedUseCase: gh<_i43.ContinueClickedUseCase>()));
    gh.factory<_i54.SetupProfileBloc>(() => _i54.SetupProfileBloc(
        setupProfileGetLocalProfileUseCase:
            gh<_i25.SetupProfileGetLocalProfileUseCase>()));
    gh.factory<_i55.otpBloc>(() => _i55.otpBloc(
          registerOTPCompleteUseCase: gh<_i21.RegisterOTPCompleteUseCase>(),
          otpGetTokenUseCase: gh<_i52.OTPGetTokenUseCase>(),
        ));
    gh.factory<_i56.LoginBloc>(() => _i56.LoginBloc(
        loginContinueClickedUsecase: gh<_i46.LoginContinueClickedUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i57.RegisterModule {}
