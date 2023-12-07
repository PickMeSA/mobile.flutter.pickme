// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i15;
import 'package:firebase_auth/firebase_auth.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/add_memberships/presentation/bloc/add_memberships_bloc.dart'
    as _i3;
import '../../features/add_qualification/presentation/bloc/add_qualification_bloc.dart'
    as _i4;
import '../../features/add_skills/data/repository_impl/add_skills_repository_impl/add_skills_get_industry_list_repository_impl.dart'
    as _i84;
import '../../features/add_skills/data/repository_impl/add_skills_repository_impl/add_skills_get_skills_list_repository_impl.dart'
    as _i87;
import '../../features/add_skills/data/repository_impl/add_skills_repository_impl/add_skills_submit_remote_skills_and_industry_repository_impl.dart'
    as _i90;
import '../../features/add_skills/domain/repository/add_skills_repository/add_skills_get_industry_list_repository.dart'
    as _i83;
import '../../features/add_skills/domain/repository/add_skills_repository/add_skills_get_skills_list_repository.dart'
    as _i86;
import '../../features/add_skills/domain/repository/add_skills_repository/add_skills_submit_remote_skills_and_industry_repository.dart'
    as _i89;
import '../../features/add_skills/domain/use_cases/add_skills_usecase/add_skills_get_industry_list_usecase.dart'
    as _i85;
import '../../features/add_skills/domain/use_cases/add_skills_usecase/add_skills_get_skills_list_usecase.dart'
    as _i88;
import '../../features/add_skills/domain/use_cases/add_skills_usecase/add_skills_submit_remote_skills_and_industry_usecase.dart'
    as _i91;
import '../../features/add_skills/presentation/bloc/add_skills_bloc.dart'
    as _i114;
import '../../features/add_work_experience/presentation/bloc/add_work_experience_bloc.dart'
    as _i5;
import '../../features/bank_details/presentation/bloc/bank_details_bloc.dart'
    as _i11;
import '../../features/final_details/presentation/bloc/final_details_bloc.dart'
    as _i16;
import '../../features/landing/presentation/bloc/landing_bloc.dart' as _i18;
import '../../features/location/data/repository_impl/location_repository_impl/location_remote_submit_location_repository_impl.dart'
    as _i102;
import '../../features/location/domain/repository/location_repository/location_remote_submit_location_repository.dart'
    as _i101;
import '../../features/location/domain/use_cases/location_usecase/location_remote_submit_location_usecase.dart'
    as _i103;
import '../../features/location/presentation/bloc/location_bloc.dart' as _i115;
import '../../features/login/data/repository_impl/login_repository_impl/login_continue_clicked_repository_impl.dart'
    as _i53;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i10;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i14;
import '../../features/login/domain/entities/token/token_model.dart' as _i40;
import '../../features/login/domain/repository/login_repository/login_continue_clicked_repository.dart'
    as _i52;
import '../../features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart'
    as _i54;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i104;
import '../../features/membership_information/data/repository_impl/membership_information_repository_impl/get_membership_information_repository_impl.dart'
    as _i93;
import '../../features/membership_information/data/service/remote/membership_details_service.dart'
    as _i58;
import '../../features/membership_information/data/service/remote/membership_details_service_impl.dart'
    as _i59;
import '../../features/membership_information/domain/repository/membership_information_repository/get_membership_information_repository.dart'
    as _i92;
import '../../features/membership_information/domain/use_cases/membership_information_usecase/get_membership_information_usecase.dart'
    as _i94;
import '../../features/membership_information/presentation/bloc/membership_information_bloc.dart'
    as _i105;
import '../../features/minimum_wage/presentation/bloc/minimum_wage_bloc.dart'
    as _i19;
import '../../features/qualification/data/repository_impl/qualification_repository_impl/submit_remote_qualifications_and_experience_repository_impl.dart'
    as _i74;
import '../../features/qualification/domain/repository/qualification_repository/submit_remote_qualifications_and_experience_repository.dart'
    as _i73;
import '../../features/qualification/domain/use_cases/qualification_usecase/submit_remote_qualifications_and_experience_usecase.dart'
    as _i75;
import '../../features/qualification/presentation/bloc/qualification_bloc.dart'
    as _i109;
import '../../features/rate_and_work_times/data/repository_impl/rate_and_work_times_repository_impl/submit_remote_rate_and_work_times_repository_impl.dart'
    as _i77;
import '../../features/rate_and_work_times/domain/repository/rate_and_work_times_repository/submit_remote_rate_and_work_times_repository.dart'
    as _i76;
import '../../features/rate_and_work_times/domain/use_cases/rate_and_work_times_usecase/submit_remote_rate_and_work_times_usecase.dart'
    as _i78;
import '../../features/rate_and_work_times/presentation/bloc/rate_and_work_times_bloc.dart'
    as _i110;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i48;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i47;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i49;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i67;
import '../../features/register_account_step_1/presentation/bloc/register_account_step1_bloc.dart'
    as _i23;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_get_local_profile_repository_impl.dart'
    as _i29;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_remote_submit_profile_type__repository_impl.dart'
    as _i69;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart'
    as _i28;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_remote_submit_profile_type__repository.dart'
    as _i68;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart'
    as _i30;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_remote_submit_profile_type__usecase.dart'
    as _i70;
import '../../features/setup_profile/presentation/bloc/setup_profile_bloc.dart'
    as _i111;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i36;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i35;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i37;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i31;
import '../../features/terms_and_conditions/data/repository_impl/terms_and_conditions_repository_impl/get_remote_terms_and_conditions_repository_impl.dart'
    as _i99;
import '../../features/terms_and_conditions/data/repository_impl/terms_and_conditions_repository_impl/submit_remote_terms_and_conditions_acceptance_repository_impl.dart'
    as _i33;
import '../../features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service.dart'
    as _i79;
import '../../features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service_impl.dart'
    as _i80;
import '../../features/terms_and_conditions/domain/repository/terms_and_conditions_repository/get_remote_terms_and_conditions_repository.dart'
    as _i98;
import '../../features/terms_and_conditions/domain/repository/terms_and_conditions_repository/submit_remote_terms_and_conditions_acceptance_repository.dart'
    as _i32;
import '../../features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/get_remote_terms_and_conditions_usecase.dart'
    as _i100;
import '../../features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/submit_remote_terms_and_conditions_acceptance_usecase.dart'
    as _i34;
import '../../features/terms_and_conditions/presentation/bloc/terms_and_conditions_bloc.dart'
    as _i112;
import '../../features/you_are_all_setup/presentation/bloc/you_are_all_setup_bloc.dart'
    as _i42;
import '../../localization/generated/l10n.dart' as _i6;
import '../../navigation/app_route.dart' as _i7;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/get_remote_profile_repository_impl.dart'
    as _i96;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/login_otp_complete_event_repository_impl.dart'
    as _i56;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_token_repository_impl.dart'
    as _i61;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_save_remote_profile_data_repository_impl.dart'
    as _i107;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/register_otp_complete_repository_impl.dart'
    as _i25;
import '../../shared/features/otp/domain/repository/otp_repository/get_remote_profile_repository.dart'
    as _i95;
import '../../shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart'
    as _i55;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart'
    as _i60;
import '../../shared/features/otp/domain/repository/otp_repository/otp_save_remote_profile_data_repository.dart'
    as _i106;
import '../../shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart'
    as _i24;
import '../../shared/features/otp/domain/use_cases/otp_usecase/get_remote_profile_usecase.dart'
    as _i97;
import '../../shared/features/otp/domain/use_cases/otp_usecase/login_otp_complete_event_usecase.dart'
    as _i57;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart'
    as _i62;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_save_remote_profile_data_usecase.dart'
    as _i108;
import '../../shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart'
    as _i26;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i113;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i27;
import '../../shared/remote/api-service.dart' as _i43;
import '../../shared/remote/dio_api_service_impl.dart' as _i44;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i8;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i9;
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
    as _i38;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage_impl.dart'
    as _i39;
import '../../shared/services/local/Hive/user_local_storage/user/user_model.dart'
    as _i41;
import '../../shared/services/remote/api_service/industry_service/industry_service.dart'
    as _i50;
import '../../shared/services/remote/api_service/industry_service/industry_service_impl.dart'
    as _i51;
import '../../shared/services/remote/api_service/places_service/places_service.dart'
    as _i63;
import '../../shared/services/remote/api_service/places_service/places_service_impl.dart'
    as _i64;
import '../../shared/services/remote/api_service/profile_service/profile_service.dart'
    as _i65;
import '../../shared/services/remote/api_service/profile_service/profile_service_impl.dart'
    as _i66;
import '../../shared/services/remote/api_service/skills_service/skills_service.dart'
    as _i71;
import '../../shared/services/remote/api_service/skills_service/skills_service_impl.dart'
    as _i72;
import '../../shared/services/remote/api_service/user_service/user_service.dart'
    as _i81;
import '../../shared/services/remote/api_service/user_service/user_service_impl.dart'
    as _i82;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i45;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i46;
import 'locator.dart' as _i116;

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
    gh.factory<_i11.BankDetailsBloc>(() => _i11.BankDetailsBloc());
    gh.singleton<_i12.BiometricsLocalStorage>(
        _i13.BiometricsLocalStorageImpl());
    gh.factory<_i14.BiometricsModel>(
        () => _i14.BiometricsModel(biometrics: gh<bool>()));
    gh.factory<_i15.Dio>(() => registerModule.dio);
    gh.factory<_i16.FinalDetailsBloc>(() => _i16.FinalDetailsBloc());
    gh.singleton<_i17.FirebaseAuth>(registerModule.firebaseAuth);
    gh.factory<_i18.LandingBloc>(() => _i18.LandingBloc());
    gh.factory<_i19.MinimumWageBloc>(() => _i19.MinimumWageBloc());
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
    gh.factory<_i23.RegisterAccountStep1Bloc>(
        () => _i23.RegisterAccountStep1Bloc());
    gh.factory<_i24.RegisterOTPCompleteRepository>(() =>
        _i25.RegisterOTPCompleteRepositoryImpl(
            profileLocalStorage: gh<_i20.ProfileLocalStorage>()));
    gh.factory<_i26.RegisterOTPCompleteUseCase>(() =>
        _i26.RegisterOTPCompleteUseCase(
            registerOTPCompleteEventRepository:
                gh<_i24.RegisterOTPCompleteRepository>()));
    gh.factory<_i27.ResendOTPBloc>(() => _i27.ResendOTPBloc());
    gh.factory<_i28.SetupProfileGetLocalProfileRepository>(() =>
        _i29.SetupProfileGetLocalProfileRepositoryImpl(
            profileLocalStorage: gh<_i20.ProfileLocalStorage>()));
    gh.factory<_i30.SetupProfileGetLocalProfileUseCase>(() =>
        _i30.SetupProfileGetLocalProfileUseCase(
            setupProfileGetLocalProfileRepository:
                gh<_i28.SetupProfileGetLocalProfileRepository>()));
    gh.factory<_i31.SignUpBloc>(() => _i31.SignUpBloc());
    gh.factory<_i32.SubmitRemoteTermsAndConditionsAcceptanceRepository>(
        () => _i33.SubmitRemoteTermsAndConditionsAcceptanceRepositoryImpl());
    gh.factory<_i34.SubmitRemoteTermsAndConditionsAcceptanceUseCase>(() =>
        _i34.SubmitRemoteTermsAndConditionsAcceptanceUseCase(
            submitRemoteTermsAndConditionsAcceptanceRepository:
                gh<_i32.SubmitRemoteTermsAndConditionsAcceptanceRepository>()));
    gh.factory<_i35.SubmitSignUpRepository>(
        () => _i36.SubmitSignUpRepositoryImpl());
    gh.factory<_i37.SubmitSignUpUseCase>(() => _i37.SubmitSignUpUseCase(
        submitSignUpRepository: gh<_i35.SubmitSignUpRepository>()));
    gh.factory<_i38.TokenLocalStorage>(() => _i39.TokenLocalStorageImpl());
    gh.factory<_i40.TokenModel>(() => _i40.TokenModel(
          refreshToken: gh<String>(),
          accessToken: gh<String>(),
          tokenID: gh<String>(),
        ));
    gh.factory<_i41.UserModel>(() => _i41.UserModel(id: gh<String>()));
    gh.factory<_i42.YouAreAllSetupBloc>(() => _i42.YouAreAllSetupBloc());
    gh.singleton<_i43.ApiService>(_i44.DioApiService(dio: gh<_i15.Dio>()));
    gh.singleton<_i45.Authentication>(
        _i46.PFirebaseAuthentication(firebaseAuth: gh<_i17.FirebaseAuth>()));
    gh.factory<_i47.ContinueClickedRepository>(() =>
        _i48.ContinueClickedRepositoryImpl(
            authentication: gh<_i45.Authentication>()));
    gh.factory<_i49.ContinueClickedUseCase>(() => _i49.ContinueClickedUseCase(
        continueClickedRepository: gh<_i47.ContinueClickedRepository>()));
    gh.singleton<_i50.IndustryService>(
        _i51.IndustryServiceImpl(apiService: gh<_i43.ApiService>()));
    gh.factory<_i52.LoginContinueClickedRepository>(() =>
        _i53.LoginContinueClickedRepositoryImpl(
            authentication: gh<_i45.Authentication>()));
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
    gh.singleton<_i58.MembershipDetailsService>(
        _i59.MembershipDetailsServiceImpl(apiService: gh<_i43.ApiService>()));
    gh.factory<_i60.OTPGetTokenRepository>(() => _i61.OTPGetTokenRepositoryImpl(
        authentication: gh<_i45.Authentication>()));
    gh.factory<_i62.OTPGetTokenUseCase>(() => _i62.OTPGetTokenUseCase(
        oTPGetTokenRepository: gh<_i60.OTPGetTokenRepository>()));
    gh.factory<_i63.PlacesService>(
        () => _i64.PlacesServiceImpl(apiService: gh<_i43.ApiService>()));
    gh.singleton<_i65.ProfileService>(
        _i66.ProfileServiceImpl(apiService: gh<_i43.ApiService>()));
    gh.factory<_i67.RegisterBloc>(() => _i67.RegisterBloc(
        continueClickedUseCase: gh<_i49.ContinueClickedUseCase>()));
    gh.factory<_i68.SetupProfileRemoteSubmitProfileTypeRepository>(() =>
        _i69.SetupProfileRemoteSubmitProfileTypeRepositoryImpl(
            profileService: gh<_i65.ProfileService>()));
    gh.factory<_i70.SetupProfileRemoteSubmitProfileTypeUseCase>(() =>
        _i70.SetupProfileRemoteSubmitProfileTypeUseCase(
            setupProfileRemoteSubmitProfileTypeRepository:
                gh<_i68.SetupProfileRemoteSubmitProfileTypeRepository>()));
    gh.singleton<_i71.SkillsService>(
        _i72.SkillsServiceImpl(apiService: gh<_i43.ApiService>()));
    gh.factory<_i73.SubmitRemoteQualificationAndExperienceRepository>(() =>
        _i74.SubmitRemoteQualificationAndExperienceRepositoryImpl(
            profileService: gh<_i65.ProfileService>()));
    gh.factory<_i75.SubmitRemoteQualificationAndExperienceUseCase>(() =>
        _i75.SubmitRemoteQualificationAndExperienceUseCase(
            submitRemoteQualificationAndExperienceRepository:
                gh<_i73.SubmitRemoteQualificationAndExperienceRepository>()));
    gh.factory<_i76.SubmitRemoteRateAndWorkTimesRepository>(() =>
        _i77.SubmitRemoteRateAndWorkTimesRepositoryImpl(
            profileService: gh<_i65.ProfileService>()));
    gh.factory<_i78.SubmitRemoteRateAndWorkTimesUseCase>(() =>
        _i78.SubmitRemoteRateAndWorkTimesUseCase(
            submitRemoteRateAndWorkTimesRepository:
                gh<_i76.SubmitRemoteRateAndWorkTimesRepository>()));
    gh.factory<_i79.TermsAndConditionsService>(() =>
        _i80.TermsAndConditionsServiceImpl(apiService: gh<_i43.ApiService>()));
    gh.singleton<_i81.UserService>(
        _i82.UserServiceImpl(apiService: gh<_i43.ApiService>()));
    gh.factory<_i83.AddSkillsGetIndustryListRepository>(() =>
        _i84.AddSkillsGetIndustryListRepositoryImpl(
            industryService: gh<_i50.IndustryService>()));
    gh.factory<_i85.AddSkillsGetIndustryListUseCase>(() =>
        _i85.AddSkillsGetIndustryListUseCase(
            addSkillsGetIndustryListRepository:
                gh<_i83.AddSkillsGetIndustryListRepository>()));
    gh.factory<_i86.AddSkillsGetSkillsListRepository>(() =>
        _i87.AddSkillsGetSkillsListRepositoryImpl(
            skillsService: gh<_i71.SkillsService>()));
    gh.factory<_i88.AddSkillsGetSkillsListUseCase>(() =>
        _i88.AddSkillsGetSkillsListUseCase(
            addSkillsGetSkillsListRepository:
                gh<_i86.AddSkillsGetSkillsListRepository>()));
    gh.factory<_i89.AddSkillsSubmitRemoteSkillsAndIndustryRepository>(() =>
        _i90.AddSkillsSubmitRemoteSkillsAndIndustryRepositoryImpl(
            profileService: gh<_i65.ProfileService>()));
    gh.factory<_i91.AddSkillsSubmitRemoteSkillsAndIndustryUseCase>(() =>
        _i91.AddSkillsSubmitRemoteSkillsAndIndustryUseCase(
            addSkillsSubmitRemoteSkillsAndIndustryRepository:
                gh<_i89.AddSkillsSubmitRemoteSkillsAndIndustryRepository>()));
    gh.factory<_i92.GetMembershipInformationRepository>(() =>
        _i93.GetMembershipInformationRepositoryImpl(
            membershipDetailsService: gh<_i58.MembershipDetailsService>()));
    gh.factory<_i94.GetMembershipInformationUseCase>(() =>
        _i94.GetMembershipInformationUseCase(
            getMembershipInformationRepository:
                gh<_i92.GetMembershipInformationRepository>()));
    gh.factory<_i95.GetRemoteProfileRepository>(() =>
        _i96.GetRemoteProfileRepositoryImpl(
            profileService: gh<_i65.ProfileService>()));
    gh.factory<_i97.GetRemoteProfileUseCase>(() => _i97.GetRemoteProfileUseCase(
        getRemoteProfileRepository: gh<_i95.GetRemoteProfileRepository>()));
    gh.factory<_i98.GetRemoteTermsAndConditionsRepository>(() =>
        _i99.GetRemoteTermsAndConditionsRepositoryImpl(
            termsAndConditionsService: gh<_i79.TermsAndConditionsService>()));
    gh.factory<_i100.GetRemoteTermsAndConditionsUseCase>(() =>
        _i100.GetRemoteTermsAndConditionsUseCase(
            getRemoteTermsAndConditionsRepository:
                gh<_i98.GetRemoteTermsAndConditionsRepository>()));
    gh.factory<_i101.LocationRemoteSubmitLocationRepository>(() =>
        _i102.LocationRemoteSubmitLocationRepositoryImpl(
            profileService: gh<_i65.ProfileService>()));
    gh.factory<_i103.LocationRemoteSubmitLocationUseCase>(() =>
        _i103.LocationRemoteSubmitLocationUseCase(
            locationRemoteSubmitLocationRepository:
                gh<_i101.LocationRemoteSubmitLocationRepository>()));
    gh.factory<_i104.LoginBloc>(() => _i104.LoginBloc(
        loginContinueClickedUsecase: gh<_i54.LoginContinueClickedUseCase>()));
    gh.factory<_i105.MembershipInformationBloc>(() =>
        _i105.MembershipInformationBloc(
            getMembershipInformationUseCase:
                gh<_i94.GetMembershipInformationUseCase>()));
    gh.factory<_i106.OTPSaveRemoteProfileDataRepository>(() =>
        _i107.OTPSaveRemoteProfileDataRepositoryImpl(
            userService: gh<_i81.UserService>()));
    gh.factory<_i108.OTPSaveRemoteProfileDataUseCase>(() =>
        _i108.OTPSaveRemoteProfileDataUseCase(
            oTPSaveRemoteProfileDataRepository:
                gh<_i106.OTPSaveRemoteProfileDataRepository>()));
    gh.factory<_i109.QualificationsBloc>(() => _i109.QualificationsBloc(
        submitRemoteQualificationAndExperienceUseCase:
            gh<_i75.SubmitRemoteQualificationAndExperienceUseCase>()));
    gh.factory<_i110.RateAndWorkTimesBloc>(() => _i110.RateAndWorkTimesBloc(
        submitRemoteRateAndWorkTimesUseCase:
            gh<_i78.SubmitRemoteRateAndWorkTimesUseCase>()));
    gh.factory<_i111.SetupProfileBloc>(() => _i111.SetupProfileBloc(
          setupProfileRemoteSubmitProfileTypeUseCase:
              gh<_i70.SetupProfileRemoteSubmitProfileTypeUseCase>(),
          setupProfileGetLocalProfileUseCase:
              gh<_i30.SetupProfileGetLocalProfileUseCase>(),
        ));
    gh.factory<_i112.TermsAndConditionsBloc>(() => _i112.TermsAndConditionsBloc(
        getRemoteTermsAndConditionsUseCase:
            gh<_i100.GetRemoteTermsAndConditionsUseCase>()));
    gh.factory<_i113.otpBloc>(() => _i113.otpBloc(
          getRemoteProfileUseCase: gh<_i97.GetRemoteProfileUseCase>(),
          registerOTPCompleteUseCase: gh<_i26.RegisterOTPCompleteUseCase>(),
          otpGetTokenUseCase: gh<_i62.OTPGetTokenUseCase>(),
          otpSaveRemoteProfileDataUseCase:
              gh<_i108.OTPSaveRemoteProfileDataUseCase>(),
        ));
    gh.factory<_i114.AddSkillsBloc>(() => _i114.AddSkillsBloc(
          addSkillsGetIndustryListUseCase:
              gh<_i85.AddSkillsGetIndustryListUseCase>(),
          addSkillsGetSkillsListUseCase:
              gh<_i88.AddSkillsGetSkillsListUseCase>(),
          addSkillsSubmitRemoteSkillsAndIndustryUseCase:
              gh<_i91.AddSkillsSubmitRemoteSkillsAndIndustryUseCase>(),
        ));
    gh.factory<_i115.LocationBloc>(() => _i115.LocationBloc(
        locationRemoteSubmitLocationUseCase:
            gh<_i103.LocationRemoteSubmitLocationUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i116.RegisterModule {}
