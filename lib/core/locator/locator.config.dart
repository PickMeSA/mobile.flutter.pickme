// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i15;
import 'package:firebase_auth/firebase_auth.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/add_memberships/presentation/bloc/add_memberships_bloc.dart'
    as _i3;
import '../../features/add_qualification/presentation/bloc/add_qualification_bloc.dart'
    as _i4;
import '../../features/add_skills/presentation/bloc/add_skills_bloc.dart'
    as _i5;
import '../../features/add_work_experience/presentation/bloc/add_work_experience_bloc.dart'
    as _i6;
import '../../features/landing/presentation/bloc/landing_bloc.dart' as _i17;
import '../../features/login/data/repository_impl/login_repository_impl/login_continue_clicked_repository_impl.dart'
    as _i48;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i11;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i14;
import '../../features/login/domain/entities/token/token_model.dart' as _i39;
import '../../features/login/domain/repository/login_repository/login_continue_clicked_repository.dart'
    as _i47;
import '../../features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart'
    as _i49;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i61;
import '../../features/membership_information/presentation/bloc/membership_information_bloc.dart'
    as _i18;
import '../../features/qualification/presentation/bloc/qualification_bloc.dart'
    as _i22;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i45;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i44;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i46;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i58;
import '../../features/register_account_step_1/presentation/bloc/register_account_step1_bloc.dart'
    as _i23;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_get_local_profile_repository_impl.dart'
    as _i29;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart'
    as _i28;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart'
    as _i30;
import '../../features/setup_profile/presentation/bloc/setup_profile_bloc.dart'
    as _i59;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i34;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i33;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i35;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i31;
import '../../features/skills_and_industry/presentation/bloc/skills_and_industry_bloc.dart'
    as _i32;
import '../../features/terms_and_conditions/presentation/bloc/terms_and_conditions_bloc.dart'
    as _i36;
import '../../localization/generated/l10n.dart' as _i7;
import '../../navigation/app_route.dart' as _i8;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/login_otp_complete_event_repository_impl.dart'
    as _i51;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_token_repository_impl.dart'
    as _i54;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_save_remote_profile_data_repository_impl.dart'
    as _i63;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/register_otp_complete_repository_impl.dart'
    as _i25;
import '../../shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart'
    as _i50;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart'
    as _i53;
import '../../shared/features/otp/domain/repository/otp_repository/otp_save_remote_profile_data_repository.dart'
    as _i62;
import '../../shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart'
    as _i24;
import '../../shared/features/otp/domain/use_cases/otp_usecase/login_otp_complete_event_usecase.dart'
    as _i52;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart'
    as _i55;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_save_remote_profile_data_usecase.dart'
    as _i64;
import '../../shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart'
    as _i26;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i60;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i27;
import '../../shared/remote/api-service.dart' as _i40;
import '../../shared/remote/dio_api_service_impl.dart' as _i41;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i9;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i10;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage.dart'
    as _i12;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage_impl.dart'
    as _i13;
import '../../shared/services/local/Hive/profile_local_storage/profile/profile_model.dart'
    as _i21;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage.dart'
    as _i19;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage_impl.dart'
    as _i20;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage.dart'
    as _i37;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage_impl.dart'
    as _i38;
import '../../shared/services/remote/api_service/profile_service/profile_service.dart'
    as _i56;
import '../../shared/services/remote/api_service/profile_service/profile_service_impl.dart'
    as _i57;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i42;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i43;
import 'locator.dart' as _i65;

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
    gh.factory<_i3.AddMembershipsBloc>(() => _i3.AddMembershipsBloc());
    gh.factory<_i4.AddQualificationBloc>(() => _i4.AddQualificationBloc());
    gh.factory<_i5.AddSkillsBloc>(() => _i5.AddSkillsBloc());
    gh.factory<_i6.AddWorkExperienceBloc>(() => _i6.AddWorkExperienceBloc());
    gh.factory<_i7.AppLocalizations>(() => registerModule.appLocalizations);
    gh.lazySingleton<_i8.AppRouter>(() => _i8.AppRouter());
    gh.factory<_i9.AppStateLocalStorage>(() => _i10.AppStateLocalStorageImpl());
    gh.factory<_i11.AppStateModel>(
        () => _i11.AppStateModel(loggedIn: gh<bool>()));
    gh.singleton<_i12.BiometricsLocalStorage>(
        _i13.BiometricsLocalStorageImpl());
    gh.factory<_i14.BiometricsModel>(
        () => _i14.BiometricsModel(biometrics: gh<bool>()));
    gh.factory<_i15.Dio>(() => registerModule.dio);
    gh.singleton<_i16.FirebaseAuth>(registerModule.firebaseAuth);
    gh.factory<_i17.LandingBloc>(() => _i17.LandingBloc());
    gh.factory<_i18.MembershipInformationBloc>(
        () => _i18.MembershipInformationBloc());
    gh.factory<_i19.ProfileLocalStorage>(() => _i20.ProfileLocalStorageImpl());
    gh.factory<_i21.ProfileModel>(() => _i21.ProfileModel(
          workPermitNumber: gh<String>(),
          idNumber: gh<String>(),
          emailAddress: gh<String>(),
          phoneNumber: gh<String>(),
          surname: gh<String>(),
          firstName: gh<String>(),
          passportNumber: gh<String>(),
        ));
    gh.factory<_i22.QualificationsBloc>(() => _i22.QualificationsBloc());
    gh.factory<_i23.RegisterAccountStep1Bloc>(
        () => _i23.RegisterAccountStep1Bloc());
    gh.factory<_i24.RegisterOTPCompleteRepository>(() =>
        _i25.RegisterOTPCompleteRepositoryImpl(
            profileLocalStorage: gh<_i19.ProfileLocalStorage>()));
    gh.factory<_i26.RegisterOTPCompleteUseCase>(() =>
        _i26.RegisterOTPCompleteUseCase(
            registerOTPCompleteEventRepository:
                gh<_i24.RegisterOTPCompleteRepository>()));
    gh.factory<_i27.ResendOTPBloc>(() => _i27.ResendOTPBloc());
    gh.factory<_i28.SetupProfileGetLocalProfileRepository>(() =>
        _i29.SetupProfileGetLocalProfileRepositoryImpl(
            profileLocalStorage: gh<_i19.ProfileLocalStorage>()));
    gh.factory<_i30.SetupProfileGetLocalProfileUseCase>(() =>
        _i30.SetupProfileGetLocalProfileUseCase(
            setupProfileGetLocalProfileRepository:
                gh<_i28.SetupProfileGetLocalProfileRepository>()));
    gh.factory<_i31.SignUpBloc>(() => _i31.SignUpBloc());
    gh.factory<_i32.SkillsAndIndustryBloc>(() => _i32.SkillsAndIndustryBloc());
    gh.factory<_i33.SubmitSignUpRepository>(
        () => _i34.SubmitSignUpRepositoryImpl());
    gh.factory<_i35.SubmitSignUpUseCase>(() => _i35.SubmitSignUpUseCase(
        submitSignUpRepository: gh<_i33.SubmitSignUpRepository>()));
    gh.factory<_i36.TermsAndConditionsBloc>(
        () => _i36.TermsAndConditionsBloc());
    gh.factory<_i37.TokenLocalStorage>(() => _i38.TokenLocalStorageImpl());
    gh.factory<_i39.TokenModel>(() => _i39.TokenModel(
          refreshToken: gh<String>(),
          accessToken: gh<String>(),
          tokenID: gh<String>(),
        ));
    gh.singleton<_i40.ApiService>(_i41.DioApiService(dio: gh<_i15.Dio>()));
    gh.singleton<_i42.Authentication>(
        _i43.PFirebaseAuthentication(firebaseAuth: gh<_i16.FirebaseAuth>()));
    gh.factory<_i44.ContinueClickedRepository>(() =>
        _i45.ContinueClickedRepositoryImpl(
            authentication: gh<_i42.Authentication>()));
    gh.factory<_i46.ContinueClickedUseCase>(() => _i46.ContinueClickedUseCase(
        continueClickedRepository: gh<_i44.ContinueClickedRepository>()));
    gh.factory<_i47.LoginContinueClickedRepository>(() =>
        _i48.LoginContinueClickedRepositoryImpl(
            authentication: gh<_i42.Authentication>()));
    gh.factory<_i49.LoginContinueClickedUseCase>(() =>
        _i49.LoginContinueClickedUseCase(
            loginContinueClickedRepository:
                gh<_i47.LoginContinueClickedRepository>()));
    gh.factory<_i50.LoginOTPCompleteEventRepository>(() =>
        _i51.LoginOTPCompleteEventRepositoryImpl(
            profileLocalStorage: gh<_i19.ProfileLocalStorage>()));
    gh.factory<_i52.LoginOTPCompleteEventUseCase>(() =>
        _i52.LoginOTPCompleteEventUseCase(
            loginOTPCompleteEventRepository:
                gh<_i50.LoginOTPCompleteEventRepository>()));
    gh.factory<_i53.OTPGetTokenRepository>(() => _i54.OTPGetTokenRepositoryImpl(
        authentication: gh<_i42.Authentication>()));
    gh.factory<_i55.OTPGetTokenUseCase>(() => _i55.OTPGetTokenUseCase(
        oTPGetTokenRepository: gh<_i53.OTPGetTokenRepository>()));
    gh.singleton<_i56.ProfileService>(_i57.ProfileServiceImpl(
      apiService: gh<_i40.ApiService>(),
      tokenLocalStorage: gh<_i37.TokenLocalStorage>(),
    ));
    gh.factory<_i58.RegisterBloc>(() => _i58.RegisterBloc(
        continueClickedUseCase: gh<_i46.ContinueClickedUseCase>()));
    gh.factory<_i59.SetupProfileBloc>(() => _i59.SetupProfileBloc(
        setupProfileGetLocalProfileUseCase:
            gh<_i30.SetupProfileGetLocalProfileUseCase>()));
    gh.factory<_i60.otpBloc>(() => _i60.otpBloc(
          registerOTPCompleteUseCase: gh<_i26.RegisterOTPCompleteUseCase>(),
          otpGetTokenUseCase: gh<_i55.OTPGetTokenUseCase>(),
        ));
    gh.factory<_i61.LoginBloc>(() => _i61.LoginBloc(
        loginContinueClickedUsecase: gh<_i49.LoginContinueClickedUseCase>()));
    gh.factory<_i62.OTPSaveRemoteProfileDataRepository>(() =>
        _i63.OTPSaveRemoteProfileDataRepositoryImpl(
            profileService: gh<_i56.ProfileService>()));
    gh.factory<_i64.OTPSaveRemoteProfileDataUseCase>(() =>
        _i64.OTPSaveRemoteProfileDataUseCase(
            oTPSaveRemoteProfileDataRepository:
                gh<_i62.OTPSaveRemoteProfileDataRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i65.RegisterModule {}
