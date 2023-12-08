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
import '../../features/add_skills/data/repository_impl/add_skills_repository_impl/add_skills_get_industry_list_repository_impl.dart'
    as _i88;
import '../../features/add_skills/data/repository_impl/add_skills_repository_impl/add_skills_get_skills_list_repository_impl.dart'
    as _i91;
import '../../features/add_skills/data/repository_impl/add_skills_repository_impl/add_skills_submit_remote_skills_and_industry_repository_impl.dart'
    as _i94;
import '../../features/add_skills/domain/repository/add_skills_repository/add_skills_get_industry_list_repository.dart'
    as _i87;
import '../../features/add_skills/domain/repository/add_skills_repository/add_skills_get_skills_list_repository.dart'
    as _i90;
import '../../features/add_skills/domain/repository/add_skills_repository/add_skills_submit_remote_skills_and_industry_repository.dart'
    as _i93;
import '../../features/add_skills/domain/use_cases/add_skills_usecase/add_skills_get_industry_list_usecase.dart'
    as _i89;
import '../../features/add_skills/domain/use_cases/add_skills_usecase/add_skills_get_skills_list_usecase.dart'
    as _i92;
import '../../features/add_skills/domain/use_cases/add_skills_usecase/add_skills_submit_remote_skills_and_industry_usecase.dart'
    as _i95;
import '../../features/add_skills/presentation/bloc/add_skills_bloc.dart'
    as _i124;
import '../../features/add_work_experience/presentation/bloc/add_work_experience_bloc.dart'
    as _i5;
import '../../features/bank_details/data/repository_impl/bank_details_submitted_repositoty_impl.dart'
    as _i97;
import '../../features/bank_details/domain/repository/bank_details_submitted_repository.dart'
    as _i96;
import '../../features/bank_details/domain/usecases/bank_details_submitted_usecase.dart'
    as _i98;
import '../../features/bank_details/presentation/bloc/bank_details_bloc.dart'
    as _i11;
import '../../features/final_details/data/repository_impl/submit_final_details_repository_impl.dart'
    as _i73;
import '../../features/final_details/domain/repository/submit_final_details_repository.dart'
    as _i72;
import '../../features/final_details/domain/usecases/submit_final_details_usecase.dart'
    as _i74;
import '../../features/final_details/presentation/bloc/final_details_bloc.dart'
    as _i125;
import '../../features/landing/presentation/bloc/landing_bloc.dart' as _i17;
import '../../features/location/data/repository_impl/location_repository_impl/location_remote_submit_location_repository_impl.dart'
    as _i109;
import '../../features/location/domain/repository/location_repository/location_remote_submit_location_repository.dart'
    as _i108;
import '../../features/location/domain/use_cases/location_usecase/location_remote_submit_location_usecase.dart'
    as _i110;
import '../../features/location/presentation/bloc/location_bloc.dart' as _i126;
import '../../features/login/data/repository_impl/login_repository_impl/login_continue_clicked_repository_impl.dart'
    as _i52;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i10;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i14;
import '../../features/login/domain/entities/token/token_model.dart' as _i39;
import '../../features/login/domain/repository/login_repository/login_continue_clicked_repository.dart'
    as _i51;
import '../../features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart'
    as _i53;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i111;
import '../../features/membership_information/data/repository_impl/membership_information_repository_impl/get_membership_information_repository_impl.dart'
    as _i100;
import '../../features/membership_information/data/service/remote/membership_details_service.dart'
    as _i57;
import '../../features/membership_information/data/service/remote/membership_details_service_impl.dart'
    as _i58;
import '../../features/membership_information/domain/repository/membership_information_repository/get_membership_information_repository.dart'
    as _i99;
import '../../features/membership_information/domain/use_cases/membership_information_usecase/get_membership_information_usecase.dart'
    as _i101;
import '../../features/membership_information/presentation/bloc/membership_information_bloc.dart'
    as _i112;
import '../../features/minimum_wage/presentation/bloc/minimum_wage_bloc.dart'
    as _i18;
import '../../features/qualification/data/repository_impl/qualification_repository_impl/submit_remote_qualifications_and_experience_repository_impl.dart'
    as _i76;
import '../../features/qualification/domain/repository/qualification_repository/submit_remote_qualifications_and_experience_repository.dart'
    as _i75;
import '../../features/qualification/domain/use_cases/qualification_usecase/submit_remote_qualifications_and_experience_usecase.dart'
    as _i77;
import '../../features/qualification/presentation/bloc/qualification_bloc.dart'
    as _i116;
import '../../features/rate_and_work_times/data/repository_impl/rate_and_work_times_repository_impl/submit_remote_rate_and_work_times_repository_impl.dart'
    as _i79;
import '../../features/rate_and_work_times/domain/repository/rate_and_work_times_repository/submit_remote_rate_and_work_times_repository.dart'
    as _i78;
import '../../features/rate_and_work_times/domain/use_cases/rate_and_work_times_usecase/submit_remote_rate_and_work_times_usecase.dart'
    as _i80;
import '../../features/rate_and_work_times/presentation/bloc/rate_and_work_times_bloc.dart'
    as _i117;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i47;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i46;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i48;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i66;
import '../../features/register_account_step_1/presentation/bloc/register_account_step1_bloc.dart'
    as _i22;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_get_local_profile_repository_impl.dart'
    as _i28;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_remote_submit_profile_type__repository_impl.dart'
    as _i68;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart'
    as _i27;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_remote_submit_profile_type__repository.dart'
    as _i67;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart'
    as _i29;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_remote_submit_profile_type__usecase.dart'
    as _i69;
import '../../features/setup_profile/presentation/bloc/setup_profile_bloc.dart'
    as _i118;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i35;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i34;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i36;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i30;
import '../../features/terms_and_conditions/data/repository_impl/terms_and_conditions_repository_impl/get_remote_terms_and_conditions_repository_impl.dart'
    as _i106;
import '../../features/terms_and_conditions/data/repository_impl/terms_and_conditions_repository_impl/submit_remote_terms_and_conditions_acceptance_repository_impl.dart'
    as _i32;
import '../../features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service.dart'
    as _i81;
import '../../features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service_impl.dart'
    as _i82;
import '../../features/terms_and_conditions/domain/repository/terms_and_conditions_repository/get_remote_terms_and_conditions_repository.dart'
    as _i105;
import '../../features/terms_and_conditions/domain/repository/terms_and_conditions_repository/submit_remote_terms_and_conditions_acceptance_repository.dart'
    as _i31;
import '../../features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/get_remote_terms_and_conditions_usecase.dart'
    as _i107;
import '../../features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/submit_remote_terms_and_conditions_acceptance_usecase.dart'
    as _i33;
import '../../features/terms_and_conditions/presentation/bloc/terms_and_conditions_bloc.dart'
    as _i119;
import '../../features/you_are_all_setup/presentation/bloc/you_are_all_setup_bloc.dart'
    as _i41;
import '../../localization/generated/l10n.dart' as _i6;
import '../../navigation/app_route.dart' as _i7;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/get_remote_profile_repository_impl.dart'
    as _i103;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/login_otp_complete_event_repository_impl.dart'
    as _i55;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_token_repository_impl.dart'
    as _i60;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_save_remote_profile_data_repository_impl.dart'
    as _i114;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/register_otp_complete_repository_impl.dart'
    as _i24;
import '../../shared/features/otp/domain/repository/otp_repository/get_remote_profile_repository.dart'
    as _i102;
import '../../shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart'
    as _i54;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart'
    as _i59;
import '../../shared/features/otp/domain/repository/otp_repository/otp_save_remote_profile_data_repository.dart'
    as _i113;
import '../../shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart'
    as _i23;
import '../../shared/features/otp/domain/use_cases/otp_usecase/get_remote_profile_usecase.dart'
    as _i104;
import '../../shared/features/otp/domain/use_cases/otp_usecase/login_otp_complete_event_usecase.dart'
    as _i56;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart'
    as _i61;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_save_remote_profile_data_usecase.dart'
    as _i115;
import '../../shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart'
    as _i25;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i123;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i26;
import '../../shared/features/upload_file/data/repository_impl/upload_file_repository_impl.dart'
    as _i121;
import '../../shared/features/upload_file/domain/repository/upload_file_repository.dart'
    as _i120;
import '../../shared/features/upload_file/domain/usecases/upload_file_usecase.dart'
    as _i122;
import '../../shared/remote/api-service.dart' as _i42;
import '../../shared/remote/dio_api_service_impl.dart' as _i43;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i8;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i9;
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
import '../../shared/services/local/Hive/user_local_storage/user/user_model.dart'
    as _i40;
import '../../shared/services/remote/api_service/industry_service/industry_service.dart'
    as _i49;
import '../../shared/services/remote/api_service/industry_service/industry_service_impl.dart'
    as _i50;
import '../../shared/services/remote/api_service/places_service/places_service.dart'
    as _i62;
import '../../shared/services/remote/api_service/places_service/places_service_impl.dart'
    as _i63;
import '../../shared/services/remote/api_service/profile_service/profile_service.dart'
    as _i64;
import '../../shared/services/remote/api_service/profile_service/profile_service_impl.dart'
    as _i65;
import '../../shared/services/remote/api_service/skills_service/skills_service.dart'
    as _i70;
import '../../shared/services/remote/api_service/skills_service/skills_service_impl.dart'
    as _i71;
import '../../shared/services/remote/api_service/upload_file_service/upload_file_service.dart'
    as _i83;
import '../../shared/services/remote/api_service/upload_file_service/upload_file_service_impl.dart'
    as _i84;
import '../../shared/services/remote/api_service/user_service/user_service.dart'
    as _i85;
import '../../shared/services/remote/api_service/user_service/user_service_impl.dart'
    as _i86;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i44;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i45;
import 'locator.dart' as _i127;

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
    gh.singleton<_i16.FirebaseAuth>(registerModule.firebaseAuth);
    gh.factory<_i17.LandingBloc>(() => _i17.LandingBloc());
    gh.factory<_i18.MinimumWageBloc>(() => _i18.MinimumWageBloc());
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
    gh.factory<_i22.RegisterAccountStep1Bloc>(
        () => _i22.RegisterAccountStep1Bloc());
    gh.factory<_i23.RegisterOTPCompleteRepository>(() =>
        _i24.RegisterOTPCompleteRepositoryImpl(
            profileLocalStorage: gh<_i19.ProfileLocalStorage>()));
    gh.factory<_i25.RegisterOTPCompleteUseCase>(() =>
        _i25.RegisterOTPCompleteUseCase(
            registerOTPCompleteEventRepository:
                gh<_i23.RegisterOTPCompleteRepository>()));
    gh.factory<_i26.ResendOTPBloc>(() => _i26.ResendOTPBloc());
    gh.factory<_i27.SetupProfileGetLocalProfileRepository>(() =>
        _i28.SetupProfileGetLocalProfileRepositoryImpl(
            profileLocalStorage: gh<_i19.ProfileLocalStorage>()));
    gh.factory<_i29.SetupProfileGetLocalProfileUseCase>(() =>
        _i29.SetupProfileGetLocalProfileUseCase(
            setupProfileGetLocalProfileRepository:
                gh<_i27.SetupProfileGetLocalProfileRepository>()));
    gh.factory<_i30.SignUpBloc>(() => _i30.SignUpBloc());
    gh.factory<_i31.SubmitRemoteTermsAndConditionsAcceptanceRepository>(
        () => _i32.SubmitRemoteTermsAndConditionsAcceptanceRepositoryImpl());
    gh.factory<_i33.SubmitRemoteTermsAndConditionsAcceptanceUseCase>(() =>
        _i33.SubmitRemoteTermsAndConditionsAcceptanceUseCase(
            submitRemoteTermsAndConditionsAcceptanceRepository:
                gh<_i31.SubmitRemoteTermsAndConditionsAcceptanceRepository>()));
    gh.factory<_i34.SubmitSignUpRepository>(
        () => _i35.SubmitSignUpRepositoryImpl());
    gh.factory<_i36.SubmitSignUpUseCase>(() => _i36.SubmitSignUpUseCase(
        submitSignUpRepository: gh<_i34.SubmitSignUpRepository>()));
    gh.factory<_i37.TokenLocalStorage>(() => _i38.TokenLocalStorageImpl());
    gh.factory<_i39.TokenModel>(() => _i39.TokenModel(
          refreshToken: gh<String>(),
          accessToken: gh<String>(),
          tokenID: gh<String>(),
        ));
    gh.factory<_i40.UserModel>(() => _i40.UserModel(id: gh<String>()));
    gh.factory<_i41.YouAreAllSetupBloc>(() => _i41.YouAreAllSetupBloc());
    gh.singleton<_i42.ApiService>(_i43.DioApiService(dio: gh<_i15.Dio>()));
    gh.singleton<_i44.Authentication>(
        _i45.PFirebaseAuthentication(firebaseAuth: gh<_i16.FirebaseAuth>()));
    gh.factory<_i46.ContinueClickedRepository>(() =>
        _i47.ContinueClickedRepositoryImpl(
            authentication: gh<_i44.Authentication>()));
    gh.factory<_i48.ContinueClickedUseCase>(() => _i48.ContinueClickedUseCase(
        continueClickedRepository: gh<_i46.ContinueClickedRepository>()));
    gh.singleton<_i49.IndustryService>(
        _i50.IndustryServiceImpl(apiService: gh<_i42.ApiService>()));
    gh.factory<_i51.LoginContinueClickedRepository>(() =>
        _i52.LoginContinueClickedRepositoryImpl(
            authentication: gh<_i44.Authentication>()));
    gh.factory<_i53.LoginContinueClickedUseCase>(() =>
        _i53.LoginContinueClickedUseCase(
            loginContinueClickedRepository:
                gh<_i51.LoginContinueClickedRepository>()));
    gh.factory<_i54.LoginOTPCompleteEventRepository>(() =>
        _i55.LoginOTPCompleteEventRepositoryImpl(
            profileLocalStorage: gh<_i19.ProfileLocalStorage>()));
    gh.factory<_i56.LoginOTPCompleteEventUseCase>(() =>
        _i56.LoginOTPCompleteEventUseCase(
            loginOTPCompleteEventRepository:
                gh<_i54.LoginOTPCompleteEventRepository>()));
    gh.singleton<_i57.MembershipDetailsService>(
        _i58.MembershipDetailsServiceImpl(apiService: gh<_i42.ApiService>()));
    gh.factory<_i59.OTPGetTokenRepository>(() => _i60.OTPGetTokenRepositoryImpl(
        authentication: gh<_i44.Authentication>()));
    gh.factory<_i61.OTPGetTokenUseCase>(() => _i61.OTPGetTokenUseCase(
        oTPGetTokenRepository: gh<_i59.OTPGetTokenRepository>()));
    gh.factory<_i62.PlacesService>(
        () => _i63.PlacesServiceImpl(apiService: gh<_i42.ApiService>()));
    gh.singleton<_i64.ProfileService>(_i65.ProfileServiceImpl(
      apiService: gh<_i42.ApiService>(),
      tokenLocalStorage: gh<dynamic>(),
    ));
    gh.factory<_i66.RegisterBloc>(() => _i66.RegisterBloc(
        continueClickedUseCase: gh<_i48.ContinueClickedUseCase>()));
    gh.factory<_i67.SetupProfileRemoteSubmitProfileTypeRepository>(() =>
        _i68.SetupProfileRemoteSubmitProfileTypeRepositoryImpl(
            profileService: gh<_i64.ProfileService>()));
    gh.factory<_i69.SetupProfileRemoteSubmitProfileTypeUseCase>(() =>
        _i69.SetupProfileRemoteSubmitProfileTypeUseCase(
            setupProfileRemoteSubmitProfileTypeRepository:
                gh<_i67.SetupProfileRemoteSubmitProfileTypeRepository>()));
    gh.singleton<_i70.SkillsService>(
        _i71.SkillsServiceImpl(apiService: gh<_i42.ApiService>()));
    gh.factory<_i72.SubmitFinalDetailsRepository>(() =>
        _i73.SubmitFinalDetailsRepositoryImpl(
            profileService: gh<_i64.ProfileService>()));
    gh.factory<_i74.SubmitFinalDetailsUseCase>(() =>
        _i74.SubmitFinalDetailsUseCase(
            submitFinalDetailsRepository:
                gh<_i72.SubmitFinalDetailsRepository>()));
    gh.factory<_i75.SubmitRemoteQualificationAndExperienceRepository>(() =>
        _i76.SubmitRemoteQualificationAndExperienceRepositoryImpl(
            profileService: gh<_i64.ProfileService>()));
    gh.factory<_i77.SubmitRemoteQualificationAndExperienceUseCase>(() =>
        _i77.SubmitRemoteQualificationAndExperienceUseCase(
            submitRemoteQualificationAndExperienceRepository:
                gh<_i75.SubmitRemoteQualificationAndExperienceRepository>()));
    gh.factory<_i78.SubmitRemoteRateAndWorkTimesRepository>(() =>
        _i79.SubmitRemoteRateAndWorkTimesRepositoryImpl(
            profileService: gh<_i64.ProfileService>()));
    gh.factory<_i80.SubmitRemoteRateAndWorkTimesUseCase>(() =>
        _i80.SubmitRemoteRateAndWorkTimesUseCase(
            submitRemoteRateAndWorkTimesRepository:
                gh<_i78.SubmitRemoteRateAndWorkTimesRepository>()));
    gh.factory<_i81.TermsAndConditionsService>(() =>
        _i82.TermsAndConditionsServiceImpl(apiService: gh<_i42.ApiService>()));
    gh.factory<_i83.UploadFileService>(
        () => _i84.UploadFileServiceImpl(apiService: gh<_i42.ApiService>()));
    gh.singleton<_i85.UserService>(
        _i86.UserServiceImpl(apiService: gh<_i42.ApiService>()));
    gh.factory<_i87.AddSkillsGetIndustryListRepository>(() =>
        _i88.AddSkillsGetIndustryListRepositoryImpl(
            industryService: gh<_i49.IndustryService>()));
    gh.factory<_i89.AddSkillsGetIndustryListUseCase>(() =>
        _i89.AddSkillsGetIndustryListUseCase(
            addSkillsGetIndustryListRepository:
                gh<_i87.AddSkillsGetIndustryListRepository>()));
    gh.factory<_i90.AddSkillsGetSkillsListRepository>(() =>
        _i91.AddSkillsGetSkillsListRepositoryImpl(
            skillsService: gh<_i70.SkillsService>()));
    gh.factory<_i92.AddSkillsGetSkillsListUseCase>(() =>
        _i92.AddSkillsGetSkillsListUseCase(
            addSkillsGetSkillsListRepository:
                gh<_i90.AddSkillsGetSkillsListRepository>()));
    gh.factory<_i93.AddSkillsSubmitRemoteSkillsAndIndustryRepository>(() =>
        _i94.AddSkillsSubmitRemoteSkillsAndIndustryRepositoryImpl(
            profileService: gh<_i64.ProfileService>()));
    gh.factory<_i95.AddSkillsSubmitRemoteSkillsAndIndustryUseCase>(() =>
        _i95.AddSkillsSubmitRemoteSkillsAndIndustryUseCase(
            addSkillsSubmitRemoteSkillsAndIndustryRepository:
                gh<_i93.AddSkillsSubmitRemoteSkillsAndIndustryRepository>()));
    gh.factory<_i96.BankDetailsSubmittedRepository>(() =>
        _i97.BankDetailsSubmittedRepositoryImpl(
            profileService: gh<_i64.ProfileService>()));
    gh.factory<_i98.BankDetailsSubmittedUseCase>(() =>
        _i98.BankDetailsSubmittedUseCase(
            bankDetailsSubmittedRepository:
                gh<_i96.BankDetailsSubmittedRepository>()));
    gh.factory<_i99.GetMembershipInformationRepository>(() =>
        _i100.GetMembershipInformationRepositoryImpl(
            membershipDetailsService: gh<_i57.MembershipDetailsService>()));
    gh.factory<_i101.GetMembershipInformationUseCase>(() =>
        _i101.GetMembershipInformationUseCase(
            getMembershipInformationRepository:
                gh<_i99.GetMembershipInformationRepository>()));
    gh.factory<_i102.GetRemoteProfileRepository>(() =>
        _i103.GetRemoteProfileRepositoryImpl(
            profileService: gh<_i64.ProfileService>()));
    gh.factory<_i104.GetRemoteProfileUseCase>(() =>
        _i104.GetRemoteProfileUseCase(
            getRemoteProfileRepository:
                gh<_i102.GetRemoteProfileRepository>()));
    gh.factory<_i105.GetRemoteTermsAndConditionsRepository>(() =>
        _i106.GetRemoteTermsAndConditionsRepositoryImpl(
            termsAndConditionsService: gh<_i81.TermsAndConditionsService>()));
    gh.factory<_i107.GetRemoteTermsAndConditionsUseCase>(() =>
        _i107.GetRemoteTermsAndConditionsUseCase(
            getRemoteTermsAndConditionsRepository:
                gh<_i105.GetRemoteTermsAndConditionsRepository>()));
    gh.factory<_i108.LocationRemoteSubmitLocationRepository>(() =>
        _i109.LocationRemoteSubmitLocationRepositoryImpl(
            profileService: gh<_i64.ProfileService>()));
    gh.factory<_i110.LocationRemoteSubmitLocationUseCase>(() =>
        _i110.LocationRemoteSubmitLocationUseCase(
            locationRemoteSubmitLocationRepository:
                gh<_i108.LocationRemoteSubmitLocationRepository>()));
    gh.factory<_i111.LoginBloc>(() => _i111.LoginBloc(
        loginContinueClickedUsecase: gh<_i53.LoginContinueClickedUseCase>()));
    gh.factory<_i112.MembershipInformationBloc>(() =>
        _i112.MembershipInformationBloc(
            getMembershipInformationUseCase:
                gh<_i101.GetMembershipInformationUseCase>()));
    gh.factory<_i113.OTPSaveRemoteProfileDataRepository>(() =>
        _i114.OTPSaveRemoteProfileDataRepositoryImpl(
            userService: gh<_i85.UserService>()));
    gh.factory<_i115.OTPSaveRemoteProfileDataUseCase>(() =>
        _i115.OTPSaveRemoteProfileDataUseCase(
            oTPSaveRemoteProfileDataRepository:
                gh<_i113.OTPSaveRemoteProfileDataRepository>()));
    gh.factory<_i116.QualificationsBloc>(() => _i116.QualificationsBloc(
        submitRemoteQualificationAndExperienceUseCase:
            gh<_i77.SubmitRemoteQualificationAndExperienceUseCase>()));
    gh.factory<_i117.RateAndWorkTimesBloc>(() => _i117.RateAndWorkTimesBloc(
        submitRemoteRateAndWorkTimesUseCase:
            gh<_i80.SubmitRemoteRateAndWorkTimesUseCase>()));
    gh.factory<_i118.SetupProfileBloc>(() => _i118.SetupProfileBloc(
          setupProfileRemoteSubmitProfileTypeUseCase:
              gh<_i69.SetupProfileRemoteSubmitProfileTypeUseCase>(),
          setupProfileGetLocalProfileUseCase:
              gh<_i29.SetupProfileGetLocalProfileUseCase>(),
        ));
    gh.factory<_i119.TermsAndConditionsBloc>(() => _i119.TermsAndConditionsBloc(
        getRemoteTermsAndConditionsUseCase:
            gh<_i107.GetRemoteTermsAndConditionsUseCase>()));
    gh.factory<_i120.UploadFileRepository>(() => _i121.UploadFileRepositoryImpl(
        uploadFileService: gh<_i83.UploadFileService>()));
    gh.factory<_i122.UploadFileUseCase>(() => _i122.UploadFileUseCase(
        uploadFileRepository: gh<_i120.UploadFileRepository>()));
    gh.factory<_i123.otpBloc>(() => _i123.otpBloc(
          getRemoteProfileUseCase: gh<_i104.GetRemoteProfileUseCase>(),
          registerOTPCompleteUseCase: gh<_i25.RegisterOTPCompleteUseCase>(),
          otpGetTokenUseCase: gh<_i61.OTPGetTokenUseCase>(),
          otpSaveRemoteProfileDataUseCase:
              gh<_i115.OTPSaveRemoteProfileDataUseCase>(),
        ));
    gh.factory<_i124.AddSkillsBloc>(() => _i124.AddSkillsBloc(
          addSkillsGetIndustryListUseCase:
              gh<_i89.AddSkillsGetIndustryListUseCase>(),
          addSkillsGetSkillsListUseCase:
              gh<_i92.AddSkillsGetSkillsListUseCase>(),
          addSkillsSubmitRemoteSkillsAndIndustryUseCase:
              gh<_i95.AddSkillsSubmitRemoteSkillsAndIndustryUseCase>(),
        ));
    gh.factory<_i125.FinalDetailsBloc>(() => _i125.FinalDetailsBloc(
          uploadFileUseCase: gh<_i122.UploadFileUseCase>(),
          submitFinalDetailsUseCase: gh<_i74.SubmitFinalDetailsUseCase>(),
        ));
    gh.factory<_i126.LocationBloc>(() => _i126.LocationBloc(
        locationRemoteSubmitLocationUseCase:
            gh<_i110.LocationRemoteSubmitLocationUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i127.RegisterModule {}
