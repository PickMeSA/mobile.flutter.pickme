// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i14;
import 'package:firebase_auth/firebase_auth.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/add_memberships/presentation/bloc/add_memberships_bloc.dart'
    as _i3;
import '../../features/add_qualification/presentation/bloc/add_qualification_bloc.dart'
    as _i4;
import '../../features/add_skills/data/repository_impl/add_skills_repository_impl/add_skills_get_industry_list_repository_impl.dart'
    as _i99;
import '../../features/add_skills/data/repository_impl/add_skills_repository_impl/add_skills_get_skills_list_repository_impl.dart'
    as _i102;
import '../../features/add_skills/data/repository_impl/add_skills_repository_impl/add_skills_submit_remote_skills_and_industry_repository_impl.dart'
    as _i105;
import '../../features/add_skills/domain/repository/add_skills_repository/add_skills_get_industry_list_repository.dart'
    as _i98;
import '../../features/add_skills/domain/repository/add_skills_repository/add_skills_get_skills_list_repository.dart'
    as _i101;
import '../../features/add_skills/domain/repository/add_skills_repository/add_skills_submit_remote_skills_and_industry_repository.dart'
    as _i104;
import '../../features/add_skills/domain/use_cases/add_skills_usecase/add_skills_get_industry_list_usecase.dart'
    as _i100;
import '../../features/add_skills/domain/use_cases/add_skills_usecase/add_skills_get_skills_list_usecase.dart'
    as _i103;
import '../../features/add_skills/domain/use_cases/add_skills_usecase/add_skills_submit_remote_skills_and_industry_usecase.dart'
    as _i106;
import '../../features/add_skills/presentation/bloc/add_skills_bloc.dart'
    as _i143;
import '../../features/add_work_experience/presentation/bloc/add_work_experience_bloc.dart'
    as _i5;
import '../../features/bank_details/data/repository_impl/bank_details_submitted_repositoty_impl.dart'
    as _i108;
import '../../features/bank_details/domain/repository/bank_details_submitted_repository.dart'
    as _i107;
import '../../features/bank_details/domain/usecases/bank_details_submitted_usecase.dart'
    as _i109;
import '../../features/bank_details/presentation/bloc/bank_details_bloc.dart'
    as _i145;
import '../../features/final_details/data/repository_impl/submit_final_details_repository_impl.dart'
    as _i84;
import '../../features/final_details/domain/repository/submit_final_details_repository.dart'
    as _i83;
import '../../features/final_details/domain/usecases/submit_final_details_usecase.dart'
    as _i85;
import '../../features/final_details/presentation/bloc/final_details_bloc.dart'
    as _i147;
import '../../features/jobs/applying/jobs_landing_page/presentation/bloc/jobs_landing_page_bloc.dart'
    as _i17;
import '../../features/jobs/hiring/all_services/presentation/bloc/all_services_page_bloc.dart'
    as _i144;
import '../../features/jobs/hiring/candidate_filters/presentation/bloc/filter_candidates_bloc.dart'
    as _i15;
import '../../features/jobs/hiring/create_job_listing/data/repository_impl/get_industries_repository_impl/get_my_job_listings_repository_impl.dart'
    as _i117;
import '../../features/jobs/hiring/create_job_listing/domain/repository/get_my_job_listings_repository.dart'
    as _i116;
import '../../features/jobs/hiring/create_job_listing/domain/use_cases/otp_usecase/get_my_job_listings_usecase.dart'
    as _i120;
import '../../features/jobs/hiring/create_job_listing/presentation/bloc/create_job_listing_bloc.dart'
    as _i146;
import '../../features/jobs/hiring/landing_page/presentation/bloc/jobs_hiring_landing_page_bloc.dart'
    as _i128;
import '../../features/jobs/hiring/my_job_listings/data/repository_impl/get_industries_repository_impl/get_my_job_listings_repository_impl.dart'
    as _i119;
import '../../features/jobs/hiring/my_job_listings/domain/repository/get_my_job_listings_repository.dart'
    as _i118;
import '../../features/jobs/hiring/my_job_listings/domain/use_cases/otp_usecase/get_my_job_listings_usecase.dart'
    as _i121;
import '../../features/jobs/hiring/my_job_listings/presentation/bloc/my_job_listings_bloc.dart'
    as _i131;
import '../../features/jobs/hiring/pending_profile/presentation/bloc/pending_profile_bloc.dart'
    as _i21;
import '../../features/jobs/hiring/service_category_candidates/presentation/bloc/service_category_candidates_bloc.dart'
    as _i77;
import '../../features/jobs/shared/data/repository_impl/get_candidates_repository_impl.dart'
    as _i55;
import '../../features/jobs/shared/data/repository_impl/get_industries_repository_impl.dart'
    as _i111;
import '../../features/jobs/shared/domain/repositories/get_industries_repository.dart'
    as _i110;
import '../../features/jobs/shared/domain/repositories/get_paginated_candidates_repository.dart'
    as _i54;
import '../../features/jobs/shared/domain/usecases/get_industries_usecase.dart'
    as _i112;
import '../../features/jobs/shared/domain/usecases/get_paginated_candidates_usecase.dart'
    as _i56;
import '../../features/landing/presentation/bloc/landing_bloc.dart' as _i18;
import '../../features/location/presentation/bloc/location_bloc.dart' as _i19;
import '../../features/login/data/repository_impl/login_repository_impl/login_continue_clicked_repository_impl.dart'
    as _i62;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i10;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i13;
import '../../features/login/domain/entities/token/token_model.dart' as _i42;
import '../../features/login/domain/repository/login_repository/login_continue_clicked_repository.dart'
    as _i61;
import '../../features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart'
    as _i63;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i129;
import '../../features/membership_information/data/repository_impl/membership_information_repository_impl/get_membership_information_repository_impl.dart'
    as _i114;
import '../../features/membership_information/data/service/remote/membership_details_service.dart'
    as _i67;
import '../../features/membership_information/data/service/remote/membership_details_service_impl.dart'
    as _i68;
import '../../features/membership_information/domain/repository/membership_information_repository/get_membership_information_repository.dart'
    as _i113;
import '../../features/membership_information/domain/use_cases/membership_information_usecase/get_membership_information_usecase.dart'
    as _i115;
import '../../features/membership_information/presentation/bloc/membership_information_bloc.dart'
    as _i130;
import '../../features/minimum_wage/presentation/bloc/minimum_wage_bloc.dart'
    as _i20;
import '../../features/qualification/data/repository_impl/qualification_repository_impl/submit_remote_qualifications_and_experience_repository_impl.dart'
    as _i87;
import '../../features/qualification/domain/repository/qualification_repository/submit_remote_qualifications_and_experience_repository.dart'
    as _i86;
import '../../features/qualification/domain/use_cases/qualification_usecase/submit_remote_qualifications_and_experience_usecase.dart'
    as _i88;
import '../../features/qualification/presentation/bloc/qualification_bloc.dart'
    as _i135;
import '../../features/rate_and_work_times/data/repository_impl/rate_and_work_times_repository_impl/submit_remote_rate_and_work_times_repository_impl.dart'
    as _i90;
import '../../features/rate_and_work_times/domain/repository/rate_and_work_times_repository/submit_remote_rate_and_work_times_repository.dart'
    as _i89;
import '../../features/rate_and_work_times/domain/use_cases/rate_and_work_times_usecase/submit_remote_rate_and_work_times_usecase.dart'
    as _i91;
import '../../features/rate_and_work_times/presentation/bloc/rate_and_work_times_bloc.dart'
    as _i136;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i52;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i51;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i53;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i76;
import '../../features/register_account_step_1/presentation/bloc/register_account_step1_bloc.dart'
    as _i25;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_get_local_profile_repository_impl.dart'
    as _i31;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_remote_submit_profile_type__repository_impl.dart'
    as _i79;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart'
    as _i30;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_remote_submit_profile_type__repository.dart'
    as _i78;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart'
    as _i32;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_remote_submit_profile_type__usecase.dart'
    as _i80;
import '../../features/setup_profile/presentation/bloc/setup_profile_bloc.dart'
    as _i137;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i38;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i37;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i39;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i33;
import '../../features/terms_and_conditions/data/repository_impl/terms_and_conditions_repository_impl/get_remote_terms_and_conditions_repository_impl.dart'
    as _i126;
import '../../features/terms_and_conditions/data/repository_impl/terms_and_conditions_repository_impl/submit_remote_terms_and_conditions_acceptance_repository_impl.dart'
    as _i35;
import '../../features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service.dart'
    as _i92;
import '../../features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service_impl.dart'
    as _i93;
import '../../features/terms_and_conditions/domain/repository/terms_and_conditions_repository/get_remote_terms_and_conditions_repository.dart'
    as _i125;
import '../../features/terms_and_conditions/domain/repository/terms_and_conditions_repository/submit_remote_terms_and_conditions_acceptance_repository.dart'
    as _i34;
import '../../features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/get_remote_terms_and_conditions_usecase.dart'
    as _i127;
import '../../features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/submit_remote_terms_and_conditions_acceptance_usecase.dart'
    as _i36;
import '../../features/terms_and_conditions/presentation/bloc/terms_and_conditions_bloc.dart'
    as _i138;
import '../../features/you_are_all_setup/presentation/bloc/you_are_all_setup_bloc.dart'
    as _i44;
import '../../localization/generated/l10n.dart' as _i6;
import '../../navigation/app_route.dart' as _i7;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/get_remote_profile_repository_impl.dart'
    as _i123;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/login_otp_complete_event_repository_impl.dart'
    as _i65;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_token_repository_impl.dart'
    as _i70;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_save_remote_profile_data_repository_impl.dart'
    as _i133;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/register_otp_complete_repository_impl.dart'
    as _i27;
import '../../shared/features/otp/domain/repository/otp_repository/get_remote_profile_repository.dart'
    as _i122;
import '../../shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart'
    as _i64;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart'
    as _i69;
import '../../shared/features/otp/domain/repository/otp_repository/otp_save_remote_profile_data_repository.dart'
    as _i132;
import '../../shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart'
    as _i26;
import '../../shared/features/otp/domain/use_cases/otp_usecase/get_remote_profile_usecase.dart'
    as _i124;
import '../../shared/features/otp/domain/use_cases/otp_usecase/login_otp_complete_event_usecase.dart'
    as _i66;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart'
    as _i71;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_save_remote_profile_data_usecase.dart'
    as _i134;
import '../../shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart'
    as _i28;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i142;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i29;
import '../../shared/features/upload_file/data/repository_impl/upload_file_repository_impl.dart'
    as _i140;
import '../../shared/features/upload_file/domain/repository/upload_file_repository.dart'
    as _i139;
import '../../shared/features/upload_file/domain/usecases/upload_file_usecase.dart'
    as _i141;
import '../../shared/remote/api-service.dart' as _i45;
import '../../shared/remote/dio_api_service_impl.dart' as _i46;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i8;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i9;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage.dart'
    as _i11;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage_impl.dart'
    as _i12;
import '../../shared/services/local/Hive/profile_local_storage/profile/profile_model.dart'
    as _i24;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage.dart'
    as _i22;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage_impl.dart'
    as _i23;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage.dart'
    as _i40;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage_impl.dart'
    as _i41;
import '../../shared/services/local/Hive/user_local_storage/user/user_model.dart'
    as _i43;
import '../../shared/services/local/mock_data/candidates_service_mock/candidates_service_mock_impl.dart'
    as _i50;
import '../../shared/services/remote/api_service/candidates_service/candidates_service.dart'
    as _i49;
import '../../shared/services/remote/api_service/industries_service/industry_service.dart'
    as _i59;
import '../../shared/services/remote/api_service/industries_service/industry_service_impl.dart'
    as _i60;
import '../../shared/services/remote/api_service/industry_service/industry_service.dart'
    as _i57;
import '../../shared/services/remote/api_service/industry_service/industry_service_impl.dart'
    as _i58;
import '../../shared/services/remote/api_service/places_service/places_service.dart'
    as _i72;
import '../../shared/services/remote/api_service/places_service/places_service_impl.dart'
    as _i73;
import '../../shared/services/remote/api_service/profile_service/profile_service.dart'
    as _i74;
import '../../shared/services/remote/api_service/profile_service/profile_service_impl.dart'
    as _i75;
import '../../shared/services/remote/api_service/skills_service/skills_service.dart'
    as _i81;
import '../../shared/services/remote/api_service/skills_service/skills_service_impl.dart'
    as _i82;
import '../../shared/services/remote/api_service/upload_file_service/upload_file_service.dart'
    as _i94;
import '../../shared/services/remote/api_service/upload_file_service/upload_file_service_impl.dart'
    as _i95;
import '../../shared/services/remote/api_service/user_service/user_service.dart'
    as _i96;
import '../../shared/services/remote/api_service/user_service/user_service_impl.dart'
    as _i97;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i47;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i48;
import 'locator.dart' as _i148;

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
    gh.factory<_i5.AddWorkExperienceBloc>(() => _i5.AddWorkExperienceBloc());
    gh.factory<_i6.AppLocalizations>(() => registerModule.appLocalizations);
    gh.lazySingleton<_i7.AppRouter>(() => _i7.AppRouter());
    gh.factory<_i8.AppStateLocalStorage>(() => _i9.AppStateLocalStorageImpl());
    gh.factory<_i10.AppStateModel>(
        () => _i10.AppStateModel(loggedIn: gh<bool>()));
    gh.singleton<_i11.BiometricsLocalStorage>(
        _i12.BiometricsLocalStorageImpl());
    gh.factory<_i13.BiometricsModel>(
        () => _i13.BiometricsModel(biometrics: gh<bool>()));
    gh.factory<_i14.Dio>(() => registerModule.dio);
    gh.factory<_i15.FilterCandidatesBloc>(() => _i15.FilterCandidatesBloc());
    gh.singleton<_i16.FirebaseAuth>(registerModule.firebaseAuth);
    gh.factory<_i17.JobsLandingPageBloc>(() => _i17.JobsLandingPageBloc());
    gh.factory<_i18.LandingBloc>(() => _i18.LandingBloc());
    gh.factory<_i19.LocationBloc>(() => _i19.LocationBloc(
        locationRemoteSubmitLocationUseCase: gh<InvalidType>()));
    gh.factory<_i20.MinimumWageBloc>(() => _i20.MinimumWageBloc());
    gh.factory<_i21.PendingProfileBloc>(() => _i21.PendingProfileBloc());
    gh.factory<_i22.ProfileLocalStorage>(() => _i23.ProfileLocalStorageImpl());
    gh.factory<_i24.ProfileModel>(() => _i24.ProfileModel(
          workPermitNumber: gh<String>(),
          idNumber: gh<String>(),
          emailAddress: gh<String>(),
          phoneNumber: gh<String>(),
          surname: gh<String>(),
          firstName: gh<String>(),
          passportNumber: gh<String>(),
        ));
    gh.factory<_i25.RegisterAccountStep1Bloc>(
        () => _i25.RegisterAccountStep1Bloc());
    gh.factory<_i26.RegisterOTPCompleteRepository>(() =>
        _i27.RegisterOTPCompleteRepositoryImpl(
            profileLocalStorage: gh<_i22.ProfileLocalStorage>()));
    gh.factory<_i28.RegisterOTPCompleteUseCase>(() =>
        _i28.RegisterOTPCompleteUseCase(
            registerOTPCompleteEventRepository:
                gh<_i26.RegisterOTPCompleteRepository>()));
    gh.factory<_i29.ResendOTPBloc>(() => _i29.ResendOTPBloc());
    gh.factory<_i30.SetupProfileGetLocalProfileRepository>(() =>
        _i31.SetupProfileGetLocalProfileRepositoryImpl(
            profileLocalStorage: gh<_i22.ProfileLocalStorage>()));
    gh.factory<_i32.SetupProfileGetLocalProfileUseCase>(() =>
        _i32.SetupProfileGetLocalProfileUseCase(
            setupProfileGetLocalProfileRepository:
                gh<_i30.SetupProfileGetLocalProfileRepository>()));
    gh.factory<_i33.SignUpBloc>(() => _i33.SignUpBloc());
    gh.factory<_i34.SubmitRemoteTermsAndConditionsAcceptanceRepository>(
        () => _i35.SubmitRemoteTermsAndConditionsAcceptanceRepositoryImpl());
    gh.factory<_i36.SubmitRemoteTermsAndConditionsAcceptanceUseCase>(() =>
        _i36.SubmitRemoteTermsAndConditionsAcceptanceUseCase(
            submitRemoteTermsAndConditionsAcceptanceRepository:
                gh<_i34.SubmitRemoteTermsAndConditionsAcceptanceRepository>()));
    gh.factory<_i37.SubmitSignUpRepository>(
        () => _i38.SubmitSignUpRepositoryImpl());
    gh.factory<_i39.SubmitSignUpUseCase>(() => _i39.SubmitSignUpUseCase(
        submitSignUpRepository: gh<_i37.SubmitSignUpRepository>()));
    gh.factory<_i40.TokenLocalStorage>(() => _i41.TokenLocalStorageImpl());
    gh.factory<_i42.TokenModel>(() => _i42.TokenModel(
          refreshToken: gh<String>(),
          accessToken: gh<String>(),
          tokenID: gh<String>(),
        ));
    gh.factory<_i43.UserModel>(() => _i43.UserModel(id: gh<String>()));
    gh.factory<_i44.YouAreAllSetupBloc>(() => _i44.YouAreAllSetupBloc());
    gh.singleton<_i45.ApiService>(_i46.DioApiService(dio: gh<_i14.Dio>()));
    gh.singleton<_i47.Authentication>(
        _i48.PFirebaseAuthentication(firebaseAuth: gh<_i16.FirebaseAuth>()));
    gh.singleton<_i49.CandidatesService>(_i50.CandidatesServiceMock(
      apiService: gh<_i45.ApiService>(),
      tokenLocalStorage: gh<dynamic>(),
    ));
    gh.factory<_i51.ContinueClickedRepository>(() =>
        _i52.ContinueClickedRepositoryImpl(
            authentication: gh<_i47.Authentication>()));
    gh.factory<_i53.ContinueClickedUseCase>(() => _i53.ContinueClickedUseCase(
        continueClickedRepository: gh<_i51.ContinueClickedRepository>()));
    gh.factory<_i54.GetPaginatedCandidatesByIndustryRepository>(() =>
        _i55.GetPaginatedCandidatesByIndustryRepositoryImpl(
            candidatesService: gh<_i49.CandidatesService>()));
    gh.factory<_i56.GetPaginatedCandidatesByIndustryUseCase>(() =>
        _i56.GetPaginatedCandidatesByIndustryUseCase(
            getPaginatedCandidateProfilesRepository:
                gh<_i54.GetPaginatedCandidatesByIndustryRepository>()));
    gh.singleton<_i57.IndustryService>(
        _i58.IndustryServiceImpl(apiService: gh<_i45.ApiService>()));
    gh.singleton<_i59.IndustryService>(_i60.IndustryServiceImpl(
      apiService: gh<_i45.ApiService>(),
      tokenLocalStorage: gh<dynamic>(),
    ));
    gh.factory<_i61.LoginContinueClickedRepository>(() =>
        _i62.LoginContinueClickedRepositoryImpl(
            authentication: gh<_i47.Authentication>()));
    gh.factory<_i63.LoginContinueClickedUseCase>(() =>
        _i63.LoginContinueClickedUseCase(
            loginContinueClickedRepository:
                gh<_i61.LoginContinueClickedRepository>()));
    gh.factory<_i64.LoginOTPCompleteEventRepository>(() =>
        _i65.LoginOTPCompleteEventRepositoryImpl(
            profileLocalStorage: gh<_i22.ProfileLocalStorage>()));
    gh.factory<_i66.LoginOTPCompleteEventUseCase>(() =>
        _i66.LoginOTPCompleteEventUseCase(
            loginOTPCompleteEventRepository:
                gh<_i64.LoginOTPCompleteEventRepository>()));
    gh.singleton<_i67.MembershipDetailsService>(
        _i68.MembershipDetailsServiceImpl(apiService: gh<_i45.ApiService>()));
    gh.factory<_i69.OTPGetTokenRepository>(() => _i70.OTPGetTokenRepositoryImpl(
        authentication: gh<_i47.Authentication>()));
    gh.factory<_i71.OTPGetTokenUseCase>(() => _i71.OTPGetTokenUseCase(
        oTPGetTokenRepository: gh<_i69.OTPGetTokenRepository>()));
    gh.factory<_i72.PlacesService>(
        () => _i73.PlacesServiceImpl(apiService: gh<_i45.ApiService>()));
    gh.singleton<_i74.ProfileService>(_i75.ProfileServiceImpl(
      apiService: gh<_i45.ApiService>(),
      tokenLocalStorage: gh<dynamic>(),
    ));
    gh.factory<_i76.RegisterBloc>(() => _i76.RegisterBloc(
        continueClickedUseCase: gh<_i53.ContinueClickedUseCase>()));
    gh.factory<_i77.ServiceCategoryCandidatesBloc>(() =>
        _i77.ServiceCategoryCandidatesBloc(
            getPaginatedCandidatesByIndustryUseCase:
                gh<_i56.GetPaginatedCandidatesByIndustryUseCase>()));
    gh.factory<_i78.SetupProfileRemoteSubmitProfileTypeRepository>(() =>
        _i79.SetupProfileRemoteSubmitProfileTypeRepositoryImpl(
            profileService: gh<_i74.ProfileService>()));
    gh.factory<_i80.SetupProfileRemoteSubmitProfileTypeUseCase>(() =>
        _i80.SetupProfileRemoteSubmitProfileTypeUseCase(
            setupProfileRemoteSubmitProfileTypeRepository:
                gh<_i78.SetupProfileRemoteSubmitProfileTypeRepository>()));
    gh.singleton<_i81.SkillsService>(
        _i82.SkillsServiceImpl(apiService: gh<_i45.ApiService>()));
    gh.factory<_i83.SubmitFinalDetailsRepository>(() =>
        _i84.SubmitFinalDetailsRepositoryImpl(
            profileService: gh<_i74.ProfileService>()));
    gh.factory<_i85.SubmitFinalDetailsUseCase>(() =>
        _i85.SubmitFinalDetailsUseCase(
            submitFinalDetailsRepository:
                gh<_i83.SubmitFinalDetailsRepository>()));
    gh.factory<_i86.SubmitRemoteQualificationAndExperienceRepository>(() =>
        _i87.SubmitRemoteQualificationAndExperienceRepositoryImpl(
            profileService: gh<_i74.ProfileService>()));
    gh.factory<_i88.SubmitRemoteQualificationAndExperienceUseCase>(() =>
        _i88.SubmitRemoteQualificationAndExperienceUseCase(
            submitRemoteQualificationAndExperienceRepository:
                gh<_i86.SubmitRemoteQualificationAndExperienceRepository>()));
    gh.factory<_i89.SubmitRemoteRateAndWorkTimesRepository>(() =>
        _i90.SubmitRemoteRateAndWorkTimesRepositoryImpl(
            profileService: gh<_i74.ProfileService>()));
    gh.factory<_i91.SubmitRemoteRateAndWorkTimesUseCase>(() =>
        _i91.SubmitRemoteRateAndWorkTimesUseCase(
            submitRemoteRateAndWorkTimesRepository:
                gh<_i89.SubmitRemoteRateAndWorkTimesRepository>()));
    gh.factory<_i92.TermsAndConditionsService>(() =>
        _i93.TermsAndConditionsServiceImpl(apiService: gh<_i45.ApiService>()));
    gh.factory<_i94.UploadFileService>(
        () => _i95.UploadFileServiceImpl(apiService: gh<_i45.ApiService>()));
    gh.singleton<_i96.UserService>(
        _i97.UserServiceImpl(apiService: gh<_i45.ApiService>()));
    gh.factory<_i98.AddSkillsGetIndustryListRepository>(() =>
        _i99.AddSkillsGetIndustryListRepositoryImpl(
            industryService: gh<_i57.IndustryService>()));
    gh.factory<_i100.AddSkillsGetIndustryListUseCase>(() =>
        _i100.AddSkillsGetIndustryListUseCase(
            addSkillsGetIndustryListRepository:
                gh<_i98.AddSkillsGetIndustryListRepository>()));
    gh.factory<_i101.AddSkillsGetSkillsListRepository>(() =>
        _i102.AddSkillsGetSkillsListRepositoryImpl(
            skillsService: gh<_i81.SkillsService>()));
    gh.factory<_i103.AddSkillsGetSkillsListUseCase>(() =>
        _i103.AddSkillsGetSkillsListUseCase(
            addSkillsGetSkillsListRepository:
                gh<_i101.AddSkillsGetSkillsListRepository>()));
    gh.factory<_i104.AddSkillsSubmitRemoteSkillsAndIndustryRepository>(() =>
        _i105.AddSkillsSubmitRemoteSkillsAndIndustryRepositoryImpl(
            profileService: gh<_i74.ProfileService>()));
    gh.factory<_i106.AddSkillsSubmitRemoteSkillsAndIndustryUseCase>(() =>
        _i106.AddSkillsSubmitRemoteSkillsAndIndustryUseCase(
            addSkillsSubmitRemoteSkillsAndIndustryRepository:
                gh<_i104.AddSkillsSubmitRemoteSkillsAndIndustryRepository>()));
    gh.factory<_i107.BankDetailsSubmittedRepository>(() =>
        _i108.BankDetailsSubmittedRepositoryImpl(
            profileService: gh<_i74.ProfileService>()));
    gh.factory<_i109.BankDetailsSubmittedUseCase>(() =>
        _i109.BankDetailsSubmittedUseCase(
            bankDetailsSubmittedRepository:
                gh<_i107.BankDetailsSubmittedRepository>()));
    gh.factory<_i110.GetIndustriesRepository>(() =>
        _i111.GetIndustriesRepositoryImpl(
            industryService: gh<_i59.IndustryService>()));
    gh.factory<_i112.GetIndustriesUseCase>(() => _i112.GetIndustriesUseCase(
        getIndustriesRepository: gh<_i110.GetIndustriesRepository>()));
    gh.factory<_i113.GetMembershipInformationRepository>(() =>
        _i114.GetMembershipInformationRepositoryImpl(
            membershipDetailsService: gh<_i67.MembershipDetailsService>()));
    gh.factory<_i115.GetMembershipInformationUseCase>(() =>
        _i115.GetMembershipInformationUseCase(
            getMembershipInformationRepository:
                gh<_i113.GetMembershipInformationRepository>()));
    gh.factory<_i116.GetMyJobListingsRepository>(() =>
        _i117.GetMyJobListingsRepositoryImpl(
            industryService: gh<_i59.IndustryService>()));
    gh.factory<_i118.GetMyJobListingsRepository>(() =>
        _i119.GetMyJobListingsRepositoryImpl(
            industryService: gh<_i59.IndustryService>()));
    gh.factory<_i120.GetMyJobListingsUseCase>(() =>
        _i120.GetMyJobListingsUseCase(
            getIndustriesRepository: gh<_i116.GetMyJobListingsRepository>()));
    gh.factory<_i121.GetMyJobListingsUseCase>(() =>
        _i121.GetMyJobListingsUseCase(
            getIndustriesRepository: gh<_i118.GetMyJobListingsRepository>()));
    gh.factory<_i122.GetRemoteProfileRepository>(() =>
        _i123.GetRemoteProfileRepositoryImpl(
            profileService: gh<_i74.ProfileService>()));
    gh.factory<_i124.GetRemoteProfileUseCase>(() =>
        _i124.GetRemoteProfileUseCase(
            getRemoteProfileRepository:
                gh<_i122.GetRemoteProfileRepository>()));
    gh.factory<_i125.GetRemoteTermsAndConditionsRepository>(() =>
        _i126.GetRemoteTermsAndConditionsRepositoryImpl(
            termsAndConditionsService: gh<_i92.TermsAndConditionsService>()));
    gh.factory<_i127.GetRemoteTermsAndConditionsUseCase>(() =>
        _i127.GetRemoteTermsAndConditionsUseCase(
            getRemoteTermsAndConditionsRepository:
                gh<_i125.GetRemoteTermsAndConditionsRepository>()));
    gh.factory<_i128.JobsHiringLandingPageBloc>(
        () => _i128.JobsHiringLandingPageBloc(
              getIndustriesUseCase: gh<_i112.GetIndustriesUseCase>(),
              getPaginatedCandidatesByIndustryUseCase:
                  gh<_i56.GetPaginatedCandidatesByIndustryUseCase>(),
            ));
    gh.factory<_i129.LoginBloc>(() => _i129.LoginBloc(
        loginContinueClickedUsecase: gh<_i63.LoginContinueClickedUseCase>()));
    gh.factory<_i130.MembershipInformationBloc>(() =>
        _i130.MembershipInformationBloc(
            getMembershipInformationUseCase:
                gh<_i115.GetMembershipInformationUseCase>()));
    gh.factory<_i131.MyJobListingsBloc>(() => _i131.MyJobListingsBloc(
        getIndustriesUseCase: gh<_i121.GetMyJobListingsUseCase>()));
    gh.factory<_i132.OTPSaveRemoteProfileDataRepository>(() =>
        _i133.OTPSaveRemoteProfileDataRepositoryImpl(
            userService: gh<_i96.UserService>()));
    gh.factory<_i134.OTPSaveRemoteProfileDataUseCase>(() =>
        _i134.OTPSaveRemoteProfileDataUseCase(
            oTPSaveRemoteProfileDataRepository:
                gh<_i132.OTPSaveRemoteProfileDataRepository>()));
    gh.factory<_i135.QualificationsBloc>(() => _i135.QualificationsBloc(
        submitRemoteQualificationAndExperienceUseCase:
            gh<_i88.SubmitRemoteQualificationAndExperienceUseCase>()));
    gh.factory<_i136.RateAndWorkTimesBloc>(() => _i136.RateAndWorkTimesBloc(
        submitRemoteRateAndWorkTimesUseCase:
            gh<_i91.SubmitRemoteRateAndWorkTimesUseCase>()));
    gh.factory<_i137.SetupProfileBloc>(() => _i137.SetupProfileBloc(
          setupProfileRemoteSubmitProfileTypeUseCase:
              gh<_i80.SetupProfileRemoteSubmitProfileTypeUseCase>(),
          setupProfileGetLocalProfileUseCase:
              gh<_i32.SetupProfileGetLocalProfileUseCase>(),
        ));
    gh.factory<_i138.TermsAndConditionsBloc>(() => _i138.TermsAndConditionsBloc(
        getRemoteTermsAndConditionsUseCase:
            gh<_i127.GetRemoteTermsAndConditionsUseCase>()));
    gh.factory<_i139.UploadFileRepository>(() => _i140.UploadFileRepositoryImpl(
        uploadFileService: gh<_i94.UploadFileService>()));
    gh.factory<_i141.UploadFileUseCase>(() => _i141.UploadFileUseCase(
        uploadFileRepository: gh<_i139.UploadFileRepository>()));
    gh.factory<_i142.otpBloc>(() => _i142.otpBloc(
          getRemoteProfileUseCase: gh<_i124.GetRemoteProfileUseCase>(),
          registerOTPCompleteUseCase: gh<_i28.RegisterOTPCompleteUseCase>(),
          otpGetTokenUseCase: gh<_i71.OTPGetTokenUseCase>(),
          otpSaveRemoteProfileDataUseCase:
              gh<_i134.OTPSaveRemoteProfileDataUseCase>(),
        ));
    gh.factory<_i143.AddSkillsBloc>(() => _i143.AddSkillsBloc(
          addSkillsGetIndustryListUseCase:
              gh<_i100.AddSkillsGetIndustryListUseCase>(),
          addSkillsGetSkillsListUseCase:
              gh<_i103.AddSkillsGetSkillsListUseCase>(),
          addSkillsSubmitRemoteSkillsAndIndustryUseCase:
              gh<_i106.AddSkillsSubmitRemoteSkillsAndIndustryUseCase>(),
        ));
    gh.factory<_i144.AllServicesPageBloc>(() => _i144.AllServicesPageBloc(
          getIndustriesUseCase: gh<_i112.GetIndustriesUseCase>(),
          getPaginatedCandidatesByIndustryUseCase:
              gh<_i56.GetPaginatedCandidatesByIndustryUseCase>(),
        ));
    gh.factory<_i145.BankDetailsBloc>(() => _i145.BankDetailsBloc(
        bankDetailsSubmittedUseCase: gh<_i109.BankDetailsSubmittedUseCase>()));
    gh.factory<_i146.CreateJobListingBloc>(() => _i146.CreateJobListingBloc(
        getIndustriesUseCase: gh<_i120.GetMyJobListingsUseCase>()));
    gh.factory<_i147.FinalDetailsBloc>(() => _i147.FinalDetailsBloc(
          uploadFileUseCase: gh<_i141.UploadFileUseCase>(),
          submitFinalDetailsUseCase: gh<_i85.SubmitFinalDetailsUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i148.RegisterModule {}
