// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i16;
import 'package:firebase_auth/firebase_auth.dart' as _i18;
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
    as _i19;
import '../../features/jobs/hiring/all_services/presentation/bloc/all_services_page_bloc.dart'
    as _i7;
import '../../features/jobs/hiring/candidate_filters/presentation/bloc/filter_candidates_bloc.dart'
    as _i17;
import '../../features/jobs/hiring/create_job_listing/data/repository_impl/get_industries_repository_impl/get_my_job_listings_repository_impl.dart'
    as _i83;
import '../../features/jobs/hiring/create_job_listing/domain/repository/get_my_job_listings_repository.dart'
    as _i82;
import '../../features/jobs/hiring/create_job_listing/domain/use_cases/otp_usecase/get_my_job_listings_usecase.dart'
    as _i85;
import '../../features/jobs/hiring/create_job_listing/presentation/bloc/create_job_listing_bloc.dart'
    as _i92;
import '../../features/jobs/hiring/landing_page/data/repository_impl/get_industries_repository_impl/get_industries_repository_impl.dart'
    as _i78;
import '../../features/jobs/hiring/landing_page/domain/repository/get_industries_repository.dart'
    as _i77;
import '../../features/jobs/hiring/landing_page/domain/use_cases/otp_usecase/get_industries_usecase.dart'
    as _i79;
import '../../features/jobs/hiring/landing_page/presentation/bloc/jobs_hiring_landing_page_bloc.dart'
    as _i86;
import '../../features/jobs/hiring/my_job_listings/data/repository_impl/get_industries_repository_impl/get_my_job_listings_repository_impl.dart'
    as _i81;
import '../../features/jobs/hiring/my_job_listings/domain/repository/get_my_job_listings_repository.dart'
    as _i80;
import '../../features/jobs/hiring/my_job_listings/domain/use_cases/otp_usecase/get_my_job_listings_usecase.dart'
    as _i84;
import '../../features/jobs/hiring/my_job_listings/presentation/bloc/my_job_listings_bloc.dart'
    as _i88;
import '../../features/jobs/hiring/pending_profile/presentation/bloc/pending_profile_bloc.dart'
    as _i22;
import '../../features/jobs/hiring/service_category_candidates/data/repository_impl/get_candidates_repository_impl/get_industries_repository_impl.dart'
    as _i58;
import '../../features/jobs/hiring/service_category_candidates/domain/repository/get_paginated_candidates_repository.dart'
    as _i57;
import '../../features/jobs/hiring/service_category_candidates/domain/use_cases/get_candidates/get_paginated_candidates_usecase.dart'
    as _i59;
import '../../features/jobs/hiring/service_category_candidates/presentation/bloc/service_category_candidates_bloc.dart'
    as _i74;
import '../../features/landing/presentation/bloc/landing_bloc.dart' as _i20;
import '../../features/login/data/repository_impl/login_repository_impl/login_continue_clicked_repository_impl.dart'
    as _i63;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i12;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i15;
import '../../features/login/domain/entities/token/token_model.dart' as _i47;
import '../../features/login/domain/repository/login_repository/login_continue_clicked_repository.dart'
    as _i62;
import '../../features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart'
    as _i64;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i87;
import '../../features/membership_information/presentation/bloc/membership_information_bloc.dart'
    as _i21;
import '../../features/qualification/presentation/bloc/qualification_bloc.dart'
    as _i26;
import '../../features/rate_and_work_times/presentation/bloc/rate_and_work_times_bloc.dart'
    as _i27;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i55;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i54;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i56;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i73;
import '../../features/register_account_step_1/presentation/bloc/register_account_step1_bloc.dart'
    as _i28;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_get_local_profile_repository_impl.dart'
    as _i34;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart'
    as _i33;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart'
    as _i35;
import '../../features/setup_profile/presentation/bloc/setup_profile_bloc.dart'
    as _i75;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i42;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i41;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i43;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i36;
import '../../features/skills_and_industry/presentation/bloc/skills_and_industry_bloc.dart'
    as _i37;
import '../../features/terms_and_conditions/presentation/bloc/terms_and_conditions_bloc.dart'
    as _i44;
import '../../localization/generated/l10n.dart' as _i8;
import '../../navigation/app_route.dart' as _i9;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/login_otp_complete_event_repository_impl.dart'
    as _i66;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_token_repository_impl.dart'
    as _i69;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_save_remote_profile_data_repository_impl.dart'
    as _i90;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/register_otp_complete_repository_impl.dart'
    as _i30;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/submit_button_clicked_repository_impl.dart'
    as _i39;
import '../../shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart'
    as _i65;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart'
    as _i68;
import '../../shared/features/otp/domain/repository/otp_repository/otp_save_remote_profile_data_repository.dart'
    as _i89;
import '../../shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart'
    as _i29;
import '../../shared/features/otp/domain/repository/otp_repository/submit_button_clicked_repository.dart'
    as _i38;
import '../../shared/features/otp/domain/use_cases/otp_usecase/login_otp_complete_event_usecase.dart'
    as _i67;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart'
    as _i70;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_save_remote_profile_data_usecase.dart'
    as _i91;
import '../../shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart'
    as _i31;
import '../../shared/features/otp/domain/use_cases/otp_usecase/submit_button_clicked_usecase.dart'
    as _i40;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i76;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i32;
import '../../shared/remote/api-service.dart' as _i48;
import '../../shared/remote/dio_api_service_impl.dart' as _i49;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i10;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i11;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage.dart'
    as _i13;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage_impl.dart'
    as _i14;
import '../../shared/services/local/Hive/profile_local_storage/profile/profile_model.dart'
    as _i25;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage.dart'
    as _i23;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage_impl.dart'
    as _i24;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage.dart'
    as _i45;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage_impl.dart'
    as _i46;
import '../../shared/services/local/mock_data/candidates_service_mock/candidates_service_mock_impl.dart'
    as _i53;
import '../../shared/services/remote/api_service/candidates_service/candidates_service.dart'
    as _i52;
import '../../shared/services/remote/api_service/industries_service/industry_service.dart'
    as _i60;
import '../../shared/services/remote/api_service/industries_service/industry_service_impl.dart'
    as _i61;
import '../../shared/services/remote/api_service/profile_service/profile_service.dart'
    as _i71;
import '../../shared/services/remote/api_service/profile_service/profile_service_impl.dart'
    as _i72;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i50;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i51;
import 'locator.dart' as _i93;

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
    gh.factory<_i17.FilterCandidatesBloc>(() => _i17.FilterCandidatesBloc());
    gh.singleton<_i18.FirebaseAuth>(registerModule.firebaseAuth);
    gh.factory<_i19.JobsLandingPageBloc>(() => _i19.JobsLandingPageBloc());
    gh.factory<_i20.LandingBloc>(() => _i20.LandingBloc());
    gh.factory<_i21.MembershipInformationBloc>(
        () => _i21.MembershipInformationBloc());
    gh.factory<_i22.PendingProfileBloc>(() => _i22.PendingProfileBloc());
    gh.factory<_i23.ProfileLocalStorage>(() => _i24.ProfileLocalStorageImpl());
    gh.factory<_i25.ProfileModel>(() => _i25.ProfileModel(
          workPermitNumber: gh<String>(),
          idNumber: gh<String>(),
          emailAddress: gh<String>(),
          phoneNumber: gh<String>(),
          surname: gh<String>(),
          firstName: gh<String>(),
          passportNumber: gh<String>(),
        ));
    gh.factory<_i26.QualificationsBloc>(() => _i26.QualificationsBloc());
    gh.factory<_i27.RateAndWorkTimesBloc>(() => _i27.RateAndWorkTimesBloc());
    gh.factory<_i28.RegisterAccountStep1Bloc>(
        () => _i28.RegisterAccountStep1Bloc());
    gh.factory<_i29.RegisterOTPCompleteRepository>(() =>
        _i30.RegisterOTPCompleteRepositoryImpl(
            profileLocalStorage: gh<_i23.ProfileLocalStorage>()));
    gh.factory<_i31.RegisterOTPCompleteUseCase>(() =>
        _i31.RegisterOTPCompleteUseCase(
            registerOTPCompleteEventRepository:
                gh<_i29.RegisterOTPCompleteRepository>()));
    gh.factory<_i32.ResendOTPBloc>(() => _i32.ResendOTPBloc());
    gh.factory<_i33.SetupProfileGetLocalProfileRepository>(() =>
        _i34.SetupProfileGetLocalProfileRepositoryImpl(
            profileLocalStorage: gh<_i23.ProfileLocalStorage>()));
    gh.factory<_i35.SetupProfileGetLocalProfileUseCase>(() =>
        _i35.SetupProfileGetLocalProfileUseCase(
            setupProfileGetLocalProfileRepository:
                gh<_i33.SetupProfileGetLocalProfileRepository>()));
    gh.factory<_i36.SignUpBloc>(() => _i36.SignUpBloc());
    gh.factory<_i37.SkillsAndIndustryBloc>(() => _i37.SkillsAndIndustryBloc());
    gh.factory<_i38.SubmitButtonClickedRepository>(
        () => _i39.SubmitButtonClickedRepositoryImpl());
    gh.factory<_i40.SubmitButtonClickedUsecase>(
        () => _i40.SubmitButtonClickedUsecase());
    gh.factory<_i41.SubmitSignUpRepository>(
        () => _i42.SubmitSignUpRepositoryImpl());
    gh.factory<_i43.SubmitSignUpUseCase>(() => _i43.SubmitSignUpUseCase(
        submitSignUpRepository: gh<_i41.SubmitSignUpRepository>()));
    gh.factory<_i44.TermsAndConditionsBloc>(
        () => _i44.TermsAndConditionsBloc());
    gh.factory<_i45.TokenLocalStorage>(() => _i46.TokenLocalStorageImpl());
    gh.factory<_i47.TokenModel>(() => _i47.TokenModel(
          refreshToken: gh<String>(),
          accessToken: gh<String>(),
          tokenID: gh<String>(),
        ));
    gh.singleton<_i48.ApiService>(_i49.DioApiService(dio: gh<_i16.Dio>()));
    gh.singleton<_i50.Authentication>(
        _i51.PFirebaseAuthentication(firebaseAuth: gh<_i18.FirebaseAuth>()));
    gh.singleton<_i52.CandidatesService>(_i53.CandidatesServiceMock(
      apiService: gh<_i48.ApiService>(),
      tokenLocalStorage: gh<_i45.TokenLocalStorage>(),
    ));
    gh.factory<_i54.ContinueClickedRepository>(() =>
        _i55.ContinueClickedRepositoryImpl(
            authentication: gh<_i50.Authentication>()));
    gh.factory<_i56.ContinueClickedUseCase>(() => _i56.ContinueClickedUseCase(
        continueClickedRepository: gh<_i54.ContinueClickedRepository>()));
    gh.factory<_i57.GetPaginatedCandidatesByIndustryRepository>(() =>
        _i58.GetPaginatedCandidatesByIndustryRepositoryImpl(
            candidatesService: gh<_i52.CandidatesService>()));
    gh.factory<_i59.GetPaginatedCandidatesByIndustryUseCase>(() =>
        _i59.GetPaginatedCandidatesByIndustryUseCase(
            getPaginatedCandidateProfilesRepository:
                gh<_i57.GetPaginatedCandidatesByIndustryRepository>()));
    gh.singleton<_i60.IndustryService>(_i61.IndustryServiceImpl(
      apiService: gh<_i48.ApiService>(),
      tokenLocalStorage: gh<_i45.TokenLocalStorage>(),
    ));
    gh.factory<_i62.LoginContinueClickedRepository>(() =>
        _i63.LoginContinueClickedRepositoryImpl(
            authentication: gh<_i50.Authentication>()));
    gh.factory<_i64.LoginContinueClickedUseCase>(() =>
        _i64.LoginContinueClickedUseCase(
            loginContinueClickedRepository:
                gh<_i62.LoginContinueClickedRepository>()));
    gh.factory<_i65.LoginOTPCompleteEventRepository>(() =>
        _i66.LoginOTPCompleteEventRepositoryImpl(
            profileLocalStorage: gh<_i23.ProfileLocalStorage>()));
    gh.factory<_i67.LoginOTPCompleteEventUseCase>(() =>
        _i67.LoginOTPCompleteEventUseCase(
            loginOTPCompleteEventRepository:
                gh<_i65.LoginOTPCompleteEventRepository>()));
    gh.factory<_i68.OTPGetTokenRepository>(() => _i69.OTPGetTokenRepositoryImpl(
        authentication: gh<_i50.Authentication>()));
    gh.factory<_i70.OTPGetTokenUseCase>(() => _i70.OTPGetTokenUseCase(
        oTPGetTokenRepository: gh<_i68.OTPGetTokenRepository>()));
    gh.singleton<_i71.ProfileService>(_i72.ProfileServiceImpl(
      apiService: gh<_i48.ApiService>(),
      tokenLocalStorage: gh<_i45.TokenLocalStorage>(),
    ));
    gh.factory<_i73.RegisterBloc>(() => _i73.RegisterBloc(
        continueClickedUseCase: gh<_i56.ContinueClickedUseCase>()));
    gh.factory<_i74.ServiceCategoryCandidatesBloc>(() =>
        _i74.ServiceCategoryCandidatesBloc(
            getPaginatedCandidatesByIndustryUseCase:
                gh<_i59.GetPaginatedCandidatesByIndustryUseCase>()));
    gh.factory<_i75.SetupProfileBloc>(() => _i75.SetupProfileBloc(
        setupProfileGetLocalProfileUseCase:
            gh<_i35.SetupProfileGetLocalProfileUseCase>()));
    gh.factory<_i76.otpBloc>(() => _i76.otpBloc(
          registerOTPCompleteUseCase: gh<_i31.RegisterOTPCompleteUseCase>(),
          otpGetTokenUseCase: gh<_i70.OTPGetTokenUseCase>(),
        ));
    gh.factory<_i77.GetIndustriesRepository>(() =>
        _i78.GetIndustriesRepositoryImpl(
            industryService: gh<_i60.IndustryService>()));
    gh.factory<_i79.GetIndustriesUseCase>(() => _i79.GetIndustriesUseCase(
        getIndustriesRepository: gh<_i77.GetIndustriesRepository>()));
    gh.factory<_i80.GetMyJobListingsRepository>(() =>
        _i81.GetMyJobListingsRepositoryImpl(
            industryService: gh<_i60.IndustryService>()));
    gh.factory<_i82.GetMyJobListingsRepository>(() =>
        _i83.GetMyJobListingsRepositoryImpl(
            industryService: gh<_i60.IndustryService>()));
    gh.factory<_i84.GetMyJobListingsUseCase>(() => _i84.GetMyJobListingsUseCase(
        getIndustriesRepository: gh<_i80.GetMyJobListingsRepository>()));
    gh.factory<_i85.GetMyJobListingsUseCase>(() => _i85.GetMyJobListingsUseCase(
        getIndustriesRepository: gh<_i82.GetMyJobListingsRepository>()));
    gh.factory<_i86.JobsHiringLandingPageBloc>(() =>
        _i86.JobsHiringLandingPageBloc(
            getIndustriesUseCase: gh<_i79.GetIndustriesUseCase>()));
    gh.factory<_i87.LoginBloc>(() => _i87.LoginBloc(
        loginContinueClickedUsecase: gh<_i64.LoginContinueClickedUseCase>()));
    gh.factory<_i88.MyJobListingsBloc>(() => _i88.MyJobListingsBloc(
        getIndustriesUseCase: gh<_i84.GetMyJobListingsUseCase>()));
    gh.factory<_i89.OTPSaveRemoteProfileDataRepository>(() =>
        _i90.OTPSaveRemoteProfileDataRepositoryImpl(
            profileService: gh<_i71.ProfileService>()));
    gh.factory<_i91.OTPSaveRemoteProfileDataUseCase>(() =>
        _i91.OTPSaveRemoteProfileDataUseCase(
            oTPSaveRemoteProfileDataRepository:
                gh<_i89.OTPSaveRemoteProfileDataRepository>()));
    gh.factory<_i92.CreateJobListingBloc>(() => _i92.CreateJobListingBloc(
        getIndustriesUseCase: gh<_i85.GetMyJobListingsUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i93.RegisterModule {}
