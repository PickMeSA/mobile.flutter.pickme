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
import '../../features/bank_details/presentation/bloc/bank_details_bloc.dart'
    as _i12;
import '../../features/final_details/presentation/bloc/final_details_bloc.dart'
    as _i17;
import '../../features/landing/presentation/bloc/landing_bloc.dart' as _i22;
import '../../features/location/presentation/bloc/location_bloc.dart' as _i23;
import '../../features/login/data/repository_impl/login_repository_impl/login_continue_clicked_repository_impl.dart'
    as _i59;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i11;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i15;
import '../../features/login/domain/entities/token/token_model.dart' as _i48;
import '../../features/login/domain/repository/login_repository/login_continue_clicked_repository.dart'
    as _i58;
import '../../features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart'
    as _i60;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i85;
import '../../features/membership_information/data/repository_impl/membership_information_repository_impl/get_membership_information_repository_impl.dart'
    as _i80;
import '../../features/membership_information/data/service/remote/membership_details_service.dart'
    as _i64;
import '../../features/membership_information/data/service/remote/membership_details_service_impl.dart'
    as _i65;
import '../../features/membership_information/domain/repository/membership_information_repository/get_membership_information_repository.dart'
    as _i79;
import '../../features/membership_information/domain/use_cases/membership_information_usecase/get_membership_information_usecase.dart'
    as _i81;
import '../../features/membership_information/presentation/bloc/membership_information_bloc.dart'
    as _i86;
import '../../features/minimum_wage/presentation/bloc/minimum_wage_bloc.dart'
    as _i24;
import '../../features/qualification/presentation/bloc/qualification_bloc.dart'
    as _i28;
import '../../features/rate_and_work_times/presentation/bloc/rate_and_work_times_bloc.dart'
    as _i29;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i56;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i55;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i57;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i71;
import '../../features/register_account_step_1/presentation/bloc/register_account_step1_bloc.dart'
    as _i30;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_get_local_profile_repository_impl.dart'
    as _i36;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_remote_submit_profile_type__repository_impl.dart'
    as _i73;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart'
    as _i35;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_remote_submit_profile_type__repository.dart'
    as _i72;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart'
    as _i37;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_remote_submit_profile_type__usecase.dart'
    as _i74;
import '../../features/setup_profile/presentation/bloc/setup_profile_bloc.dart'
    as _i90;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i44;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i43;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i45;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i38;
import '../../features/skills_and_industry/presentation/bloc/skills_and_industry_bloc.dart'
    as _i39;
import '../../features/terms_and_conditions/data/repository_impl/terms_and_conditions_repository_impl/get_remote_terms_and_conditions_repository_impl.dart'
    as _i83;
import '../../features/terms_and_conditions/data/repository_impl/terms_and_conditions_repository_impl/submit_remote_terms_and_conditions_acceptance_repository_impl.dart'
    as _i41;
import '../../features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service.dart'
    as _i75;
import '../../features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service_impl.dart'
    as _i76;
import '../../features/terms_and_conditions/domain/repository/terms_and_conditions_repository/get_remote_terms_and_conditions_repository.dart'
    as _i82;
import '../../features/terms_and_conditions/domain/repository/terms_and_conditions_repository/submit_remote_terms_and_conditions_acceptance_repository.dart'
    as _i40;
import '../../features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/get_remote_terms_and_conditions_usecase.dart'
    as _i84;
import '../../features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/submit_remote_terms_and_conditions_acceptance_usecase.dart'
    as _i42;
import '../../features/terms_and_conditions/presentation/bloc/terms_and_conditions_bloc.dart'
    as _i91;
import '../../features/you_are_all_setup/presentation/bloc/you_are_all_setup_bloc.dart'
    as _i50;
import '../../localization/generated/l10n.dart' as _i7;
import '../../navigation/app_route.dart' as _i8;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/get_remote_profile_repository_impl.dart'
    as _i20;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/login_otp_complete_event_repository_impl.dart'
    as _i62;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_token_repository_impl.dart'
    as _i67;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_save_remote_profile_data_repository_impl.dart'
    as _i88;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/register_otp_complete_repository_impl.dart'
    as _i32;
import '../../shared/features/otp/domain/repository/otp_repository/get_remote_profile_repository.dart'
    as _i19;
import '../../shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart'
    as _i61;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart'
    as _i66;
import '../../shared/features/otp/domain/repository/otp_repository/otp_save_remote_profile_data_repository.dart'
    as _i87;
import '../../shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart'
    as _i31;
import '../../shared/features/otp/domain/use_cases/otp_usecase/get_remote_profile_usecase.dart'
    as _i21;
import '../../shared/features/otp/domain/use_cases/otp_usecase/login_otp_complete_event_usecase.dart'
    as _i63;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart'
    as _i68;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_save_remote_profile_data_usecase.dart'
    as _i89;
import '../../shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart'
    as _i33;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i92;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i34;
import '../../shared/remote/api-service.dart' as _i51;
import '../../shared/remote/dio_api_service_impl.dart' as _i52;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i9;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i10;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage.dart'
    as _i13;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage_impl.dart'
    as _i14;
import '../../shared/services/local/Hive/profile_local_storage/profile/profile_model.dart'
    as _i27;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage.dart'
    as _i25;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage_impl.dart'
    as _i26;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage.dart'
    as _i46;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage_impl.dart'
    as _i47;
import '../../shared/services/local/Hive/user_local_storage/user/user_model.dart'
    as _i49;
import '../../shared/services/remote/api_service/profile_service/profile_service.dart'
    as _i69;
import '../../shared/services/remote/api_service/profile_service/profile_service_impl.dart'
    as _i70;
import '../../shared/services/remote/api_service/user_service/user_service.dart'
    as _i77;
import '../../shared/services/remote/api_service/user_service/user_service_impl.dart'
    as _i78;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i53;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i54;
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
    gh.factory<_i7.AppLocalizations>(() => registerModule.appLocalizations);
    gh.lazySingleton<_i8.AppRouter>(() => _i8.AppRouter());
    gh.factory<_i9.AppStateLocalStorage>(() => _i10.AppStateLocalStorageImpl());
    gh.factory<_i11.AppStateModel>(
        () => _i11.AppStateModel(loggedIn: gh<bool>()));
    gh.factory<_i12.BankDetailsBloc>(() => _i12.BankDetailsBloc());
    gh.singleton<_i13.BiometricsLocalStorage>(
        _i14.BiometricsLocalStorageImpl());
    gh.factory<_i15.BiometricsModel>(
        () => _i15.BiometricsModel(biometrics: gh<bool>()));
    gh.factory<_i16.Dio>(() => registerModule.dio);
    gh.factory<_i17.FinalDetailsBloc>(() => _i17.FinalDetailsBloc());
    gh.singleton<_i18.FirebaseAuth>(registerModule.firebaseAuth);
    gh.factory<_i19.GetRemoteProfileRepository>(
        () => _i20.GetRemoteProfileRepositoryImpl());
    gh.factory<_i21.GetRemoteProfileUseCase>(() => _i21.GetRemoteProfileUseCase(
        getRemoteProfileRepository: gh<_i19.GetRemoteProfileRepository>()));
    gh.factory<_i22.LandingBloc>(() => _i22.LandingBloc());
    gh.factory<_i23.LocationBloc>(() => _i23.LocationBloc());
    gh.factory<_i24.MinimumWageBloc>(() => _i24.MinimumWageBloc());
    gh.factory<_i25.ProfileLocalStorage>(() => _i26.ProfileLocalStorageImpl());
    gh.factory<_i27.ProfileModel>(() => _i27.ProfileModel(
          workPermitNumber: gh<String>(),
          idNumber: gh<String>(),
          emailAddress: gh<String>(),
          phoneNumber: gh<String>(),
          surname: gh<String>(),
          firstName: gh<String>(),
          passportNumber: gh<String>(),
        ));
    gh.factory<_i28.QualificationsBloc>(() => _i28.QualificationsBloc());
    gh.factory<_i29.RateAndWorkTimesBloc>(() => _i29.RateAndWorkTimesBloc());
    gh.factory<_i30.RegisterAccountStep1Bloc>(
        () => _i30.RegisterAccountStep1Bloc());
    gh.factory<_i31.RegisterOTPCompleteRepository>(() =>
        _i32.RegisterOTPCompleteRepositoryImpl(
            profileLocalStorage: gh<_i25.ProfileLocalStorage>()));
    gh.factory<_i33.RegisterOTPCompleteUseCase>(() =>
        _i33.RegisterOTPCompleteUseCase(
            registerOTPCompleteEventRepository:
                gh<_i31.RegisterOTPCompleteRepository>()));
    gh.factory<_i34.ResendOTPBloc>(() => _i34.ResendOTPBloc());
    gh.factory<_i35.SetupProfileGetLocalProfileRepository>(() =>
        _i36.SetupProfileGetLocalProfileRepositoryImpl(
            profileLocalStorage: gh<_i25.ProfileLocalStorage>()));
    gh.factory<_i37.SetupProfileGetLocalProfileUseCase>(() =>
        _i37.SetupProfileGetLocalProfileUseCase(
            setupProfileGetLocalProfileRepository:
                gh<_i35.SetupProfileGetLocalProfileRepository>()));
    gh.factory<_i38.SignUpBloc>(() => _i38.SignUpBloc());
    gh.factory<_i39.SkillsAndIndustryBloc>(() => _i39.SkillsAndIndustryBloc());
    gh.factory<_i40.SubmitRemoteTermsAndConditionsAcceptanceRepository>(
        () => _i41.SubmitRemoteTermsAndConditionsAcceptanceRepositoryImpl());
    gh.factory<_i42.SubmitRemoteTermsAndConditionsAcceptanceUseCase>(() =>
        _i42.SubmitRemoteTermsAndConditionsAcceptanceUseCase(
            submitRemoteTermsAndConditionsAcceptanceRepository:
                gh<_i40.SubmitRemoteTermsAndConditionsAcceptanceRepository>()));
    gh.factory<_i43.SubmitSignUpRepository>(
        () => _i44.SubmitSignUpRepositoryImpl());
    gh.factory<_i45.SubmitSignUpUseCase>(() => _i45.SubmitSignUpUseCase(
        submitSignUpRepository: gh<_i43.SubmitSignUpRepository>()));
    gh.factory<_i46.TokenLocalStorage>(() => _i47.TokenLocalStorageImpl());
    gh.factory<_i48.TokenModel>(() => _i48.TokenModel(
          refreshToken: gh<String>(),
          accessToken: gh<String>(),
          tokenID: gh<String>(),
        ));
    gh.factory<_i49.UserModel>(() => _i49.UserModel(id: gh<String>()));
    gh.factory<_i50.YouAreAllSetupBloc>(() => _i50.YouAreAllSetupBloc());
    gh.singleton<_i51.ApiService>(_i52.DioApiService(dio: gh<_i16.Dio>()));
    gh.singleton<_i53.Authentication>(
        _i54.PFirebaseAuthentication(firebaseAuth: gh<_i18.FirebaseAuth>()));
    gh.factory<_i55.ContinueClickedRepository>(() =>
        _i56.ContinueClickedRepositoryImpl(
            authentication: gh<_i53.Authentication>()));
    gh.factory<_i57.ContinueClickedUseCase>(() => _i57.ContinueClickedUseCase(
        continueClickedRepository: gh<_i55.ContinueClickedRepository>()));
    gh.factory<_i58.LoginContinueClickedRepository>(() =>
        _i59.LoginContinueClickedRepositoryImpl(
            authentication: gh<_i53.Authentication>()));
    gh.factory<_i60.LoginContinueClickedUseCase>(() =>
        _i60.LoginContinueClickedUseCase(
            loginContinueClickedRepository:
                gh<_i58.LoginContinueClickedRepository>()));
    gh.factory<_i61.LoginOTPCompleteEventRepository>(() =>
        _i62.LoginOTPCompleteEventRepositoryImpl(
            profileLocalStorage: gh<_i25.ProfileLocalStorage>()));
    gh.factory<_i63.LoginOTPCompleteEventUseCase>(() =>
        _i63.LoginOTPCompleteEventUseCase(
            loginOTPCompleteEventRepository:
                gh<_i61.LoginOTPCompleteEventRepository>()));
    gh.singleton<_i64.MembershipDetailsService>(
        _i65.MembershipDetailsServiceImpl(
      apiService: gh<_i51.ApiService>(),
      tokenLocalStorage: gh<_i46.TokenLocalStorage>(),
    ));
    gh.factory<_i66.OTPGetTokenRepository>(() => _i67.OTPGetTokenRepositoryImpl(
        authentication: gh<_i53.Authentication>()));
    gh.factory<_i68.OTPGetTokenUseCase>(() => _i68.OTPGetTokenUseCase(
        oTPGetTokenRepository: gh<_i66.OTPGetTokenRepository>()));
    gh.singleton<_i69.ProfileService>(_i70.ProfileServiceImpl(
      apiService: gh<_i51.ApiService>(),
      tokenLocalStorage: gh<_i46.TokenLocalStorage>(),
    ));
    gh.factory<_i71.RegisterBloc>(() => _i71.RegisterBloc(
        continueClickedUseCase: gh<_i57.ContinueClickedUseCase>()));
    gh.factory<_i72.SetupProfileRemoteSubmitProfileTypeRepository>(() =>
        _i73.SetupProfileRemoteSubmitProfileTypeRepositoryImpl(
            profileService: gh<_i69.ProfileService>()));
    gh.factory<_i74.SetupProfileRemoteSubmitProfileTypeUseCase>(() =>
        _i74.SetupProfileRemoteSubmitProfileTypeUseCase(
            setupProfileRemoteSubmitProfileTypeRepository:
                gh<_i72.SetupProfileRemoteSubmitProfileTypeRepository>()));
    gh.factory<_i75.TermsAndConditionsService>(
        () => _i76.TermsAndConditionsServiceImpl(
              apiService: gh<_i51.ApiService>(),
              tokenLocalStorage: gh<_i46.TokenLocalStorage>(),
            ));
    gh.singleton<_i77.UserService>(_i78.UserServiceImpl(
      apiService: gh<_i51.ApiService>(),
      tokenLocalStorage: gh<_i46.TokenLocalStorage>(),
    ));
    gh.factory<_i79.GetMembershipInformationRepository>(() =>
        _i80.GetMembershipInformationRepositoryImpl(
            membershipDetailsService: gh<_i64.MembershipDetailsService>()));
    gh.factory<_i81.GetMembershipInformationUseCase>(() =>
        _i81.GetMembershipInformationUseCase(
            getMembershipInformationRepository:
                gh<_i79.GetMembershipInformationRepository>()));
    gh.factory<_i82.GetRemoteTermsAndConditionsRepository>(() =>
        _i83.GetRemoteTermsAndConditionsRepositoryImpl(
            termsAndConditionsService: gh<_i75.TermsAndConditionsService>()));
    gh.factory<_i84.GetRemoteTermsAndConditionsUseCase>(() =>
        _i84.GetRemoteTermsAndConditionsUseCase(
            getRemoteTermsAndConditionsRepository:
                gh<_i82.GetRemoteTermsAndConditionsRepository>()));
    gh.factory<_i85.LoginBloc>(() => _i85.LoginBloc(
        loginContinueClickedUsecase: gh<_i60.LoginContinueClickedUseCase>()));
    gh.factory<_i86.MembershipInformationBloc>(() =>
        _i86.MembershipInformationBloc(
            getMembershipInformationUseCase:
                gh<_i81.GetMembershipInformationUseCase>()));
    gh.factory<_i87.OTPSaveRemoteProfileDataRepository>(() =>
        _i88.OTPSaveRemoteProfileDataRepositoryImpl(
            userService: gh<_i77.UserService>()));
    gh.factory<_i89.OTPSaveRemoteProfileDataUseCase>(() =>
        _i89.OTPSaveRemoteProfileDataUseCase(
            oTPSaveRemoteProfileDataRepository:
                gh<_i87.OTPSaveRemoteProfileDataRepository>()));
    gh.factory<_i90.SetupProfileBloc>(() => _i90.SetupProfileBloc(
          setupProfileRemoteSubmitProfileTypeUseCase:
              gh<_i74.SetupProfileRemoteSubmitProfileTypeUseCase>(),
          setupProfileGetLocalProfileUseCase:
              gh<_i37.SetupProfileGetLocalProfileUseCase>(),
        ));
    gh.factory<_i91.TermsAndConditionsBloc>(() => _i91.TermsAndConditionsBloc(
        getRemoteTermsAndConditionsUseCase:
            gh<_i84.GetRemoteTermsAndConditionsUseCase>()));
    gh.factory<_i92.otpBloc>(() => _i92.otpBloc(
          registerOTPCompleteUseCase: gh<_i33.RegisterOTPCompleteUseCase>(),
          otpGetTokenUseCase: gh<_i68.OTPGetTokenUseCase>(),
          otpSaveRemoteProfileDataUseCase:
              gh<_i89.OTPSaveRemoteProfileDataUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i93.RegisterModule {}
