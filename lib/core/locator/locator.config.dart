// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i16;
import 'package:firebase_auth/firebase_auth.dart' as _i17;
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
    as _i18;
import '../../features/jobs/hiring/all_services/presentation/bloc/all_services_page_bloc.dart'
    as _i7;
import '../../features/jobs/hiring/landing_page/data/repository_impl/get_industries_repository_impl/get_industries_repository_impl.dart'
    as _i70;
import '../../features/jobs/hiring/landing_page/domain/repository/get_industries_repository.dart'
    as _i69;
import '../../features/jobs/hiring/landing_page/domain/use_cases/otp_usecase/get_industries_usecase.dart'
    as _i71;
import '../../features/jobs/hiring/landing_page/presentation/bloc/jobs_hiring_landing_page_bloc.dart'
    as _i72;
import '../../features/landing/presentation/bloc/landing_bloc.dart' as _i19;
import '../../features/login/data/repository_impl/login_repository_impl/login_continue_clicked_repository_impl.dart'
    as _i56;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i12;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i15;
import '../../features/login/domain/entities/token/token_model.dart' as _i45;
import '../../features/login/domain/repository/login_repository/login_continue_clicked_repository.dart'
    as _i55;
import '../../features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart'
    as _i57;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i73;
import '../../features/membership_information/presentation/bloc/membership_information_bloc.dart'
    as _i20;
import '../../features/qualification/presentation/bloc/qualification_bloc.dart'
    as _i24;
import '../../features/rate_and_work_times/presentation/bloc/rate_and_work_times_bloc.dart'
    as _i25;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i51;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i50;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i52;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i66;
import '../../features/register_account_step_1/presentation/bloc/register_account_step1_bloc.dart'
    as _i26;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_get_local_profile_repository_impl.dart'
    as _i32;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart'
    as _i31;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart'
    as _i33;
import '../../features/setup_profile/presentation/bloc/setup_profile_bloc.dart'
    as _i67;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i40;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i39;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i41;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i34;
import '../../features/skills_and_industry/presentation/bloc/skills_and_industry_bloc.dart'
    as _i35;
import '../../features/terms_and_conditions/presentation/bloc/terms_and_conditions_bloc.dart'
    as _i42;
import '../../localization/generated/l10n.dart' as _i8;
import '../../navigation/app_route.dart' as _i9;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/login_otp_complete_event_repository_impl.dart'
    as _i59;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_token_repository_impl.dart'
    as _i62;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_save_remote_profile_data_repository_impl.dart'
    as _i75;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/register_otp_complete_repository_impl.dart'
    as _i28;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/submit_button_clicked_repository_impl.dart'
    as _i37;
import '../../shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart'
    as _i58;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart'
    as _i61;
import '../../shared/features/otp/domain/repository/otp_repository/otp_save_remote_profile_data_repository.dart'
    as _i74;
import '../../shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart'
    as _i27;
import '../../shared/features/otp/domain/repository/otp_repository/submit_button_clicked_repository.dart'
    as _i36;
import '../../shared/features/otp/domain/use_cases/otp_usecase/login_otp_complete_event_usecase.dart'
    as _i60;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart'
    as _i63;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_save_remote_profile_data_usecase.dart'
    as _i76;
import '../../shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart'
    as _i29;
import '../../shared/features/otp/domain/use_cases/otp_usecase/submit_button_clicked_usecase.dart'
    as _i38;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i68;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i30;
import '../../shared/remote/api-service.dart' as _i46;
import '../../shared/remote/dio_api_service_impl.dart' as _i47;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i10;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i11;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage.dart'
    as _i13;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage_impl.dart'
    as _i14;
import '../../shared/services/local/Hive/profile_local_storage/profile/profile_model.dart'
    as _i23;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage.dart'
    as _i21;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage_impl.dart'
    as _i22;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage.dart'
    as _i43;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage_impl.dart'
    as _i44;
import '../../shared/services/local/mock_data/industries_service_mock/industry_service_mock_impl.dart'
    as _i54;
import '../../shared/services/remote/api_service/industries_service/industry_service.dart'
    as _i53;
import '../../shared/services/remote/api_service/profile_service/profile_service.dart'
    as _i64;
import '../../shared/services/remote/api_service/profile_service/profile_service_impl.dart'
    as _i65;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i48;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i49;
import 'locator.dart' as _i77;

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
    gh.factory<_i7.AllServicesPageBloc>(() => _i7.AllServicesPageBloc());
    gh.factory<_i8.AppLocalizations>(() => registerModule.appLocalizations);
    gh.lazySingleton<_i9.AppRouter>(() => _i9.AppRouter());
    gh.factory<_i10.AppStateLocalStorage>(
        () => _i11.AppStateLocalStorageImpl());
    gh.factory<_i12.AppStateModel>(
        () => _i12.AppStateModel(loggedIn: gh<bool>()));
    gh.singleton<_i13.BiometricsLocalStorage>(
        _i14.BiometricsLocalStorageImpl());
    gh.factory<_i15.BiometricsModel>(
        () => _i15.BiometricsModel(biometrics: gh<bool>()));
    gh.factory<_i16.Dio>(() => registerModule.dio);
    gh.singleton<_i17.FirebaseAuth>(registerModule.firebaseAuth);
    gh.factory<_i18.JobsLandingPageBloc>(() => _i18.JobsLandingPageBloc());
    gh.factory<_i19.LandingBloc>(() => _i19.LandingBloc());
    gh.factory<_i20.MembershipInformationBloc>(
        () => _i20.MembershipInformationBloc());
    gh.factory<_i21.ProfileLocalStorage>(() => _i22.ProfileLocalStorageImpl());
    gh.factory<_i23.ProfileModel>(() => _i23.ProfileModel(
          workPermitNumber: gh<String>(),
          idNumber: gh<String>(),
          emailAddress: gh<String>(),
          phoneNumber: gh<String>(),
          surname: gh<String>(),
          firstName: gh<String>(),
          passportNumber: gh<String>(),
        ));
    gh.factory<_i24.QualificationsBloc>(() => _i24.QualificationsBloc());
    gh.factory<_i25.RateAndWorkTimesBloc>(() => _i25.RateAndWorkTimesBloc());
    gh.factory<_i26.RegisterAccountStep1Bloc>(
        () => _i26.RegisterAccountStep1Bloc());
    gh.factory<_i27.RegisterOTPCompleteRepository>(() =>
        _i28.RegisterOTPCompleteRepositoryImpl(
            profileLocalStorage: gh<_i21.ProfileLocalStorage>()));
    gh.factory<_i29.RegisterOTPCompleteUseCase>(() =>
        _i29.RegisterOTPCompleteUseCase(
            registerOTPCompleteEventRepository:
                gh<_i27.RegisterOTPCompleteRepository>()));
    gh.factory<_i30.ResendOTPBloc>(() => _i30.ResendOTPBloc());
    gh.factory<_i31.SetupProfileGetLocalProfileRepository>(() =>
        _i32.SetupProfileGetLocalProfileRepositoryImpl(
            profileLocalStorage: gh<_i21.ProfileLocalStorage>()));
    gh.factory<_i33.SetupProfileGetLocalProfileUseCase>(() =>
        _i33.SetupProfileGetLocalProfileUseCase(
            setupProfileGetLocalProfileRepository:
                gh<_i31.SetupProfileGetLocalProfileRepository>()));
    gh.factory<_i34.SignUpBloc>(() => _i34.SignUpBloc());
    gh.factory<_i35.SkillsAndIndustryBloc>(() => _i35.SkillsAndIndustryBloc());
    gh.factory<_i36.SubmitButtonClickedRepository>(
        () => _i37.SubmitButtonClickedRepositoryImpl());
    gh.factory<_i38.SubmitButtonClickedUsecase>(
        () => _i38.SubmitButtonClickedUsecase());
    gh.factory<_i39.SubmitSignUpRepository>(
        () => _i40.SubmitSignUpRepositoryImpl());
    gh.factory<_i41.SubmitSignUpUseCase>(() => _i41.SubmitSignUpUseCase(
        submitSignUpRepository: gh<_i39.SubmitSignUpRepository>()));
    gh.factory<_i42.TermsAndConditionsBloc>(
        () => _i42.TermsAndConditionsBloc());
    gh.factory<_i43.TokenLocalStorage>(() => _i44.TokenLocalStorageImpl());
    gh.factory<_i45.TokenModel>(() => _i45.TokenModel(
          refreshToken: gh<String>(),
          accessToken: gh<String>(),
          tokenID: gh<String>(),
        ));
    gh.singleton<_i46.ApiService>(_i47.DioApiService(dio: gh<_i16.Dio>()));
    gh.singleton<_i48.Authentication>(
        _i49.PFirebaseAuthentication(firebaseAuth: gh<_i17.FirebaseAuth>()));
    gh.factory<_i50.ContinueClickedRepository>(() =>
        _i51.ContinueClickedRepositoryImpl(
            authentication: gh<_i48.Authentication>()));
    gh.factory<_i52.ContinueClickedUseCase>(() => _i52.ContinueClickedUseCase(
        continueClickedRepository: gh<_i50.ContinueClickedRepository>()));
    gh.singleton<_i53.IndustryService>(_i54.IndustryServiceMockImpl(
      apiService: gh<_i46.ApiService>(),
      tokenLocalStorage: gh<_i43.TokenLocalStorage>(),
    ));
    gh.factory<_i55.LoginContinueClickedRepository>(() =>
        _i56.LoginContinueClickedRepositoryImpl(
            authentication: gh<_i48.Authentication>()));
    gh.factory<_i57.LoginContinueClickedUseCase>(() =>
        _i57.LoginContinueClickedUseCase(
            loginContinueClickedRepository:
                gh<_i55.LoginContinueClickedRepository>()));
    gh.factory<_i58.LoginOTPCompleteEventRepository>(() =>
        _i59.LoginOTPCompleteEventRepositoryImpl(
            profileLocalStorage: gh<_i21.ProfileLocalStorage>()));
    gh.factory<_i60.LoginOTPCompleteEventUseCase>(() =>
        _i60.LoginOTPCompleteEventUseCase(
            loginOTPCompleteEventRepository:
                gh<_i58.LoginOTPCompleteEventRepository>()));
    gh.factory<_i61.OTPGetTokenRepository>(() => _i62.OTPGetTokenRepositoryImpl(
        authentication: gh<_i48.Authentication>()));
    gh.factory<_i63.OTPGetTokenUseCase>(() => _i63.OTPGetTokenUseCase(
        oTPGetTokenRepository: gh<_i61.OTPGetTokenRepository>()));
    gh.singleton<_i64.ProfileService>(_i65.ProfileServiceImpl(
      apiService: gh<_i46.ApiService>(),
      tokenLocalStorage: gh<_i43.TokenLocalStorage>(),
    ));
    gh.factory<_i66.RegisterBloc>(() => _i66.RegisterBloc(
        continueClickedUseCase: gh<_i52.ContinueClickedUseCase>()));
    gh.factory<_i67.SetupProfileBloc>(() => _i67.SetupProfileBloc(
        setupProfileGetLocalProfileUseCase:
            gh<_i33.SetupProfileGetLocalProfileUseCase>()));
    gh.factory<_i68.otpBloc>(() => _i68.otpBloc(
          registerOTPCompleteUseCase: gh<_i29.RegisterOTPCompleteUseCase>(),
          otpGetTokenUseCase: gh<_i63.OTPGetTokenUseCase>(),
        ));
    gh.factory<_i69.GetIndustriesRepository>(() =>
        _i70.GetIndustriesRepositoryImpl(
            industryService: gh<_i53.IndustryService>()));
    gh.factory<_i71.GetIndustriesUseCase>(() => _i71.GetIndustriesUseCase(
        getIndustriesRepository: gh<_i69.GetIndustriesRepository>()));
    gh.factory<_i72.JobsHiringLandingPageBloc>(() =>
        _i72.JobsHiringLandingPageBloc(
            getIndustriesUseCase: gh<_i71.GetIndustriesUseCase>()));
    gh.factory<_i73.LoginBloc>(() => _i73.LoginBloc(
        loginContinueClickedUsecase: gh<_i57.LoginContinueClickedUseCase>()));
    gh.factory<_i74.OTPSaveRemoteProfileDataRepository>(() =>
        _i75.OTPSaveRemoteProfileDataRepositoryImpl(
            profileService: gh<_i64.ProfileService>()));
    gh.factory<_i76.OTPSaveRemoteProfileDataUseCase>(() =>
        _i76.OTPSaveRemoteProfileDataUseCase(
            oTPSaveRemoteProfileDataRepository:
                gh<_i74.OTPSaveRemoteProfileDataRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i77.RegisterModule {}
