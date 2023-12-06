// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i14;
import 'package:firebase_auth/firebase_auth.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/add_memberships/presentation/bloc/add_memberships_bloc.dart'
    as _i3;
import '../../features/add_qualification/presentation/bloc/add_qualification_bloc.dart'
    as _i4;
import '../../features/add_skills/data/repository_impl/add_skills_repository_impl/add_skills_get_industry_list_repository_impl.dart'
    as _i86;
import '../../features/add_skills/data/repository_impl/add_skills_repository_impl/add_skills_get_skills_list_repository_impl.dart'
    as _i89;
import '../../features/add_skills/data/repository_impl/add_skills_repository_impl/add_skills_submit_remote_skills_and_industry_repository_impl.dart'
    as _i92;
import '../../features/add_skills/domain/repository/add_skills_repository/add_skills_get_industry_list_repository.dart'
    as _i85;
import '../../features/add_skills/domain/repository/add_skills_repository/add_skills_get_skills_list_repository.dart'
    as _i88;
import '../../features/add_skills/domain/repository/add_skills_repository/add_skills_submit_remote_skills_and_industry_repository.dart'
    as _i91;
import '../../features/add_skills/domain/use_cases/add_skills_usecase/add_skills_get_industry_list_usecase.dart'
    as _i87;
import '../../features/add_skills/domain/use_cases/add_skills_usecase/add_skills_get_skills_list_usecase.dart'
    as _i90;
import '../../features/add_skills/domain/use_cases/add_skills_usecase/add_skills_submit_remote_skills_and_industry_usecase.dart'
    as _i93;
import '../../features/add_skills/presentation/bloc/add_skills_bloc.dart'
    as _i119;
import '../../features/add_work_experience/presentation/bloc/add_work_experience_bloc.dart'
    as _i5;
import '../../features/bank_details/data/repository_impl/bank_details_submitted_repositoty_impl.dart'
    as _i95;
import '../../features/bank_details/domain/repository/bank_details_submitted_repository.dart'
    as _i94;
import '../../features/bank_details/domain/usecases/bank_details_submitted_usecase.dart'
    as _i96;
import '../../features/bank_details/presentation/bloc/bank_details_bloc.dart'
    as _i120;
import '../../features/final_details/data/repository_impl/submit_final_details_repository_impl.dart'
    as _i71;
import '../../features/final_details/domain/repository/submit_final_details_repository.dart'
    as _i70;
import '../../features/final_details/domain/usecases/submit_final_details_usecase.dart'
    as _i72;
import '../../features/final_details/presentation/bloc/final_details_bloc.dart'
    as _i121;
import '../../features/landing/presentation/bloc/landing_bloc.dart' as _i16;
import '../../features/location/presentation/bloc/location_bloc.dart' as _i17;
import '../../features/login/data/repository_impl/login_repository_impl/login_continue_clicked_repository_impl.dart'
    as _i52;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i10;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i13;
import '../../features/login/domain/entities/token/token_model.dart' as _i39;
import '../../features/login/domain/repository/login_repository/login_continue_clicked_repository.dart'
    as _i51;
import '../../features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart'
    as _i53;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i106;
import '../../features/membership_information/data/repository_impl/membership_information_repository_impl/get_membership_information_repository_impl.dart'
    as _i98;
import '../../features/membership_information/data/service/remote/membership_details_service.dart'
    as _i57;
import '../../features/membership_information/data/service/remote/membership_details_service_impl.dart'
    as _i58;
import '../../features/membership_information/domain/repository/membership_information_repository/get_membership_information_repository.dart'
    as _i97;
import '../../features/membership_information/domain/use_cases/membership_information_usecase/get_membership_information_usecase.dart'
    as _i99;
import '../../features/membership_information/presentation/bloc/membership_information_bloc.dart'
    as _i107;
import '../../features/minimum_wage/presentation/bloc/minimum_wage_bloc.dart'
    as _i18;
import '../../features/qualification/data/repository_impl/qualification_repository_impl/submit_remote_qualifications_and_experience_repository_impl.dart'
    as _i74;
import '../../features/qualification/domain/repository/qualification_repository/submit_remote_qualifications_and_experience_repository.dart'
    as _i73;
import '../../features/qualification/domain/use_cases/qualification_usecase/submit_remote_qualifications_and_experience_usecase.dart'
    as _i75;
import '../../features/qualification/presentation/bloc/qualification_bloc.dart'
    as _i111;
import '../../features/rate_and_work_times/data/repository_impl/rate_and_work_times_repository_impl/submit_remote_rate_and_work_times_repository_impl.dart'
    as _i77;
import '../../features/rate_and_work_times/domain/repository/rate_and_work_times_repository/submit_remote_rate_and_work_times_repository.dart'
    as _i76;
import '../../features/rate_and_work_times/domain/use_cases/rate_and_work_times_usecase/submit_remote_rate_and_work_times_usecase.dart'
    as _i78;
import '../../features/rate_and_work_times/presentation/bloc/rate_and_work_times_bloc.dart'
    as _i112;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i47;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i46;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i48;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i64;
import '../../features/register_account_step_1/presentation/bloc/register_account_step1_bloc.dart'
    as _i22;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_get_local_profile_repository_impl.dart'
    as _i28;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_remote_submit_profile_type__repository_impl.dart'
    as _i66;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart'
    as _i27;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_remote_submit_profile_type__repository.dart'
    as _i65;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart'
    as _i29;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_remote_submit_profile_type__usecase.dart'
    as _i67;
import '../../features/setup_profile/presentation/bloc/setup_profile_bloc.dart'
    as _i113;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i35;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i34;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i36;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i30;
import '../../features/terms_and_conditions/data/repository_impl/terms_and_conditions_repository_impl/get_remote_terms_and_conditions_repository_impl.dart'
    as _i104;
import '../../features/terms_and_conditions/data/repository_impl/terms_and_conditions_repository_impl/submit_remote_terms_and_conditions_acceptance_repository_impl.dart'
    as _i32;
import '../../features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service.dart'
    as _i79;
import '../../features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service_impl.dart'
    as _i80;
import '../../features/terms_and_conditions/domain/repository/terms_and_conditions_repository/get_remote_terms_and_conditions_repository.dart'
    as _i103;
import '../../features/terms_and_conditions/domain/repository/terms_and_conditions_repository/submit_remote_terms_and_conditions_acceptance_repository.dart'
    as _i31;
import '../../features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/get_remote_terms_and_conditions_usecase.dart'
    as _i105;
import '../../features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/submit_remote_terms_and_conditions_acceptance_usecase.dart'
    as _i33;
import '../../features/terms_and_conditions/presentation/bloc/terms_and_conditions_bloc.dart'
    as _i114;
import '../../features/you_are_all_setup/presentation/bloc/you_are_all_setup_bloc.dart'
    as _i41;
import '../../localization/generated/l10n.dart' as _i6;
import '../../navigation/app_route.dart' as _i7;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/get_remote_profile_repository_impl.dart'
    as _i101;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/login_otp_complete_event_repository_impl.dart'
    as _i55;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_token_repository_impl.dart'
    as _i60;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_save_remote_profile_data_repository_impl.dart'
    as _i109;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/register_otp_complete_repository_impl.dart'
    as _i24;
import '../../shared/features/otp/domain/repository/otp_repository/get_remote_profile_repository.dart'
    as _i100;
import '../../shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart'
    as _i54;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart'
    as _i59;
import '../../shared/features/otp/domain/repository/otp_repository/otp_save_remote_profile_data_repository.dart'
    as _i108;
import '../../shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart'
    as _i23;
import '../../shared/features/otp/domain/use_cases/otp_usecase/get_remote_profile_usecase.dart'
    as _i102;
import '../../shared/features/otp/domain/use_cases/otp_usecase/login_otp_complete_event_usecase.dart'
    as _i56;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart'
    as _i61;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_save_remote_profile_data_usecase.dart'
    as _i110;
import '../../shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart'
    as _i25;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i118;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i26;
import '../../shared/features/upload_file/data/repository_impl/upload_file_repository_impl.dart'
    as _i116;
import '../../shared/features/upload_file/domain/repository/upload_file_repository.dart'
    as _i115;
import '../../shared/features/upload_file/domain/usecases/upload_file_usecase.dart'
    as _i117;
import '../../shared/remote/api-service.dart' as _i42;
import '../../shared/remote/dio_api_service_impl.dart' as _i43;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i8;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i9;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage.dart'
    as _i11;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage_impl.dart'
    as _i12;
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
import '../../shared/services/remote/api_service/profile_service/profile_service.dart'
    as _i62;
import '../../shared/services/remote/api_service/profile_service/profile_service_impl.dart'
    as _i63;
import '../../shared/services/remote/api_service/skills_service/skills_service.dart'
    as _i68;
import '../../shared/services/remote/api_service/skills_service/skills_service_impl.dart'
    as _i69;
import '../../shared/services/remote/api_service/upload_file_service/upload_file_service.dart'
    as _i81;
import '../../shared/services/remote/api_service/upload_file_service/upload_file_service_impl.dart'
    as _i82;
import '../../shared/services/remote/api_service/user_service/user_service.dart'
    as _i83;
import '../../shared/services/remote/api_service/user_service/user_service_impl.dart'
    as _i84;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i44;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i45;
import 'locator.dart' as _i122;

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
    gh.singleton<_i15.FirebaseAuth>(registerModule.firebaseAuth);
    gh.factory<_i16.LandingBloc>(() => _i16.LandingBloc());
    gh.factory<_i17.LocationBloc>(() => _i17.LocationBloc());
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
    gh.singleton<_i42.ApiService>(_i43.DioApiService(dio: gh<_i14.Dio>()));
    gh.singleton<_i44.Authentication>(
        _i45.PFirebaseAuthentication(firebaseAuth: gh<_i15.FirebaseAuth>()));
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
    gh.singleton<_i62.ProfileService>(
        _i63.ProfileServiceImpl(apiService: gh<_i42.ApiService>()));
    gh.factory<_i64.RegisterBloc>(() => _i64.RegisterBloc(
        continueClickedUseCase: gh<_i48.ContinueClickedUseCase>()));
    gh.factory<_i65.SetupProfileRemoteSubmitProfileTypeRepository>(() =>
        _i66.SetupProfileRemoteSubmitProfileTypeRepositoryImpl(
            profileService: gh<_i62.ProfileService>()));
    gh.factory<_i67.SetupProfileRemoteSubmitProfileTypeUseCase>(() =>
        _i67.SetupProfileRemoteSubmitProfileTypeUseCase(
            setupProfileRemoteSubmitProfileTypeRepository:
                gh<_i65.SetupProfileRemoteSubmitProfileTypeRepository>()));
    gh.singleton<_i68.SkillsService>(
        _i69.SkillsServiceImpl(apiService: gh<_i42.ApiService>()));
    gh.factory<_i70.SubmitFinalDetailsRepository>(() =>
        _i71.SubmitFinalDetailsRepositoryImpl(
            profileService: gh<_i62.ProfileService>()));
    gh.factory<_i72.SubmitFinalDetailsUseCase>(() =>
        _i72.SubmitFinalDetailsUseCase(
            submitFinalDetailsRepository:
                gh<_i70.SubmitFinalDetailsRepository>()));
    gh.factory<_i73.SubmitRemoteQualificationAndExperienceRepository>(() =>
        _i74.SubmitRemoteQualificationAndExperienceRepositoryImpl(
            profileService: gh<_i62.ProfileService>()));
    gh.factory<_i75.SubmitRemoteQualificationAndExperienceUseCase>(() =>
        _i75.SubmitRemoteQualificationAndExperienceUseCase(
            submitRemoteQualificationAndExperienceRepository:
                gh<_i73.SubmitRemoteQualificationAndExperienceRepository>()));
    gh.factory<_i76.SubmitRemoteRateAndWorkTimesRepository>(() =>
        _i77.SubmitRemoteRateAndWorkTimesRepositoryImpl(
            profileService: gh<_i62.ProfileService>()));
    gh.factory<_i78.SubmitRemoteRateAndWorkTimesUseCase>(() =>
        _i78.SubmitRemoteRateAndWorkTimesUseCase(
            submitRemoteRateAndWorkTimesRepository:
                gh<_i76.SubmitRemoteRateAndWorkTimesRepository>()));
    gh.factory<_i79.TermsAndConditionsService>(() =>
        _i80.TermsAndConditionsServiceImpl(apiService: gh<_i42.ApiService>()));
    gh.factory<_i81.UploadFileService>(
        () => _i82.UploadFileServiceImpl(apiService: gh<_i42.ApiService>()));
    gh.singleton<_i83.UserService>(
        _i84.UserServiceImpl(apiService: gh<_i42.ApiService>()));
    gh.factory<_i85.AddSkillsGetIndustryListRepository>(() =>
        _i86.AddSkillsGetIndustryListRepositoryImpl(
            industryService: gh<_i49.IndustryService>()));
    gh.factory<_i87.AddSkillsGetIndustryListUseCase>(() =>
        _i87.AddSkillsGetIndustryListUseCase(
            addSkillsGetIndustryListRepository:
                gh<_i85.AddSkillsGetIndustryListRepository>()));
    gh.factory<_i88.AddSkillsGetSkillsListRepository>(() =>
        _i89.AddSkillsGetSkillsListRepositoryImpl(
            skillsService: gh<_i68.SkillsService>()));
    gh.factory<_i90.AddSkillsGetSkillsListUseCase>(() =>
        _i90.AddSkillsGetSkillsListUseCase(
            addSkillsGetSkillsListRepository:
                gh<_i88.AddSkillsGetSkillsListRepository>()));
    gh.factory<_i91.AddSkillsSubmitRemoteSkillsAndIndustryRepository>(() =>
        _i92.AddSkillsSubmitRemoteSkillsAndIndustryRepositoryImpl(
            profileService: gh<_i62.ProfileService>()));
    gh.factory<_i93.AddSkillsSubmitRemoteSkillsAndIndustryUseCase>(() =>
        _i93.AddSkillsSubmitRemoteSkillsAndIndustryUseCase(
            addSkillsSubmitRemoteSkillsAndIndustryRepository:
                gh<_i91.AddSkillsSubmitRemoteSkillsAndIndustryRepository>()));
    gh.factory<_i94.BankDetailsSubmittedRepository>(() =>
        _i95.BankDetailsSubmittedRepositoryImpl(
            profileService: gh<_i62.ProfileService>()));
    gh.factory<_i96.BankDetailsSubmittedUseCase>(() =>
        _i96.BankDetailsSubmittedUseCase(
            bankDetailsSubmittedRepository:
                gh<_i94.BankDetailsSubmittedRepository>()));
    gh.factory<_i97.GetMembershipInformationRepository>(() =>
        _i98.GetMembershipInformationRepositoryImpl(
            membershipDetailsService: gh<_i57.MembershipDetailsService>()));
    gh.factory<_i99.GetMembershipInformationUseCase>(() =>
        _i99.GetMembershipInformationUseCase(
            getMembershipInformationRepository:
                gh<_i97.GetMembershipInformationRepository>()));
    gh.factory<_i100.GetRemoteProfileRepository>(() =>
        _i101.GetRemoteProfileRepositoryImpl(
            profileService: gh<_i62.ProfileService>()));
    gh.factory<_i102.GetRemoteProfileUseCase>(() =>
        _i102.GetRemoteProfileUseCase(
            getRemoteProfileRepository:
                gh<_i100.GetRemoteProfileRepository>()));
    gh.factory<_i103.GetRemoteTermsAndConditionsRepository>(() =>
        _i104.GetRemoteTermsAndConditionsRepositoryImpl(
            termsAndConditionsService: gh<_i79.TermsAndConditionsService>()));
    gh.factory<_i105.GetRemoteTermsAndConditionsUseCase>(() =>
        _i105.GetRemoteTermsAndConditionsUseCase(
            getRemoteTermsAndConditionsRepository:
                gh<_i103.GetRemoteTermsAndConditionsRepository>()));
    gh.factory<_i106.LoginBloc>(() => _i106.LoginBloc(
        loginContinueClickedUsecase: gh<_i53.LoginContinueClickedUseCase>()));
    gh.factory<_i107.MembershipInformationBloc>(() =>
        _i107.MembershipInformationBloc(
            getMembershipInformationUseCase:
                gh<_i99.GetMembershipInformationUseCase>()));
    gh.factory<_i108.OTPSaveRemoteProfileDataRepository>(() =>
        _i109.OTPSaveRemoteProfileDataRepositoryImpl(
            userService: gh<_i83.UserService>()));
    gh.factory<_i110.OTPSaveRemoteProfileDataUseCase>(() =>
        _i110.OTPSaveRemoteProfileDataUseCase(
            oTPSaveRemoteProfileDataRepository:
                gh<_i108.OTPSaveRemoteProfileDataRepository>()));
    gh.factory<_i111.QualificationsBloc>(() => _i111.QualificationsBloc(
        submitRemoteQualificationAndExperienceUseCase:
            gh<_i75.SubmitRemoteQualificationAndExperienceUseCase>()));
    gh.factory<_i112.RateAndWorkTimesBloc>(() => _i112.RateAndWorkTimesBloc(
        submitRemoteRateAndWorkTimesUseCase:
            gh<_i78.SubmitRemoteRateAndWorkTimesUseCase>()));
    gh.factory<_i113.SetupProfileBloc>(() => _i113.SetupProfileBloc(
          setupProfileRemoteSubmitProfileTypeUseCase:
              gh<_i67.SetupProfileRemoteSubmitProfileTypeUseCase>(),
          setupProfileGetLocalProfileUseCase:
              gh<_i29.SetupProfileGetLocalProfileUseCase>(),
        ));
    gh.factory<_i114.TermsAndConditionsBloc>(() => _i114.TermsAndConditionsBloc(
        getRemoteTermsAndConditionsUseCase:
            gh<_i105.GetRemoteTermsAndConditionsUseCase>()));
    gh.factory<_i115.UploadFileRepository>(() => _i116.UploadFileRepositoryImpl(
        uploadFileService: gh<_i81.UploadFileService>()));
    gh.factory<_i117.UploadFileUseCase>(() => _i117.UploadFileUseCase(
        uploadFileRepository: gh<_i115.UploadFileRepository>()));
    gh.factory<_i118.otpBloc>(() => _i118.otpBloc(
          getRemoteProfileUseCase: gh<_i102.GetRemoteProfileUseCase>(),
          registerOTPCompleteUseCase: gh<_i25.RegisterOTPCompleteUseCase>(),
          otpGetTokenUseCase: gh<_i61.OTPGetTokenUseCase>(),
          otpSaveRemoteProfileDataUseCase:
              gh<_i110.OTPSaveRemoteProfileDataUseCase>(),
        ));
    gh.factory<_i119.AddSkillsBloc>(() => _i119.AddSkillsBloc(
          addSkillsGetIndustryListUseCase:
              gh<_i87.AddSkillsGetIndustryListUseCase>(),
          addSkillsGetSkillsListUseCase:
              gh<_i90.AddSkillsGetSkillsListUseCase>(),
          addSkillsSubmitRemoteSkillsAndIndustryUseCase:
              gh<_i93.AddSkillsSubmitRemoteSkillsAndIndustryUseCase>(),
        ));
    gh.factory<_i120.BankDetailsBloc>(() => _i120.BankDetailsBloc(
        bankDetailsSubmittedUseCase: gh<_i96.BankDetailsSubmittedUseCase>()));
    gh.factory<_i121.FinalDetailsBloc>(() => _i121.FinalDetailsBloc(
          uploadFileUseCase: gh<_i117.UploadFileUseCase>(),
          submitFinalDetailsUseCase: gh<_i72.SubmitFinalDetailsUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i122.RegisterModule {}
