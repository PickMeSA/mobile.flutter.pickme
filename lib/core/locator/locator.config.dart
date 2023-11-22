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
import '../../features/jobs/applying/jobs_landing_page/presentation/bloc/jobs_landing_page_bloc.dart'
    as _i17;
import '../../features/landing/presentation/bloc/landing_bloc.dart' as _i18;
import '../../features/login/data/repository_impl/login_repository_impl/login_continue_clicked_repository_impl.dart'
    as _i53;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i11;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i14;
import '../../features/login/domain/entities/token/token_model.dart' as _i44;
import '../../features/login/domain/repository/login_repository/login_continue_clicked_repository.dart'
    as _i52;
import '../../features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart'
    as _i54;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i66;
import '../../features/membership_information/presentation/bloc/membership_information_bloc.dart'
    as _i19;
import '../../features/qualification/presentation/bloc/qualification_bloc.dart'
    as _i23;
import '../../features/rate_and_work_times/presentation/bloc/rate_and_work_times_bloc.dart'
    as _i24;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i50;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i49;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i51;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i63;
import '../../features/register_account_step_1/presentation/bloc/register_account_step1_bloc.dart'
    as _i25;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_get_local_profile_repository_impl.dart'
    as _i31;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart'
    as _i30;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart'
    as _i32;
import '../../features/setup_profile/presentation/bloc/setup_profile_bloc.dart'
    as _i64;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i39;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i38;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i40;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i33;
import '../../features/skills_and_industry/presentation/bloc/skills_and_industry_bloc.dart'
    as _i34;
import '../../features/terms_and_conditions/presentation/bloc/terms_and_conditions_bloc.dart'
    as _i41;
import '../../localization/generated/l10n.dart' as _i7;
import '../../navigation/app_route.dart' as _i8;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/login_otp_complete_event_repository_impl.dart'
    as _i56;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_token_repository_impl.dart'
    as _i59;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_save_remote_profile_data_repository_impl.dart'
    as _i68;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/register_otp_complete_repository_impl.dart'
    as _i27;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/submit_button_clicked_repository_impl.dart'
    as _i36;
import '../../shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart'
    as _i55;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart'
    as _i58;
import '../../shared/features/otp/domain/repository/otp_repository/otp_save_remote_profile_data_repository.dart'
    as _i67;
import '../../shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart'
    as _i26;
import '../../shared/features/otp/domain/repository/otp_repository/submit_button_clicked_repository.dart'
    as _i35;
import '../../shared/features/otp/domain/use_cases/otp_usecase/login_otp_complete_event_usecase.dart'
    as _i57;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart'
    as _i60;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_save_remote_profile_data_usecase.dart'
    as _i69;
import '../../shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart'
    as _i28;
import '../../shared/features/otp/domain/use_cases/otp_usecase/submit_button_clicked_usecase.dart'
    as _i37;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i65;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i29;
import '../../shared/remote/api-service.dart' as _i45;
import '../../shared/remote/dio_api_service_impl.dart' as _i46;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i9;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i10;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage.dart'
    as _i12;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage_impl.dart'
    as _i13;
import '../../shared/services/local/Hive/profile_local_storage/profile/profile_model.dart'
    as _i22;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage.dart'
    as _i20;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage_impl.dart'
    as _i21;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage.dart'
    as _i42;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage_impl.dart'
    as _i43;
import '../../shared/services/remote/api_service/profile_service/profile_service.dart'
    as _i61;
import '../../shared/services/remote/api_service/profile_service/profile_service_impl.dart'
    as _i62;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i47;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i48;
import 'locator.dart' as _i70;

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
    gh.factory<_i17.JobsLandingPageBloc>(() => _i17.JobsLandingPageBloc());
    gh.factory<_i18.LandingBloc>(() => _i18.LandingBloc());
    gh.factory<_i19.MembershipInformationBloc>(
        () => _i19.MembershipInformationBloc());
    gh.factory<_i20.ProfileLocalStorage>(() => _i21.ProfileLocalStorageImpl());
    gh.factory<_i22.ProfileModel>(() => _i22.ProfileModel(
          workPermitNumber: gh<String>(),
          idNumber: gh<String>(),
          emailAddress: gh<String>(),
          phoneNumber: gh<String>(),
          surname: gh<String>(),
          firstName: gh<String>(),
          passportNumber: gh<String>(),
        ));
    gh.factory<_i23.QualificationsBloc>(() => _i23.QualificationsBloc());
    gh.factory<_i24.RateAndWorkTimesBloc>(() => _i24.RateAndWorkTimesBloc());
    gh.factory<_i25.RegisterAccountStep1Bloc>(
        () => _i25.RegisterAccountStep1Bloc());
    gh.factory<_i26.RegisterOTPCompleteRepository>(() =>
        _i27.RegisterOTPCompleteRepositoryImpl(
            profileLocalStorage: gh<_i20.ProfileLocalStorage>()));
    gh.factory<_i28.RegisterOTPCompleteUseCase>(() =>
        _i28.RegisterOTPCompleteUseCase(
            registerOTPCompleteEventRepository:
                gh<_i26.RegisterOTPCompleteRepository>()));
    gh.factory<_i29.ResendOTPBloc>(() => _i29.ResendOTPBloc());
    gh.factory<_i30.SetupProfileGetLocalProfileRepository>(() =>
        _i31.SetupProfileGetLocalProfileRepositoryImpl(
            profileLocalStorage: gh<_i20.ProfileLocalStorage>()));
    gh.factory<_i32.SetupProfileGetLocalProfileUseCase>(() =>
        _i32.SetupProfileGetLocalProfileUseCase(
            setupProfileGetLocalProfileRepository:
                gh<_i30.SetupProfileGetLocalProfileRepository>()));
    gh.factory<_i33.SignUpBloc>(() => _i33.SignUpBloc());
    gh.factory<_i34.SkillsAndIndustryBloc>(() => _i34.SkillsAndIndustryBloc());
    gh.factory<_i35.SubmitButtonClickedRepository>(
        () => _i36.SubmitButtonClickedRepositoryImpl());
    gh.factory<_i37.SubmitButtonClickedUsecase>(
        () => _i37.SubmitButtonClickedUsecase());
    gh.factory<_i38.SubmitSignUpRepository>(
        () => _i39.SubmitSignUpRepositoryImpl());
    gh.factory<_i40.SubmitSignUpUseCase>(() => _i40.SubmitSignUpUseCase(
        submitSignUpRepository: gh<_i38.SubmitSignUpRepository>()));
    gh.factory<_i41.TermsAndConditionsBloc>(
        () => _i41.TermsAndConditionsBloc());
    gh.factory<_i42.TokenLocalStorage>(() => _i43.TokenLocalStorageImpl());
    gh.factory<_i44.TokenModel>(() => _i44.TokenModel(
          refreshToken: gh<String>(),
          accessToken: gh<String>(),
          tokenID: gh<String>(),
        ));
    gh.singleton<_i45.ApiService>(_i46.DioApiService(dio: gh<_i15.Dio>()));
    gh.singleton<_i47.Authentication>(
        _i48.PFirebaseAuthentication(firebaseAuth: gh<_i16.FirebaseAuth>()));
    gh.factory<_i49.ContinueClickedRepository>(() =>
        _i50.ContinueClickedRepositoryImpl(
            authentication: gh<_i47.Authentication>()));
    gh.factory<_i51.ContinueClickedUseCase>(() => _i51.ContinueClickedUseCase(
        continueClickedRepository: gh<_i49.ContinueClickedRepository>()));
    gh.factory<_i52.LoginContinueClickedRepository>(() =>
        _i53.LoginContinueClickedRepositoryImpl(
            authentication: gh<_i47.Authentication>()));
    gh.factory<_i54.LoginContinueClickedUseCase>(() =>
        _i54.LoginContinueClickedUseCase(
            loginContinueClickedRepository:
                gh<_i52.LoginContinueClickedRepository>()));
    gh.factory<_i55.LoginOTPCompleteEventRepository>(() =>
        _i56.LoginOTPCompleteEventRepositoryImpl(
            profileLocalStorage: gh<_i20.ProfileLocalStorage>()));
    gh.factory<_i57.LoginOTPCompleteEventUseCase>(() =>
        _i57.LoginOTPCompleteEventUseCase(
            loginOTPCompleteEventRepository:
                gh<_i55.LoginOTPCompleteEventRepository>()));
    gh.factory<_i58.OTPGetTokenRepository>(() => _i59.OTPGetTokenRepositoryImpl(
        authentication: gh<_i47.Authentication>()));
    gh.factory<_i60.OTPGetTokenUseCase>(() => _i60.OTPGetTokenUseCase(
        oTPGetTokenRepository: gh<_i58.OTPGetTokenRepository>()));
    gh.singleton<_i61.ProfileService>(_i62.ProfileServiceImpl(
      apiService: gh<_i45.ApiService>(),
      tokenLocalStorage: gh<_i42.TokenLocalStorage>(),
    ));
    gh.factory<_i63.RegisterBloc>(() => _i63.RegisterBloc(
        continueClickedUseCase: gh<_i51.ContinueClickedUseCase>()));
    gh.factory<_i64.SetupProfileBloc>(() => _i64.SetupProfileBloc(
        setupProfileGetLocalProfileUseCase:
            gh<_i32.SetupProfileGetLocalProfileUseCase>()));
    gh.factory<_i65.otpBloc>(() => _i65.otpBloc(
          registerOTPCompleteUseCase: gh<_i28.RegisterOTPCompleteUseCase>(),
          otpGetTokenUseCase: gh<_i60.OTPGetTokenUseCase>(),
        ));
    gh.factory<_i66.LoginBloc>(() => _i66.LoginBloc(
        loginContinueClickedUsecase: gh<_i54.LoginContinueClickedUseCase>()));
    gh.factory<_i67.OTPSaveRemoteProfileDataRepository>(() =>
        _i68.OTPSaveRemoteProfileDataRepositoryImpl(
            profileService: gh<_i61.ProfileService>()));
    gh.factory<_i69.OTPSaveRemoteProfileDataUseCase>(() =>
        _i69.OTPSaveRemoteProfileDataUseCase(
            oTPSaveRemoteProfileDataRepository:
                gh<_i67.OTPSaveRemoteProfileDataRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i70.RegisterModule {}
