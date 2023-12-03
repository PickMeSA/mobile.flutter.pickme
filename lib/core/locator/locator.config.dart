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
    as _i83;
import '../../features/add_skills/data/repository_impl/add_skills_repository_impl/add_skills_get_skills_list_repository_impl.dart'
    as _i86;
import '../../features/add_skills/data/repository_impl/add_skills_repository_impl/add_skills_submit_remote_skills_and_industry_repository_impl.dart'
    as _i89;
import '../../features/add_skills/domain/repository/add_skills_repository/add_skills_get_industry_list_repository.dart'
    as _i82;
import '../../features/add_skills/domain/repository/add_skills_repository/add_skills_get_skills_list_repository.dart'
    as _i85;
import '../../features/add_skills/domain/repository/add_skills_repository/add_skills_submit_remote_skills_and_industry_repository.dart'
    as _i88;
import '../../features/add_skills/domain/use_cases/add_skills_usecase/add_skills_get_industry_list_usecase.dart'
    as _i84;
import '../../features/add_skills/domain/use_cases/add_skills_usecase/add_skills_get_skills_list_usecase.dart'
    as _i87;
import '../../features/add_skills/domain/use_cases/add_skills_usecase/add_skills_submit_remote_skills_and_industry_usecase.dart'
    as _i90;
import '../../features/add_skills/presentation/bloc/add_skills_bloc.dart'
    as _i110;
import '../../features/add_work_experience/presentation/bloc/add_work_experience_bloc.dart'
    as _i5;
import '../../features/bank_details/presentation/bloc/bank_details_bloc.dart'
    as _i11;
import '../../features/final_details/presentation/bloc/final_details_bloc.dart'
    as _i16;
import '../../features/landing/presentation/bloc/landing_bloc.dart' as _i18;
import '../../features/location/presentation/bloc/location_bloc.dart' as _i19;
import '../../features/login/data/repository_impl/login_repository_impl/login_continue_clicked_repository_impl.dart'
    as _i54;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i10;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i14;
import '../../features/login/domain/entities/token/token_model.dart' as _i41;
import '../../features/login/domain/repository/login_repository/login_continue_clicked_repository.dart'
    as _i53;
import '../../features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart'
    as _i55;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i100;
import '../../features/membership_information/data/repository_impl/membership_information_repository_impl/get_membership_information_repository_impl.dart'
    as _i92;
import '../../features/membership_information/data/service/remote/membership_details_service.dart'
    as _i59;
import '../../features/membership_information/data/service/remote/membership_details_service_impl.dart'
    as _i60;
import '../../features/membership_information/domain/repository/membership_information_repository/get_membership_information_repository.dart'
    as _i91;
import '../../features/membership_information/domain/use_cases/membership_information_usecase/get_membership_information_usecase.dart'
    as _i93;
import '../../features/membership_information/presentation/bloc/membership_information_bloc.dart'
    as _i101;
import '../../features/minimum_wage/presentation/bloc/minimum_wage_bloc.dart'
    as _i20;
import '../../features/qualification/data/repository_impl/qualification_repository_impl/submit_remote_qualifications_and_experience_repository_impl.dart'
    as _i73;
import '../../features/qualification/domain/repository/qualification_repository/submit_remote_qualifications_and_experience_repository.dart'
    as _i72;
import '../../features/qualification/domain/use_cases/qualification_usecase/submit_remote_qualifications_and_experience_usecase.dart'
    as _i74;
import '../../features/qualification/presentation/bloc/qualification_bloc.dart'
    as _i105;
import '../../features/rate_and_work_times/data/repository_impl/rate_and_work_times_repository_impl/submit_remote_rate_and_work_times_repository_impl.dart'
    as _i76;
import '../../features/rate_and_work_times/domain/repository/rate_and_work_times_repository/submit_remote_rate_and_work_times_repository.dart'
    as _i75;
import '../../features/rate_and_work_times/domain/use_cases/rate_and_work_times_usecase/submit_remote_rate_and_work_times_usecase.dart'
    as _i77;
import '../../features/rate_and_work_times/presentation/bloc/rate_and_work_times_bloc.dart'
    as _i106;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i49;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i48;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i50;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i66;
import '../../features/register_account_step_1/presentation/bloc/register_account_step1_bloc.dart'
    as _i24;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_get_local_profile_repository_impl.dart'
    as _i30;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_remote_submit_profile_type__repository_impl.dart'
    as _i68;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart'
    as _i29;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_remote_submit_profile_type__repository.dart'
    as _i67;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart'
    as _i31;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_remote_submit_profile_type__usecase.dart'
    as _i69;
import '../../features/setup_profile/presentation/bloc/setup_profile_bloc.dart'
    as _i107;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i37;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i36;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i38;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i32;
import '../../features/terms_and_conditions/data/repository_impl/terms_and_conditions_repository_impl/get_remote_terms_and_conditions_repository_impl.dart'
    as _i98;
import '../../features/terms_and_conditions/data/repository_impl/terms_and_conditions_repository_impl/submit_remote_terms_and_conditions_acceptance_repository_impl.dart'
    as _i34;
import '../../features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service.dart'
    as _i78;
import '../../features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service_impl.dart'
    as _i79;
import '../../features/terms_and_conditions/domain/repository/terms_and_conditions_repository/get_remote_terms_and_conditions_repository.dart'
    as _i97;
import '../../features/terms_and_conditions/domain/repository/terms_and_conditions_repository/submit_remote_terms_and_conditions_acceptance_repository.dart'
    as _i33;
import '../../features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/get_remote_terms_and_conditions_usecase.dart'
    as _i99;
import '../../features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/submit_remote_terms_and_conditions_acceptance_usecase.dart'
    as _i35;
import '../../features/terms_and_conditions/presentation/bloc/terms_and_conditions_bloc.dart'
    as _i108;
import '../../features/you_are_all_setup/presentation/bloc/you_are_all_setup_bloc.dart'
    as _i43;
import '../../localization/generated/l10n.dart' as _i6;
import '../../navigation/app_route.dart' as _i7;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/get_remote_profile_repository_impl.dart'
    as _i95;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/login_otp_complete_event_repository_impl.dart'
    as _i57;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_token_repository_impl.dart'
    as _i62;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_save_remote_profile_data_repository_impl.dart'
    as _i103;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/register_otp_complete_repository_impl.dart'
    as _i26;
import '../../shared/features/otp/domain/repository/otp_repository/get_remote_profile_repository.dart'
    as _i94;
import '../../shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart'
    as _i56;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart'
    as _i61;
import '../../shared/features/otp/domain/repository/otp_repository/otp_save_remote_profile_data_repository.dart'
    as _i102;
import '../../shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart'
    as _i25;
import '../../shared/features/otp/domain/use_cases/otp_usecase/get_remote_profile_usecase.dart'
    as _i96;
import '../../shared/features/otp/domain/use_cases/otp_usecase/login_otp_complete_event_usecase.dart'
    as _i58;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart'
    as _i63;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_save_remote_profile_data_usecase.dart'
    as _i104;
import '../../shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart'
    as _i27;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i109;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i28;
import '../../shared/remote/api-service.dart' as _i44;
import '../../shared/remote/dio_api_service_impl.dart' as _i45;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i8;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i9;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage.dart'
    as _i12;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage_impl.dart'
    as _i13;
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
import '../../shared/services/remote/api_service/industry_service/industry_service.dart'
    as _i51;
import '../../shared/services/remote/api_service/industry_service/industry_service_impl.dart'
    as _i52;
import '../../shared/services/remote/api_service/profile_service/profile_service.dart'
    as _i64;
import '../../shared/services/remote/api_service/profile_service/profile_service_impl.dart'
    as _i65;
import '../../shared/services/remote/api_service/skills_service/skills_service.dart'
    as _i70;
import '../../shared/services/remote/api_service/skills_service/skills_service_impl.dart'
    as _i71;
import '../../shared/services/remote/api_service/user_service/user_service.dart'
    as _i80;
import '../../shared/services/remote/api_service/user_service/user_service_impl.dart'
    as _i81;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i46;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i47;
import 'locator.dart' as _i111;

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
    gh.factory<_i19.LocationBloc>(() => _i19.LocationBloc());
    gh.factory<_i20.MinimumWageBloc>(() => _i20.MinimumWageBloc());
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
    gh.singleton<_i44.ApiService>(_i45.DioApiService(dio: gh<_i15.Dio>()));
    gh.singleton<_i46.Authentication>(
        _i47.PFirebaseAuthentication(firebaseAuth: gh<_i17.FirebaseAuth>()));
    gh.factory<_i48.ContinueClickedRepository>(() =>
        _i49.ContinueClickedRepositoryImpl(
            authentication: gh<_i46.Authentication>()));
    gh.factory<_i50.ContinueClickedUseCase>(() => _i50.ContinueClickedUseCase(
        continueClickedRepository: gh<_i48.ContinueClickedRepository>()));
    gh.singleton<_i51.IndustryService>(
        _i52.IndustryServiceImpl(apiService: gh<_i44.ApiService>()));
    gh.factory<_i53.LoginContinueClickedRepository>(() =>
        _i54.LoginContinueClickedRepositoryImpl(
            authentication: gh<_i46.Authentication>()));
    gh.factory<_i55.LoginContinueClickedUseCase>(() =>
        _i55.LoginContinueClickedUseCase(
            loginContinueClickedRepository:
                gh<_i53.LoginContinueClickedRepository>()));
    gh.factory<_i56.LoginOTPCompleteEventRepository>(() =>
        _i57.LoginOTPCompleteEventRepositoryImpl(
            profileLocalStorage: gh<_i21.ProfileLocalStorage>()));
    gh.factory<_i58.LoginOTPCompleteEventUseCase>(() =>
        _i58.LoginOTPCompleteEventUseCase(
            loginOTPCompleteEventRepository:
                gh<_i56.LoginOTPCompleteEventRepository>()));
    gh.singleton<_i59.MembershipDetailsService>(
        _i60.MembershipDetailsServiceImpl(apiService: gh<_i44.ApiService>()));
    gh.factory<_i61.OTPGetTokenRepository>(() => _i62.OTPGetTokenRepositoryImpl(
        authentication: gh<_i46.Authentication>()));
    gh.factory<_i63.OTPGetTokenUseCase>(() => _i63.OTPGetTokenUseCase(
        oTPGetTokenRepository: gh<_i61.OTPGetTokenRepository>()));
    gh.singleton<_i64.ProfileService>(
        _i65.ProfileServiceImpl(apiService: gh<_i44.ApiService>()));
    gh.factory<_i66.RegisterBloc>(() => _i66.RegisterBloc(
        continueClickedUseCase: gh<_i50.ContinueClickedUseCase>()));
    gh.factory<_i67.SetupProfileRemoteSubmitProfileTypeRepository>(() =>
        _i68.SetupProfileRemoteSubmitProfileTypeRepositoryImpl(
            profileService: gh<_i64.ProfileService>()));
    gh.factory<_i69.SetupProfileRemoteSubmitProfileTypeUseCase>(() =>
        _i69.SetupProfileRemoteSubmitProfileTypeUseCase(
            setupProfileRemoteSubmitProfileTypeRepository:
                gh<_i67.SetupProfileRemoteSubmitProfileTypeRepository>()));
    gh.singleton<_i70.SkillsService>(
        _i71.SkillsServiceImpl(apiService: gh<_i44.ApiService>()));
    gh.factory<_i72.SubmitRemoteQualificationAndExperienceRepository>(() =>
        _i73.SubmitRemoteQualificationAndExperienceRepositoryImpl(
            profileService: gh<_i64.ProfileService>()));
    gh.factory<_i74.SubmitRemoteQualificationAndExperienceUseCase>(() =>
        _i74.SubmitRemoteQualificationAndExperienceUseCase(
            submitRemoteQualificationAndExperienceRepository:
                gh<_i72.SubmitRemoteQualificationAndExperienceRepository>()));
    gh.factory<_i75.SubmitRemoteRateAndWorkTimesRepository>(() =>
        _i76.SubmitRemoteRateAndWorkTimesRepositoryImpl(
            profileService: gh<_i64.ProfileService>()));
    gh.factory<_i77.SubmitRemoteRateAndWorkTimesUseCase>(() =>
        _i77.SubmitRemoteRateAndWorkTimesUseCase(
            submitRemoteRateAndWorkTimesRepository:
                gh<_i75.SubmitRemoteRateAndWorkTimesRepository>()));
    gh.factory<_i78.TermsAndConditionsService>(() =>
        _i79.TermsAndConditionsServiceImpl(apiService: gh<_i44.ApiService>()));
    gh.singleton<_i80.UserService>(
        _i81.UserServiceImpl(apiService: gh<_i44.ApiService>()));
    gh.factory<_i82.AddSkillsGetIndustryListRepository>(() =>
        _i83.AddSkillsGetIndustryListRepositoryImpl(
            industryService: gh<_i51.IndustryService>()));
    gh.factory<_i84.AddSkillsGetIndustryListUseCase>(() =>
        _i84.AddSkillsGetIndustryListUseCase(
            addSkillsGetIndustryListRepository:
                gh<_i82.AddSkillsGetIndustryListRepository>()));
    gh.factory<_i85.AddSkillsGetSkillsListRepository>(() =>
        _i86.AddSkillsGetSkillsListRepositoryImpl(
            skillsService: gh<_i70.SkillsService>()));
    gh.factory<_i87.AddSkillsGetSkillsListUseCase>(() =>
        _i87.AddSkillsGetSkillsListUseCase(
            addSkillsGetSkillsListRepository:
                gh<_i85.AddSkillsGetSkillsListRepository>()));
    gh.factory<_i88.AddSkillsSubmitRemoteSkillsAndIndustryRepository>(() =>
        _i89.AddSkillsSubmitRemoteSkillsAndIndustryRepositoryImpl(
            profileService: gh<_i64.ProfileService>()));
    gh.factory<_i90.AddSkillsSubmitRemoteSkillsAndIndustryUseCase>(() =>
        _i90.AddSkillsSubmitRemoteSkillsAndIndustryUseCase(
            addSkillsSubmitRemoteSkillsAndIndustryRepository:
                gh<_i88.AddSkillsSubmitRemoteSkillsAndIndustryRepository>()));
    gh.factory<_i91.GetMembershipInformationRepository>(() =>
        _i92.GetMembershipInformationRepositoryImpl(
            membershipDetailsService: gh<_i59.MembershipDetailsService>()));
    gh.factory<_i93.GetMembershipInformationUseCase>(() =>
        _i93.GetMembershipInformationUseCase(
            getMembershipInformationRepository:
                gh<_i91.GetMembershipInformationRepository>()));
    gh.factory<_i94.GetRemoteProfileRepository>(() =>
        _i95.GetRemoteProfileRepositoryImpl(
            profileService: gh<_i64.ProfileService>()));
    gh.factory<_i96.GetRemoteProfileUseCase>(() => _i96.GetRemoteProfileUseCase(
        getRemoteProfileRepository: gh<_i94.GetRemoteProfileRepository>()));
    gh.factory<_i97.GetRemoteTermsAndConditionsRepository>(() =>
        _i98.GetRemoteTermsAndConditionsRepositoryImpl(
            termsAndConditionsService: gh<_i78.TermsAndConditionsService>()));
    gh.factory<_i99.GetRemoteTermsAndConditionsUseCase>(() =>
        _i99.GetRemoteTermsAndConditionsUseCase(
            getRemoteTermsAndConditionsRepository:
                gh<_i97.GetRemoteTermsAndConditionsRepository>()));
    gh.factory<_i100.LoginBloc>(() => _i100.LoginBloc(
        loginContinueClickedUsecase: gh<_i55.LoginContinueClickedUseCase>()));
    gh.factory<_i101.MembershipInformationBloc>(() =>
        _i101.MembershipInformationBloc(
            getMembershipInformationUseCase:
                gh<_i93.GetMembershipInformationUseCase>()));
    gh.factory<_i102.OTPSaveRemoteProfileDataRepository>(() =>
        _i103.OTPSaveRemoteProfileDataRepositoryImpl(
            userService: gh<_i80.UserService>()));
    gh.factory<_i104.OTPSaveRemoteProfileDataUseCase>(() =>
        _i104.OTPSaveRemoteProfileDataUseCase(
            oTPSaveRemoteProfileDataRepository:
                gh<_i102.OTPSaveRemoteProfileDataRepository>()));
    gh.factory<_i105.QualificationsBloc>(() => _i105.QualificationsBloc(
        submitRemoteQualificationAndExperienceUseCase:
            gh<_i74.SubmitRemoteQualificationAndExperienceUseCase>()));
    gh.factory<_i106.RateAndWorkTimesBloc>(() => _i106.RateAndWorkTimesBloc(
        submitRemoteRateAndWorkTimesUseCase:
            gh<_i77.SubmitRemoteRateAndWorkTimesUseCase>()));
    gh.factory<_i107.SetupProfileBloc>(() => _i107.SetupProfileBloc(
          setupProfileRemoteSubmitProfileTypeUseCase:
              gh<_i69.SetupProfileRemoteSubmitProfileTypeUseCase>(),
          setupProfileGetLocalProfileUseCase:
              gh<_i31.SetupProfileGetLocalProfileUseCase>(),
        ));
    gh.factory<_i108.TermsAndConditionsBloc>(() => _i108.TermsAndConditionsBloc(
        getRemoteTermsAndConditionsUseCase:
            gh<_i99.GetRemoteTermsAndConditionsUseCase>()));
    gh.factory<_i109.otpBloc>(() => _i109.otpBloc(
          getRemoteProfileUseCase: gh<_i96.GetRemoteProfileUseCase>(),
          registerOTPCompleteUseCase: gh<_i27.RegisterOTPCompleteUseCase>(),
          otpGetTokenUseCase: gh<_i63.OTPGetTokenUseCase>(),
          otpSaveRemoteProfileDataUseCase:
              gh<_i104.OTPSaveRemoteProfileDataUseCase>(),
        ));
    gh.factory<_i110.AddSkillsBloc>(() => _i110.AddSkillsBloc(
          addSkillsGetIndustryListUseCase:
              gh<_i84.AddSkillsGetIndustryListUseCase>(),
          addSkillsGetSkillsListUseCase:
              gh<_i87.AddSkillsGetSkillsListUseCase>(),
          addSkillsSubmitRemoteSkillsAndIndustryUseCase:
              gh<_i90.AddSkillsSubmitRemoteSkillsAndIndustryUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i111.RegisterModule {}
