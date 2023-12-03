// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i17;
import 'package:firebase_auth/firebase_auth.dart' as _i20;
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
import '../../features/bank_details/presentation/bloc/bank_details_bloc.dart'
    as _i13;
import '../../features/final_details/presentation/bloc/final_details_bloc.dart'
    as _i19;
import '../../features/jobs/applying/jobs_landing_page/presentation/bloc/jobs_landing_page_bloc.dart'
    as _i21;
import '../../features/jobs/hiring/all_services/presentation/bloc/all_services_page_bloc.dart'
    as _i7;
import '../../features/jobs/hiring/candidate_filters/presentation/bloc/filter_candidates_bloc.dart'
    as _i18;
import '../../features/jobs/hiring/create_job_listing/data/repository_impl/get_industries_repository_impl/get_my_job_listings_repository_impl.dart'
    as _i95;
import '../../features/jobs/hiring/create_job_listing/domain/repository/get_my_job_listings_repository.dart'
    as _i94;
import '../../features/jobs/hiring/create_job_listing/domain/use_cases/otp_usecase/get_my_job_listings_usecase.dart'
    as _i99;
import '../../features/jobs/hiring/create_job_listing/presentation/bloc/create_job_listing_bloc.dart'
    as _i113;
import '../../features/jobs/hiring/landing_page/data/repository_impl/get_industries_repository_impl/get_industries_repository_impl.dart'
    as _i89;
import '../../features/jobs/hiring/landing_page/domain/repository/get_industries_repository.dart'
    as _i88;
import '../../features/jobs/hiring/landing_page/domain/use_cases/otp_usecase/get_industries_usecase.dart'
    as _i90;
import '../../features/jobs/hiring/landing_page/presentation/bloc/jobs_hiring_landing_page_bloc.dart'
    as _i103;
import '../../features/jobs/hiring/my_job_listings/data/repository_impl/get_industries_repository_impl/get_my_job_listings_repository_impl.dart'
    as _i97;
import '../../features/jobs/hiring/my_job_listings/domain/repository/get_my_job_listings_repository.dart'
    as _i96;
import '../../features/jobs/hiring/my_job_listings/domain/use_cases/otp_usecase/get_my_job_listings_usecase.dart'
    as _i98;
import '../../features/jobs/hiring/my_job_listings/presentation/bloc/my_job_listings_bloc.dart'
    as _i106;
import '../../features/jobs/hiring/pending_profile/presentation/bloc/pending_profile_bloc.dart'
    as _i25;
import '../../features/jobs/hiring/service_category_candidates/data/repository_impl/get_candidates_repository_impl/get_industries_repository_impl.dart'
    as _i62;
import '../../features/jobs/hiring/service_category_candidates/domain/repository/get_paginated_candidates_repository.dart'
    as _i61;
import '../../features/jobs/hiring/service_category_candidates/domain/use_cases/get_candidates/get_paginated_candidates_usecase.dart'
    as _i63;
import '../../features/jobs/hiring/service_category_candidates/presentation/bloc/service_category_candidates_bloc.dart'
    as _i80;
import '../../features/landing/presentation/bloc/landing_bloc.dart' as _i22;
import '../../features/location/presentation/bloc/location_bloc.dart' as _i23;
import '../../features/login/data/repository_impl/login_repository_impl/login_continue_clicked_repository_impl.dart'
    as _i67;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i12;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i16;
import '../../features/login/domain/entities/token/token_model.dart' as _i49;
import '../../features/login/domain/repository/login_repository/login_continue_clicked_repository.dart'
    as _i66;
import '../../features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart'
    as _i68;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i104;
import '../../features/membership_information/data/repository_impl/membership_information_repository_impl/get_membership_information_repository_impl.dart'
    as _i92;
import '../../features/membership_information/data/service/remote/membership_details_service.dart'
    as _i72;
import '../../features/membership_information/data/service/remote/membership_details_service_impl.dart'
    as _i73;
import '../../features/membership_information/domain/repository/membership_information_repository/get_membership_information_repository.dart'
    as _i91;
import '../../features/membership_information/domain/use_cases/membership_information_usecase/get_membership_information_usecase.dart'
    as _i93;
import '../../features/membership_information/presentation/bloc/membership_information_bloc.dart'
    as _i105;
import '../../features/minimum_wage/presentation/bloc/minimum_wage_bloc.dart'
    as _i24;
import '../../features/qualification/presentation/bloc/qualification_bloc.dart'
    as _i29;
import '../../features/rate_and_work_times/presentation/bloc/rate_and_work_times_bloc.dart'
    as _i30;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i59;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i58;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i60;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i79;
import '../../features/register_account_step_1/presentation/bloc/register_account_step1_bloc.dart'
    as _i31;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_get_local_profile_repository_impl.dart'
    as _i37;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_remote_submit_profile_type__repository_impl.dart'
    as _i82;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart'
    as _i36;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_remote_submit_profile_type__repository.dart'
    as _i81;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart'
    as _i38;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_remote_submit_profile_type__usecase.dart'
    as _i83;
import '../../features/setup_profile/presentation/bloc/setup_profile_bloc.dart'
    as _i110;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i45;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i44;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i46;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i39;
import '../../features/skills_and_industry/presentation/bloc/skills_and_industry_bloc.dart'
    as _i40;
import '../../features/terms_and_conditions/data/repository_impl/terms_and_conditions_repository_impl/get_remote_terms_and_conditions_repository_impl.dart'
    as _i101;
import '../../features/terms_and_conditions/data/repository_impl/terms_and_conditions_repository_impl/submit_remote_terms_and_conditions_acceptance_repository_impl.dart'
    as _i42;
import '../../features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service.dart'
    as _i84;
import '../../features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service_impl.dart'
    as _i85;
import '../../features/terms_and_conditions/domain/repository/terms_and_conditions_repository/get_remote_terms_and_conditions_repository.dart'
    as _i100;
import '../../features/terms_and_conditions/domain/repository/terms_and_conditions_repository/submit_remote_terms_and_conditions_acceptance_repository.dart'
    as _i41;
import '../../features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/get_remote_terms_and_conditions_usecase.dart'
    as _i102;
import '../../features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/submit_remote_terms_and_conditions_acceptance_usecase.dart'
    as _i43;
import '../../features/terms_and_conditions/presentation/bloc/terms_and_conditions_bloc.dart'
    as _i111;
import '../../features/you_are_all_setup/presentation/bloc/you_are_all_setup_bloc.dart'
    as _i51;
import '../../localization/generated/l10n.dart' as _i8;
import '../../navigation/app_route.dart' as _i9;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/login_otp_complete_event_repository_impl.dart'
    as _i70;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_token_repository_impl.dart'
    as _i75;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_save_remote_profile_data_repository_impl.dart'
    as _i108;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/register_otp_complete_repository_impl.dart'
    as _i33;
import '../../shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart'
    as _i69;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart'
    as _i74;
import '../../shared/features/otp/domain/repository/otp_repository/otp_save_remote_profile_data_repository.dart'
    as _i107;
import '../../shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart'
    as _i32;
import '../../shared/features/otp/domain/use_cases/otp_usecase/login_otp_complete_event_usecase.dart'
    as _i71;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart'
    as _i76;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_save_remote_profile_data_usecase.dart'
    as _i109;
import '../../shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart'
    as _i34;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i112;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i35;
import '../../shared/remote/api-service.dart' as _i52;
import '../../shared/remote/dio_api_service_impl.dart' as _i53;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i10;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i11;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage.dart'
    as _i14;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage_impl.dart'
    as _i15;
import '../../shared/services/local/Hive/profile_local_storage/profile/profile_model.dart'
    as _i28;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage.dart'
    as _i26;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage_impl.dart'
    as _i27;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage.dart'
    as _i47;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage_impl.dart'
    as _i48;
import '../../shared/services/local/Hive/user_local_storage/user/user_model.dart'
    as _i50;
import '../../shared/services/local/mock_data/candidates_service_mock/candidates_service_mock_impl.dart'
    as _i57;
import '../../shared/services/remote/api_service/candidates_service/candidates_service.dart'
    as _i56;
import '../../shared/services/remote/api_service/industries_service/industry_service.dart'
    as _i64;
import '../../shared/services/remote/api_service/industries_service/industry_service_impl.dart'
    as _i65;
import '../../shared/services/remote/api_service/profile_service/profile_service.dart'
    as _i77;
import '../../shared/services/remote/api_service/profile_service/profile_service_impl.dart'
    as _i78;
import '../../shared/services/remote/api_service/user_service/user_service.dart'
    as _i86;
import '../../shared/services/remote/api_service/user_service/user_service_impl.dart'
    as _i87;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i54;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i55;
import 'locator.dart' as _i114;

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
    gh.factory<_i13.BankDetailsBloc>(() => _i13.BankDetailsBloc());
    gh.singleton<_i14.BiometricsLocalStorage>(
        _i15.BiometricsLocalStorageImpl());
    gh.factory<_i16.BiometricsModel>(
        () => _i16.BiometricsModel(biometrics: gh<bool>()));
    gh.factory<_i17.Dio>(() => registerModule.dio);
    gh.factory<_i18.FilterCandidatesBloc>(() => _i18.FilterCandidatesBloc());
    gh.factory<_i19.FinalDetailsBloc>(() => _i19.FinalDetailsBloc());
    gh.singleton<_i20.FirebaseAuth>(registerModule.firebaseAuth);
    gh.factory<_i21.JobsLandingPageBloc>(() => _i21.JobsLandingPageBloc());
    gh.factory<_i22.LandingBloc>(() => _i22.LandingBloc());
    gh.factory<_i23.LocationBloc>(() => _i23.LocationBloc());
    gh.factory<_i24.MinimumWageBloc>(() => _i24.MinimumWageBloc());
    gh.factory<_i25.PendingProfileBloc>(() => _i25.PendingProfileBloc());
    gh.factory<_i26.ProfileLocalStorage>(() => _i27.ProfileLocalStorageImpl());
    gh.factory<_i28.ProfileModel>(() => _i28.ProfileModel(
          workPermitNumber: gh<String>(),
          idNumber: gh<String>(),
          emailAddress: gh<String>(),
          phoneNumber: gh<String>(),
          surname: gh<String>(),
          firstName: gh<String>(),
          passportNumber: gh<String>(),
        ));
    gh.factory<_i29.QualificationsBloc>(() => _i29.QualificationsBloc());
    gh.factory<_i30.RateAndWorkTimesBloc>(() => _i30.RateAndWorkTimesBloc());
    gh.factory<_i31.RegisterAccountStep1Bloc>(
        () => _i31.RegisterAccountStep1Bloc());
    gh.factory<_i32.RegisterOTPCompleteRepository>(() =>
        _i33.RegisterOTPCompleteRepositoryImpl(
            profileLocalStorage: gh<_i26.ProfileLocalStorage>()));
    gh.factory<_i34.RegisterOTPCompleteUseCase>(() =>
        _i34.RegisterOTPCompleteUseCase(
            registerOTPCompleteEventRepository:
                gh<_i32.RegisterOTPCompleteRepository>()));
    gh.factory<_i35.ResendOTPBloc>(() => _i35.ResendOTPBloc());
    gh.factory<_i36.SetupProfileGetLocalProfileRepository>(() =>
        _i37.SetupProfileGetLocalProfileRepositoryImpl(
            profileLocalStorage: gh<_i26.ProfileLocalStorage>()));
    gh.factory<_i38.SetupProfileGetLocalProfileUseCase>(() =>
        _i38.SetupProfileGetLocalProfileUseCase(
            setupProfileGetLocalProfileRepository:
                gh<_i36.SetupProfileGetLocalProfileRepository>()));
    gh.factory<_i39.SignUpBloc>(() => _i39.SignUpBloc());
    gh.factory<_i40.SkillsAndIndustryBloc>(() => _i40.SkillsAndIndustryBloc());
    gh.factory<_i41.SubmitRemoteTermsAndConditionsAcceptanceRepository>(
        () => _i42.SubmitRemoteTermsAndConditionsAcceptanceRepositoryImpl());
    gh.factory<_i43.SubmitRemoteTermsAndConditionsAcceptanceUseCase>(() =>
        _i43.SubmitRemoteTermsAndConditionsAcceptanceUseCase(
            submitRemoteTermsAndConditionsAcceptanceRepository:
                gh<_i41.SubmitRemoteTermsAndConditionsAcceptanceRepository>()));
    gh.factory<_i44.SubmitSignUpRepository>(
        () => _i45.SubmitSignUpRepositoryImpl());
    gh.factory<_i46.SubmitSignUpUseCase>(() => _i46.SubmitSignUpUseCase(
        submitSignUpRepository: gh<_i44.SubmitSignUpRepository>()));
    gh.factory<_i47.TokenLocalStorage>(() => _i48.TokenLocalStorageImpl());
    gh.factory<_i49.TokenModel>(() => _i49.TokenModel(
          refreshToken: gh<String>(),
          accessToken: gh<String>(),
          tokenID: gh<String>(),
        ));
    gh.factory<_i50.UserModel>(() => _i50.UserModel(id: gh<String>()));
    gh.factory<_i51.YouAreAllSetupBloc>(() => _i51.YouAreAllSetupBloc());
    gh.singleton<_i52.ApiService>(_i53.DioApiService(dio: gh<_i17.Dio>()));
    gh.singleton<_i54.Authentication>(
        _i55.PFirebaseAuthentication(firebaseAuth: gh<_i20.FirebaseAuth>()));
    gh.singleton<_i56.CandidatesService>(_i57.CandidatesServiceMock(
      apiService: gh<_i52.ApiService>(),
      tokenLocalStorage: gh<_i47.TokenLocalStorage>(),
    ));
    gh.factory<_i58.ContinueClickedRepository>(() =>
        _i59.ContinueClickedRepositoryImpl(
            authentication: gh<_i54.Authentication>()));
    gh.factory<_i60.ContinueClickedUseCase>(() => _i60.ContinueClickedUseCase(
        continueClickedRepository: gh<_i58.ContinueClickedRepository>()));
    gh.factory<_i61.GetPaginatedCandidatesByIndustryRepository>(() =>
        _i62.GetPaginatedCandidatesByIndustryRepositoryImpl(
            candidatesService: gh<_i56.CandidatesService>()));
    gh.factory<_i63.GetPaginatedCandidatesByIndustryUseCase>(() =>
        _i63.GetPaginatedCandidatesByIndustryUseCase(
            getPaginatedCandidateProfilesRepository:
                gh<_i61.GetPaginatedCandidatesByIndustryRepository>()));
    gh.singleton<_i64.IndustryService>(_i65.IndustryServiceImpl(
      apiService: gh<_i52.ApiService>(),
      tokenLocalStorage: gh<_i47.TokenLocalStorage>(),
    ));
    gh.factory<_i66.LoginContinueClickedRepository>(() =>
        _i67.LoginContinueClickedRepositoryImpl(
            authentication: gh<_i54.Authentication>()));
    gh.factory<_i68.LoginContinueClickedUseCase>(() =>
        _i68.LoginContinueClickedUseCase(
            loginContinueClickedRepository:
                gh<_i66.LoginContinueClickedRepository>()));
    gh.factory<_i69.LoginOTPCompleteEventRepository>(() =>
        _i70.LoginOTPCompleteEventRepositoryImpl(
            profileLocalStorage: gh<_i26.ProfileLocalStorage>()));
    gh.factory<_i71.LoginOTPCompleteEventUseCase>(() =>
        _i71.LoginOTPCompleteEventUseCase(
            loginOTPCompleteEventRepository:
                gh<_i69.LoginOTPCompleteEventRepository>()));
    gh.singleton<_i72.MembershipDetailsService>(
        _i73.MembershipDetailsServiceImpl(
      apiService: gh<_i52.ApiService>(),
      tokenLocalStorage: gh<_i47.TokenLocalStorage>(),
    ));
    gh.factory<_i74.OTPGetTokenRepository>(() => _i75.OTPGetTokenRepositoryImpl(
        authentication: gh<_i54.Authentication>()));
    gh.factory<_i76.OTPGetTokenUseCase>(() => _i76.OTPGetTokenUseCase(
        oTPGetTokenRepository: gh<_i74.OTPGetTokenRepository>()));
    gh.singleton<_i77.ProfileService>(_i78.ProfileServiceImpl(
      apiService: gh<_i52.ApiService>(),
      tokenLocalStorage: gh<_i47.TokenLocalStorage>(),
    ));
    gh.factory<_i79.RegisterBloc>(() => _i79.RegisterBloc(
        continueClickedUseCase: gh<_i60.ContinueClickedUseCase>()));
    gh.factory<_i80.ServiceCategoryCandidatesBloc>(() =>
        _i80.ServiceCategoryCandidatesBloc(
            getPaginatedCandidatesByIndustryUseCase:
                gh<_i63.GetPaginatedCandidatesByIndustryUseCase>()));
    gh.factory<_i81.SetupProfileRemoteSubmitProfileTypeRepository>(() =>
        _i82.SetupProfileRemoteSubmitProfileTypeRepositoryImpl(
            profileService: gh<_i77.ProfileService>()));
    gh.factory<_i83.SetupProfileRemoteSubmitProfileTypeUseCase>(() =>
        _i83.SetupProfileRemoteSubmitProfileTypeUseCase(
            setupProfileRemoteSubmitProfileTypeRepository:
                gh<_i81.SetupProfileRemoteSubmitProfileTypeRepository>()));
    gh.factory<_i84.TermsAndConditionsService>(
        () => _i85.TermsAndConditionsServiceImpl(
              apiService: gh<_i52.ApiService>(),
              tokenLocalStorage: gh<_i47.TokenLocalStorage>(),
            ));
    gh.singleton<_i86.UserService>(_i87.UserServiceImpl(
      apiService: gh<_i52.ApiService>(),
      tokenLocalStorage: gh<_i47.TokenLocalStorage>(),
    ));
    gh.factory<_i88.GetIndustriesRepository>(() =>
        _i89.GetIndustriesRepositoryImpl(
            industryService: gh<_i64.IndustryService>()));
    gh.factory<_i90.GetIndustriesUseCase>(() => _i90.GetIndustriesUseCase(
        getIndustriesRepository: gh<_i88.GetIndustriesRepository>()));
    gh.factory<_i91.GetMembershipInformationRepository>(() =>
        _i92.GetMembershipInformationRepositoryImpl(
            membershipDetailsService: gh<_i72.MembershipDetailsService>()));
    gh.factory<_i93.GetMembershipInformationUseCase>(() =>
        _i93.GetMembershipInformationUseCase(
            getMembershipInformationRepository:
                gh<_i91.GetMembershipInformationRepository>()));
    gh.factory<_i94.GetMyJobListingsRepository>(() =>
        _i95.GetMyJobListingsRepositoryImpl(
            industryService: gh<_i64.IndustryService>()));
    gh.factory<_i96.GetMyJobListingsRepository>(() =>
        _i97.GetMyJobListingsRepositoryImpl(
            industryService: gh<_i64.IndustryService>()));
    gh.factory<_i98.GetMyJobListingsUseCase>(() => _i98.GetMyJobListingsUseCase(
        getIndustriesRepository: gh<_i96.GetMyJobListingsRepository>()));
    gh.factory<_i99.GetMyJobListingsUseCase>(() => _i99.GetMyJobListingsUseCase(
        getIndustriesRepository: gh<_i94.GetMyJobListingsRepository>()));
    gh.factory<_i100.GetRemoteTermsAndConditionsRepository>(() =>
        _i101.GetRemoteTermsAndConditionsRepositoryImpl(
            termsAndConditionsService: gh<_i84.TermsAndConditionsService>()));
    gh.factory<_i102.GetRemoteTermsAndConditionsUseCase>(() =>
        _i102.GetRemoteTermsAndConditionsUseCase(
            getRemoteTermsAndConditionsRepository:
                gh<_i100.GetRemoteTermsAndConditionsRepository>()));
    gh.factory<_i103.JobsHiringLandingPageBloc>(() =>
        _i103.JobsHiringLandingPageBloc(
            getIndustriesUseCase: gh<_i90.GetIndustriesUseCase>()));
    gh.factory<_i104.LoginBloc>(() => _i104.LoginBloc(
        loginContinueClickedUsecase: gh<_i68.LoginContinueClickedUseCase>()));
    gh.factory<_i105.MembershipInformationBloc>(() =>
        _i105.MembershipInformationBloc(
            getMembershipInformationUseCase:
                gh<_i93.GetMembershipInformationUseCase>()));
    gh.factory<_i106.MyJobListingsBloc>(() => _i106.MyJobListingsBloc(
        getIndustriesUseCase: gh<_i98.GetMyJobListingsUseCase>()));
    gh.factory<_i107.OTPSaveRemoteProfileDataRepository>(() =>
        _i108.OTPSaveRemoteProfileDataRepositoryImpl(
            userService: gh<_i86.UserService>()));
    gh.factory<_i109.OTPSaveRemoteProfileDataUseCase>(() =>
        _i109.OTPSaveRemoteProfileDataUseCase(
            oTPSaveRemoteProfileDataRepository:
                gh<_i107.OTPSaveRemoteProfileDataRepository>()));
    gh.factory<_i110.SetupProfileBloc>(() => _i110.SetupProfileBloc(
          setupProfileRemoteSubmitProfileTypeUseCase:
              gh<_i83.SetupProfileRemoteSubmitProfileTypeUseCase>(),
          setupProfileGetLocalProfileUseCase:
              gh<_i38.SetupProfileGetLocalProfileUseCase>(),
        ));
    gh.factory<_i111.TermsAndConditionsBloc>(() => _i111.TermsAndConditionsBloc(
        getRemoteTermsAndConditionsUseCase:
            gh<_i102.GetRemoteTermsAndConditionsUseCase>()));
    gh.factory<_i112.otpBloc>(() => _i112.otpBloc(
          registerOTPCompleteUseCase: gh<_i34.RegisterOTPCompleteUseCase>(),
          otpGetTokenUseCase: gh<_i76.OTPGetTokenUseCase>(),
          otpSaveRemoteProfileDataUseCase:
              gh<_i109.OTPSaveRemoteProfileDataUseCase>(),
        ));
    gh.factory<_i113.CreateJobListingBloc>(() => _i113.CreateJobListingBloc(
        getIndustriesUseCase: gh<_i99.GetMyJobListingsUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i114.RegisterModule {}
