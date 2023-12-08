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
    as _i98;
import '../../features/add_skills/data/repository_impl/add_skills_repository_impl/add_skills_get_skills_list_repository_impl.dart'
    as _i101;
import '../../features/add_skills/data/repository_impl/add_skills_repository_impl/add_skills_submit_remote_skills_and_industry_repository_impl.dart'
    as _i104;
import '../../features/add_skills/domain/repository/add_skills_repository/add_skills_get_industry_list_repository.dart'
    as _i97;
import '../../features/add_skills/domain/repository/add_skills_repository/add_skills_get_skills_list_repository.dart'
    as _i100;
import '../../features/add_skills/domain/repository/add_skills_repository/add_skills_submit_remote_skills_and_industry_repository.dart'
    as _i103;
import '../../features/add_skills/domain/use_cases/add_skills_usecase/add_skills_get_industry_list_usecase.dart'
    as _i99;
import '../../features/add_skills/domain/use_cases/add_skills_usecase/add_skills_get_skills_list_usecase.dart'
    as _i102;
import '../../features/add_skills/domain/use_cases/add_skills_usecase/add_skills_submit_remote_skills_and_industry_usecase.dart'
    as _i105;
import '../../features/add_skills/presentation/bloc/add_skills_bloc.dart'
    as _i145;
import '../../features/add_work_experience/presentation/bloc/add_work_experience_bloc.dart'
    as _i5;
import '../../features/bank_details/data/repository_impl/bank_details_submitted_repositoty_impl.dart'
    as _i107;
import '../../features/bank_details/domain/repository/bank_details_submitted_repository.dart'
    as _i106;
import '../../features/bank_details/domain/usecases/bank_details_submitted_usecase.dart'
    as _i108;
import '../../features/bank_details/presentation/bloc/bank_details_bloc.dart'
    as _i147;
import '../../features/final_details/data/repository_impl/submit_final_details_repository_impl.dart'
    as _i83;
import '../../features/final_details/domain/repository/submit_final_details_repository.dart'
    as _i82;
import '../../features/final_details/domain/usecases/submit_final_details_usecase.dart'
    as _i84;
import '../../features/final_details/presentation/bloc/final_details_bloc.dart'
    as _i149;
import '../../features/jobs/applying/jobs_landing_page/presentation/bloc/jobs_landing_page_bloc.dart'
    as _i17;
import '../../features/jobs/hiring/all_services/presentation/bloc/all_services_page_bloc.dart'
    as _i146;
import '../../features/jobs/hiring/candidate_filters/presentation/bloc/filter_candidates_bloc.dart'
    as _i15;
import '../../features/jobs/hiring/create_job_listing/data/repository_impl/get_industries_repository_impl/get_my_job_listings_repository_impl.dart'
    as _i116;
import '../../features/jobs/hiring/create_job_listing/domain/repository/get_my_job_listings_repository.dart'
    as _i115;
import '../../features/jobs/hiring/create_job_listing/domain/use_cases/otp_usecase/get_my_job_listings_usecase.dart'
    as _i119;
import '../../features/jobs/hiring/create_job_listing/presentation/bloc/create_job_listing_bloc.dart'
    as _i148;
import '../../features/jobs/hiring/landing_page/presentation/bloc/jobs_hiring_landing_page_bloc.dart'
    as _i127;
import '../../features/jobs/hiring/my_job_listings/data/repository_impl/get_industries_repository_impl/get_my_job_listings_repository_impl.dart'
    as _i118;
import '../../features/jobs/hiring/my_job_listings/domain/repository/get_my_job_listings_repository.dart'
    as _i117;
import '../../features/jobs/hiring/my_job_listings/domain/use_cases/otp_usecase/get_my_job_listings_usecase.dart'
    as _i120;
import '../../features/jobs/hiring/my_job_listings/presentation/bloc/my_job_listings_bloc.dart'
    as _i133;
import '../../features/jobs/hiring/pending_profile/presentation/bloc/pending_profile_bloc.dart'
    as _i20;
import '../../features/jobs/hiring/service_category_candidates/presentation/bloc/service_category_candidates_bloc.dart'
    as _i76;
import '../../features/jobs/shared/data/repository_impl/get_candidates_repository_impl.dart'
    as _i54;
import '../../features/jobs/shared/data/repository_impl/get_industries_repository_impl.dart'
    as _i110;
import '../../features/jobs/shared/domain/repositories/get_industries_repository.dart'
    as _i109;
import '../../features/jobs/shared/domain/repositories/get_paginated_candidates_repository.dart'
    as _i53;
import '../../features/jobs/shared/domain/usecases/get_industries_usecase.dart'
    as _i111;
import '../../features/jobs/shared/domain/usecases/get_paginated_candidates_usecase.dart'
    as _i55;
import '../../features/landing/presentation/bloc/landing_bloc.dart' as _i18;
import '../../features/location/data/repository_impl/location_repository_impl/location_remote_submit_location_repository_impl.dart'
    as _i129;
import '../../features/location/domain/repository/location_repository/location_remote_submit_location_repository.dart'
    as _i128;
import '../../features/location/domain/use_cases/location_usecase/location_remote_submit_location_usecase.dart'
    as _i130;
import '../../features/location/presentation/bloc/location_bloc.dart' as _i150;
import '../../features/login/data/repository_impl/login_repository_impl/login_continue_clicked_repository_impl.dart'
    as _i61;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i10;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i13;
import '../../features/login/domain/entities/token/token_model.dart' as _i41;
import '../../features/login/domain/repository/login_repository/login_continue_clicked_repository.dart'
    as _i60;
import '../../features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart'
    as _i62;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i131;
import '../../features/membership_information/data/repository_impl/membership_information_repository_impl/get_membership_information_repository_impl.dart'
    as _i113;
import '../../features/membership_information/data/service/remote/membership_details_service.dart'
    as _i66;
import '../../features/membership_information/data/service/remote/membership_details_service_impl.dart'
    as _i67;
import '../../features/membership_information/domain/repository/membership_information_repository/get_membership_information_repository.dart'
    as _i112;
import '../../features/membership_information/domain/use_cases/membership_information_usecase/get_membership_information_usecase.dart'
    as _i114;
import '../../features/membership_information/presentation/bloc/membership_information_bloc.dart'
    as _i132;
import '../../features/minimum_wage/presentation/bloc/minimum_wage_bloc.dart'
    as _i19;
import '../../features/qualification/data/repository_impl/qualification_repository_impl/submit_remote_qualifications_and_experience_repository_impl.dart'
    as _i86;
import '../../features/qualification/domain/repository/qualification_repository/submit_remote_qualifications_and_experience_repository.dart'
    as _i85;
import '../../features/qualification/domain/use_cases/qualification_usecase/submit_remote_qualifications_and_experience_usecase.dart'
    as _i87;
import '../../features/qualification/presentation/bloc/qualification_bloc.dart'
    as _i137;
import '../../features/rate_and_work_times/data/repository_impl/rate_and_work_times_repository_impl/submit_remote_rate_and_work_times_repository_impl.dart'
    as _i89;
import '../../features/rate_and_work_times/domain/repository/rate_and_work_times_repository/submit_remote_rate_and_work_times_repository.dart'
    as _i88;
import '../../features/rate_and_work_times/domain/use_cases/rate_and_work_times_usecase/submit_remote_rate_and_work_times_usecase.dart'
    as _i90;
import '../../features/rate_and_work_times/presentation/bloc/rate_and_work_times_bloc.dart'
    as _i138;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i51;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i50;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i52;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i75;
import '../../features/register_account_step_1/presentation/bloc/register_account_step1_bloc.dart'
    as _i24;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_get_local_profile_repository_impl.dart'
    as _i30;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_remote_submit_profile_type__repository_impl.dart'
    as _i78;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart'
    as _i29;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_remote_submit_profile_type__repository.dart'
    as _i77;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart'
    as _i31;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_remote_submit_profile_type__usecase.dart'
    as _i79;
import '../../features/setup_profile/presentation/bloc/setup_profile_bloc.dart'
    as _i139;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i37;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i36;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i38;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i32;
import '../../features/terms_and_conditions/data/repository_impl/terms_and_conditions_repository_impl/get_remote_terms_and_conditions_repository_impl.dart'
    as _i125;
import '../../features/terms_and_conditions/data/repository_impl/terms_and_conditions_repository_impl/submit_remote_terms_and_conditions_acceptance_repository_impl.dart'
    as _i34;
import '../../features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service.dart'
    as _i91;
import '../../features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service_impl.dart'
    as _i92;
import '../../features/terms_and_conditions/domain/repository/terms_and_conditions_repository/get_remote_terms_and_conditions_repository.dart'
    as _i124;
import '../../features/terms_and_conditions/domain/repository/terms_and_conditions_repository/submit_remote_terms_and_conditions_acceptance_repository.dart'
    as _i33;
import '../../features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/get_remote_terms_and_conditions_usecase.dart'
    as _i126;
import '../../features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/submit_remote_terms_and_conditions_acceptance_usecase.dart'
    as _i35;
import '../../features/terms_and_conditions/presentation/bloc/terms_and_conditions_bloc.dart'
    as _i140;
import '../../features/you_are_all_setup/presentation/bloc/you_are_all_setup_bloc.dart'
    as _i43;
import '../../localization/generated/l10n.dart' as _i6;
import '../../navigation/app_route.dart' as _i7;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/get_remote_profile_repository_impl.dart'
    as _i122;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/login_otp_complete_event_repository_impl.dart'
    as _i64;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_token_repository_impl.dart'
    as _i69;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_save_remote_profile_data_repository_impl.dart'
    as _i135;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/register_otp_complete_repository_impl.dart'
    as _i26;
import '../../shared/features/otp/domain/repository/otp_repository/get_remote_profile_repository.dart'
    as _i121;
import '../../shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart'
    as _i63;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart'
    as _i68;
import '../../shared/features/otp/domain/repository/otp_repository/otp_save_remote_profile_data_repository.dart'
    as _i134;
import '../../shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart'
    as _i25;
import '../../shared/features/otp/domain/use_cases/otp_usecase/get_remote_profile_usecase.dart'
    as _i123;
import '../../shared/features/otp/domain/use_cases/otp_usecase/login_otp_complete_event_usecase.dart'
    as _i65;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart'
    as _i70;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_save_remote_profile_data_usecase.dart'
    as _i136;
import '../../shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart'
    as _i27;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i144;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i28;
import '../../shared/features/upload_file/data/repository_impl/upload_file_repository_impl.dart'
    as _i142;
import '../../shared/features/upload_file/domain/repository/upload_file_repository.dart'
    as _i141;
import '../../shared/features/upload_file/domain/usecases/upload_file_usecase.dart'
    as _i143;
import '../../shared/remote/api-service.dart' as _i44;
import '../../shared/remote/dio_api_service_impl.dart' as _i45;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i8;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i9;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage.dart'
    as _i11;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage_impl.dart'
    as _i12;
import '../../shared/services/local/Hive/profile_local_storage/profile/profile_model.dart'
    as _i23;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage.dart'
    as _i21;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage_impl.dart'
    as _i22;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage.dart'
    as _i39;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage_impl.dart'
    as _i40;
import '../../shared/services/local/Hive/user_local_storage/user/user_model.dart'
    as _i42;
import '../../shared/services/local/mock_data/candidates_service_mock/candidates_service_mock_impl.dart'
    as _i49;
import '../../shared/services/remote/api_service/candidates_service/candidates_service.dart'
    as _i48;
import '../../shared/services/remote/api_service/industries_service/industry_service.dart'
    as _i56;
import '../../shared/services/remote/api_service/industries_service/industry_service_impl.dart'
    as _i57;
import '../../shared/services/remote/api_service/industry_service/industry_service.dart'
    as _i58;
import '../../shared/services/remote/api_service/industry_service/industry_service_impl.dart'
    as _i59;
import '../../shared/services/remote/api_service/places_service/places_service.dart'
    as _i71;
import '../../shared/services/remote/api_service/places_service/places_service_impl.dart'
    as _i72;
import '../../shared/services/remote/api_service/profile_service/profile_service.dart'
    as _i73;
import '../../shared/services/remote/api_service/profile_service/profile_service_impl.dart'
    as _i74;
import '../../shared/services/remote/api_service/skills_service/skills_service.dart'
    as _i80;
import '../../shared/services/remote/api_service/skills_service/skills_service_impl.dart'
    as _i81;
import '../../shared/services/remote/api_service/upload_file_service/upload_file_service.dart'
    as _i93;
import '../../shared/services/remote/api_service/upload_file_service/upload_file_service_impl.dart'
    as _i94;
import '../../shared/services/remote/api_service/user_service/user_service.dart'
    as _i95;
import '../../shared/services/remote/api_service/user_service/user_service_impl.dart'
    as _i96;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i46;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i47;
import 'locator.dart' as _i151;

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
    gh.factory<_i19.MinimumWageBloc>(() => _i19.MinimumWageBloc());
    gh.factory<_i20.PendingProfileBloc>(() => _i20.PendingProfileBloc());
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
    gh.factory<_i24.RegisterAccountStep1Bloc>(
        () => _i24.RegisterAccountStep1Bloc());
    gh.factory<_i25.RegisterOTPCompleteRepository>(() =>
        _i26.RegisterOTPCompleteRepositoryImpl(
            profileLocalStorage: gh<_i21.ProfileLocalStorage>()));
    gh.factory<_i27.RegisterOTPCompleteUseCase>(() =>
        _i27.RegisterOTPCompleteUseCase(
            registerOTPCompleteEventRepository:
                gh<_i25.RegisterOTPCompleteRepository>()));
    gh.factory<_i28.ResendOTPBloc>(() => _i28.ResendOTPBloc());
    gh.factory<_i29.SetupProfileGetLocalProfileRepository>(() =>
        _i30.SetupProfileGetLocalProfileRepositoryImpl(
            profileLocalStorage: gh<_i21.ProfileLocalStorage>()));
    gh.factory<_i31.SetupProfileGetLocalProfileUseCase>(() =>
        _i31.SetupProfileGetLocalProfileUseCase(
            setupProfileGetLocalProfileRepository:
                gh<_i29.SetupProfileGetLocalProfileRepository>()));
    gh.factory<_i32.SignUpBloc>(() => _i32.SignUpBloc());
    gh.factory<_i33.SubmitRemoteTermsAndConditionsAcceptanceRepository>(
        () => _i34.SubmitRemoteTermsAndConditionsAcceptanceRepositoryImpl());
    gh.factory<_i35.SubmitRemoteTermsAndConditionsAcceptanceUseCase>(() =>
        _i35.SubmitRemoteTermsAndConditionsAcceptanceUseCase(
            submitRemoteTermsAndConditionsAcceptanceRepository:
                gh<_i33.SubmitRemoteTermsAndConditionsAcceptanceRepository>()));
    gh.factory<_i36.SubmitSignUpRepository>(
        () => _i37.SubmitSignUpRepositoryImpl());
    gh.factory<_i38.SubmitSignUpUseCase>(() => _i38.SubmitSignUpUseCase(
        submitSignUpRepository: gh<_i36.SubmitSignUpRepository>()));
    gh.factory<_i39.TokenLocalStorage>(() => _i40.TokenLocalStorageImpl());
    gh.factory<_i41.TokenModel>(() => _i41.TokenModel(
          refreshToken: gh<String>(),
          accessToken: gh<String>(),
          tokenID: gh<String>(),
        ));
    gh.factory<_i42.UserModel>(() => _i42.UserModel(id: gh<String>()));
    gh.factory<_i43.YouAreAllSetupBloc>(() => _i43.YouAreAllSetupBloc());
    gh.singleton<_i44.ApiService>(_i45.DioApiService(dio: gh<_i14.Dio>()));
    gh.singleton<_i46.Authentication>(
        _i47.PFirebaseAuthentication(firebaseAuth: gh<_i16.FirebaseAuth>()));
    gh.singleton<_i48.CandidatesService>(_i49.CandidatesServiceMock(
      apiService: gh<_i44.ApiService>(),
      tokenLocalStorage: gh<dynamic>(),
    ));
    gh.factory<_i50.ContinueClickedRepository>(() =>
        _i51.ContinueClickedRepositoryImpl(
            authentication: gh<_i46.Authentication>()));
    gh.factory<_i52.ContinueClickedUseCase>(() => _i52.ContinueClickedUseCase(
        continueClickedRepository: gh<_i50.ContinueClickedRepository>()));
    gh.factory<_i53.GetPaginatedCandidatesByIndustryRepository>(() =>
        _i54.GetPaginatedCandidatesByIndustryRepositoryImpl(
            candidatesService: gh<_i48.CandidatesService>()));
    gh.factory<_i55.GetPaginatedCandidatesByIndustryUseCase>(() =>
        _i55.GetPaginatedCandidatesByIndustryUseCase(
            getPaginatedCandidateProfilesRepository:
                gh<_i53.GetPaginatedCandidatesByIndustryRepository>()));
    gh.singleton<_i56.IndustryService>(
        _i57.IndustryServiceImpl(apiService: gh<_i44.ApiService>()));
    gh.singleton<_i58.IndustryService>(
        _i59.IndustryServiceImpl(apiService: gh<_i44.ApiService>()));
    gh.factory<_i60.LoginContinueClickedRepository>(() =>
        _i61.LoginContinueClickedRepositoryImpl(
            authentication: gh<_i46.Authentication>()));
    gh.factory<_i62.LoginContinueClickedUseCase>(() =>
        _i62.LoginContinueClickedUseCase(
            loginContinueClickedRepository:
                gh<_i60.LoginContinueClickedRepository>()));
    gh.factory<_i63.LoginOTPCompleteEventRepository>(() =>
        _i64.LoginOTPCompleteEventRepositoryImpl(
            profileLocalStorage: gh<_i21.ProfileLocalStorage>()));
    gh.factory<_i65.LoginOTPCompleteEventUseCase>(() =>
        _i65.LoginOTPCompleteEventUseCase(
            loginOTPCompleteEventRepository:
                gh<_i63.LoginOTPCompleteEventRepository>()));
    gh.singleton<_i66.MembershipDetailsService>(
        _i67.MembershipDetailsServiceImpl(apiService: gh<_i44.ApiService>()));
    gh.factory<_i68.OTPGetTokenRepository>(() => _i69.OTPGetTokenRepositoryImpl(
        authentication: gh<_i46.Authentication>()));
    gh.factory<_i70.OTPGetTokenUseCase>(() => _i70.OTPGetTokenUseCase(
        oTPGetTokenRepository: gh<_i68.OTPGetTokenRepository>()));
    gh.factory<_i71.PlacesService>(
        () => _i72.PlacesServiceImpl(apiService: gh<_i44.ApiService>()));
    gh.singleton<_i73.ProfileService>(
        _i74.ProfileServiceImpl(apiService: gh<_i44.ApiService>()));
    gh.factory<_i75.RegisterBloc>(() => _i75.RegisterBloc(
        continueClickedUseCase: gh<_i52.ContinueClickedUseCase>()));
    gh.factory<_i76.ServiceCategoryCandidatesBloc>(() =>
        _i76.ServiceCategoryCandidatesBloc(
            getPaginatedCandidatesByIndustryUseCase:
                gh<_i55.GetPaginatedCandidatesByIndustryUseCase>()));
    gh.factory<_i77.SetupProfileRemoteSubmitProfileTypeRepository>(() =>
        _i78.SetupProfileRemoteSubmitProfileTypeRepositoryImpl(
            profileService: gh<_i73.ProfileService>()));
    gh.factory<_i79.SetupProfileRemoteSubmitProfileTypeUseCase>(() =>
        _i79.SetupProfileRemoteSubmitProfileTypeUseCase(
            setupProfileRemoteSubmitProfileTypeRepository:
                gh<_i77.SetupProfileRemoteSubmitProfileTypeRepository>()));
    gh.singleton<_i80.SkillsService>(
        _i81.SkillsServiceImpl(apiService: gh<_i44.ApiService>()));
    gh.factory<_i82.SubmitFinalDetailsRepository>(() =>
        _i83.SubmitFinalDetailsRepositoryImpl(
            profileService: gh<_i73.ProfileService>()));
    gh.factory<_i84.SubmitFinalDetailsUseCase>(() =>
        _i84.SubmitFinalDetailsUseCase(
            submitFinalDetailsRepository:
                gh<_i82.SubmitFinalDetailsRepository>()));
    gh.factory<_i85.SubmitRemoteQualificationAndExperienceRepository>(() =>
        _i86.SubmitRemoteQualificationAndExperienceRepositoryImpl(
            profileService: gh<_i73.ProfileService>()));
    gh.factory<_i87.SubmitRemoteQualificationAndExperienceUseCase>(() =>
        _i87.SubmitRemoteQualificationAndExperienceUseCase(
            submitRemoteQualificationAndExperienceRepository:
                gh<_i85.SubmitRemoteQualificationAndExperienceRepository>()));
    gh.factory<_i88.SubmitRemoteRateAndWorkTimesRepository>(() =>
        _i89.SubmitRemoteRateAndWorkTimesRepositoryImpl(
            profileService: gh<_i73.ProfileService>()));
    gh.factory<_i90.SubmitRemoteRateAndWorkTimesUseCase>(() =>
        _i90.SubmitRemoteRateAndWorkTimesUseCase(
            submitRemoteRateAndWorkTimesRepository:
                gh<_i88.SubmitRemoteRateAndWorkTimesRepository>()));
    gh.factory<_i91.TermsAndConditionsService>(() =>
        _i92.TermsAndConditionsServiceImpl(apiService: gh<_i44.ApiService>()));
    gh.factory<_i93.UploadFileService>(
        () => _i94.UploadFileServiceImpl(apiService: gh<_i44.ApiService>()));
    gh.singleton<_i95.UserService>(
        _i96.UserServiceImpl(apiService: gh<_i44.ApiService>()));
    gh.factory<_i97.AddSkillsGetIndustryListRepository>(() =>
        _i98.AddSkillsGetIndustryListRepositoryImpl(
            industryService: gh<_i58.IndustryService>()));
    gh.factory<_i99.AddSkillsGetIndustryListUseCase>(() =>
        _i99.AddSkillsGetIndustryListUseCase(
            addSkillsGetIndustryListRepository:
                gh<_i97.AddSkillsGetIndustryListRepository>()));
    gh.factory<_i100.AddSkillsGetSkillsListRepository>(() =>
        _i101.AddSkillsGetSkillsListRepositoryImpl(
            skillsService: gh<_i80.SkillsService>()));
    gh.factory<_i102.AddSkillsGetSkillsListUseCase>(() =>
        _i102.AddSkillsGetSkillsListUseCase(
            addSkillsGetSkillsListRepository:
                gh<_i100.AddSkillsGetSkillsListRepository>()));
    gh.factory<_i103.AddSkillsSubmitRemoteSkillsAndIndustryRepository>(() =>
        _i104.AddSkillsSubmitRemoteSkillsAndIndustryRepositoryImpl(
            profileService: gh<_i73.ProfileService>()));
    gh.factory<_i105.AddSkillsSubmitRemoteSkillsAndIndustryUseCase>(() =>
        _i105.AddSkillsSubmitRemoteSkillsAndIndustryUseCase(
            addSkillsSubmitRemoteSkillsAndIndustryRepository:
                gh<_i103.AddSkillsSubmitRemoteSkillsAndIndustryRepository>()));
    gh.factory<_i106.BankDetailsSubmittedRepository>(() =>
        _i107.BankDetailsSubmittedRepositoryImpl(
            profileService: gh<_i73.ProfileService>()));
    gh.factory<_i108.BankDetailsSubmittedUseCase>(() =>
        _i108.BankDetailsSubmittedUseCase(
            bankDetailsSubmittedRepository:
                gh<_i106.BankDetailsSubmittedRepository>()));
    gh.factory<_i109.GetIndustriesRepository>(() =>
        _i110.GetIndustriesRepositoryImpl(
            industryService: gh<_i56.IndustryService>()));
    gh.factory<_i111.GetIndustriesUseCase>(() => _i111.GetIndustriesUseCase(
        getIndustriesRepository: gh<_i109.GetIndustriesRepository>()));
    gh.factory<_i112.GetMembershipInformationRepository>(() =>
        _i113.GetMembershipInformationRepositoryImpl(
            membershipDetailsService: gh<_i66.MembershipDetailsService>()));
    gh.factory<_i114.GetMembershipInformationUseCase>(() =>
        _i114.GetMembershipInformationUseCase(
            getMembershipInformationRepository:
                gh<_i112.GetMembershipInformationRepository>()));
    gh.factory<_i115.GetMyJobListingsRepository>(() =>
        _i116.GetMyJobListingsRepositoryImpl(
            industryService: gh<_i56.IndustryService>()));
    gh.factory<_i117.GetMyJobListingsRepository>(() =>
        _i118.GetMyJobListingsRepositoryImpl(
            industryService: gh<_i56.IndustryService>()));
    gh.factory<_i119.GetMyJobListingsUseCase>(() =>
        _i119.GetMyJobListingsUseCase(
            getIndustriesRepository: gh<_i115.GetMyJobListingsRepository>()));
    gh.factory<_i120.GetMyJobListingsUseCase>(() =>
        _i120.GetMyJobListingsUseCase(
            getIndustriesRepository: gh<_i117.GetMyJobListingsRepository>()));
    gh.factory<_i121.GetRemoteProfileRepository>(() =>
        _i122.GetRemoteProfileRepositoryImpl(
            profileService: gh<_i73.ProfileService>()));
    gh.factory<_i123.GetRemoteProfileUseCase>(() =>
        _i123.GetRemoteProfileUseCase(
            getRemoteProfileRepository:
                gh<_i121.GetRemoteProfileRepository>()));
    gh.factory<_i124.GetRemoteTermsAndConditionsRepository>(() =>
        _i125.GetRemoteTermsAndConditionsRepositoryImpl(
            termsAndConditionsService: gh<_i91.TermsAndConditionsService>()));
    gh.factory<_i126.GetRemoteTermsAndConditionsUseCase>(() =>
        _i126.GetRemoteTermsAndConditionsUseCase(
            getRemoteTermsAndConditionsRepository:
                gh<_i124.GetRemoteTermsAndConditionsRepository>()));
    gh.factory<_i127.JobsHiringLandingPageBloc>(
        () => _i127.JobsHiringLandingPageBloc(
              getIndustriesUseCase: gh<_i111.GetIndustriesUseCase>(),
              getPaginatedCandidatesByIndustryUseCase:
                  gh<_i55.GetPaginatedCandidatesByIndustryUseCase>(),
            ));
    gh.factory<_i128.LocationRemoteSubmitLocationRepository>(() =>
        _i129.LocationRemoteSubmitLocationRepositoryImpl(
            profileService: gh<_i73.ProfileService>()));
    gh.factory<_i130.LocationRemoteSubmitLocationUseCase>(() =>
        _i130.LocationRemoteSubmitLocationUseCase(
            locationRemoteSubmitLocationRepository:
                gh<_i128.LocationRemoteSubmitLocationRepository>()));
    gh.factory<_i131.LoginBloc>(() => _i131.LoginBloc(
        loginContinueClickedUsecase: gh<_i62.LoginContinueClickedUseCase>()));
    gh.factory<_i132.MembershipInformationBloc>(() =>
        _i132.MembershipInformationBloc(
            getMembershipInformationUseCase:
                gh<_i114.GetMembershipInformationUseCase>()));
    gh.factory<_i133.MyJobListingsBloc>(() => _i133.MyJobListingsBloc(
        getIndustriesUseCase: gh<_i120.GetMyJobListingsUseCase>()));
    gh.factory<_i134.OTPSaveRemoteProfileDataRepository>(() =>
        _i135.OTPSaveRemoteProfileDataRepositoryImpl(
            userService: gh<_i95.UserService>()));
    gh.factory<_i136.OTPSaveRemoteProfileDataUseCase>(() =>
        _i136.OTPSaveRemoteProfileDataUseCase(
            oTPSaveRemoteProfileDataRepository:
                gh<_i134.OTPSaveRemoteProfileDataRepository>()));
    gh.factory<_i137.QualificationsBloc>(() => _i137.QualificationsBloc(
        submitRemoteQualificationAndExperienceUseCase:
            gh<_i87.SubmitRemoteQualificationAndExperienceUseCase>()));
    gh.factory<_i138.RateAndWorkTimesBloc>(() => _i138.RateAndWorkTimesBloc(
        submitRemoteRateAndWorkTimesUseCase:
            gh<_i90.SubmitRemoteRateAndWorkTimesUseCase>()));
    gh.factory<_i139.SetupProfileBloc>(() => _i139.SetupProfileBloc(
          setupProfileRemoteSubmitProfileTypeUseCase:
              gh<_i79.SetupProfileRemoteSubmitProfileTypeUseCase>(),
          setupProfileGetLocalProfileUseCase:
              gh<_i31.SetupProfileGetLocalProfileUseCase>(),
        ));
    gh.factory<_i140.TermsAndConditionsBloc>(() => _i140.TermsAndConditionsBloc(
        getRemoteTermsAndConditionsUseCase:
            gh<_i126.GetRemoteTermsAndConditionsUseCase>()));
    gh.factory<_i141.UploadFileRepository>(() => _i142.UploadFileRepositoryImpl(
        uploadFileService: gh<_i93.UploadFileService>()));
    gh.factory<_i143.UploadFileUseCase>(() => _i143.UploadFileUseCase(
        uploadFileRepository: gh<_i141.UploadFileRepository>()));
    gh.factory<_i144.otpBloc>(() => _i144.otpBloc(
          getRemoteProfileUseCase: gh<_i123.GetRemoteProfileUseCase>(),
          registerOTPCompleteUseCase: gh<_i27.RegisterOTPCompleteUseCase>(),
          otpGetTokenUseCase: gh<_i70.OTPGetTokenUseCase>(),
          otpSaveRemoteProfileDataUseCase:
              gh<_i136.OTPSaveRemoteProfileDataUseCase>(),
        ));
    gh.factory<_i145.AddSkillsBloc>(() => _i145.AddSkillsBloc(
          addSkillsGetIndustryListUseCase:
              gh<_i99.AddSkillsGetIndustryListUseCase>(),
          addSkillsGetSkillsListUseCase:
              gh<_i102.AddSkillsGetSkillsListUseCase>(),
          addSkillsSubmitRemoteSkillsAndIndustryUseCase:
              gh<_i105.AddSkillsSubmitRemoteSkillsAndIndustryUseCase>(),
        ));
    gh.factory<_i146.AllServicesPageBloc>(() => _i146.AllServicesPageBloc(
          getIndustriesUseCase: gh<_i111.GetIndustriesUseCase>(),
          getPaginatedCandidatesByIndustryUseCase:
              gh<_i55.GetPaginatedCandidatesByIndustryUseCase>(),
        ));
    gh.factory<_i147.BankDetailsBloc>(() => _i147.BankDetailsBloc(
        bankDetailsSubmittedUseCase: gh<_i108.BankDetailsSubmittedUseCase>()));
    gh.factory<_i148.CreateJobListingBloc>(() => _i148.CreateJobListingBloc(
        getIndustriesUseCase: gh<_i119.GetMyJobListingsUseCase>()));
    gh.factory<_i149.FinalDetailsBloc>(() => _i149.FinalDetailsBloc(
          uploadFileUseCase: gh<_i143.UploadFileUseCase>(),
          submitFinalDetailsUseCase: gh<_i84.SubmitFinalDetailsUseCase>(),
        ));
    gh.factory<_i150.LocationBloc>(() => _i150.LocationBloc(
        locationRemoteSubmitLocationUseCase:
            gh<_i130.LocationRemoteSubmitLocationUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i151.RegisterModule {}
