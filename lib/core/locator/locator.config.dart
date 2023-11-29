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
import '../../features/landing/presentation/bloc/landing_bloc.dart' as _i19;
import '../../features/location/presentation/bloc/location_bloc.dart' as _i20;
import '../../features/login/data/repository_impl/login_repository_impl/login_continue_clicked_repository_impl.dart'
    as _i55;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i11;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i15;
import '../../features/login/domain/entities/token/token_model.dart' as _i45;
import '../../features/login/domain/repository/login_repository/login_continue_clicked_repository.dart'
    as _i54;
import '../../features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart'
    as _i56;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i78;
import '../../features/membership_information/data/repository_impl/membership_information_repository_impl/get_membership_information_repository_impl.dart'
    as _i73;
import '../../features/membership_information/data/service/remote/membership_details_service.dart'
    as _i60;
import '../../features/membership_information/data/service/remote/membership_details_service_impl.dart'
    as _i61;
import '../../features/membership_information/domain/repository/membership_information_repository/get_membership_information_repository.dart'
    as _i72;
import '../../features/membership_information/domain/use_cases/membership_information_usecase/get_membership_information_usecase.dart'
    as _i74;
import '../../features/membership_information/presentation/bloc/membership_information_bloc.dart'
    as _i79;
import '../../features/minimum_wage/presentation/bloc/minimum_wage_bloc.dart'
    as _i21;
import '../../features/qualification/presentation/bloc/qualification_bloc.dart'
    as _i25;
import '../../features/rate_and_work_times/presentation/bloc/rate_and_work_times_bloc.dart'
    as _i26;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i52;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i51;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i53;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i67;
import '../../features/register_account_step_1/presentation/bloc/register_account_step1_bloc.dart'
    as _i27;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_get_local_profile_repository_impl.dart'
    as _i33;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart'
    as _i32;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart'
    as _i34;
import '../../features/setup_profile/presentation/bloc/setup_profile_bloc.dart'
    as _i68;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i41;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i40;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i42;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i35;
import '../../features/skills_and_industry/presentation/bloc/skills_and_industry_bloc.dart'
    as _i36;
import '../../features/terms_and_conditions/data/repository_impl/terms_and_conditions_repository_impl/get_remote_terms_and_conditions_repository_impl.dart'
    as _i76;
import '../../features/terms_and_conditions/data/repository_impl/terms_and_conditions_repository_impl/submit_remote_terms_and_conditions_acceptance_repository_impl.dart'
    as _i38;
import '../../features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service.dart'
    as _i69;
import '../../features/terms_and_conditions/data/services/remote/terms_and_conditions_service/terms_and_conditions_service_impl.dart'
    as _i70;
import '../../features/terms_and_conditions/domain/repository/terms_and_conditions_repository/get_remote_terms_and_conditions_repository.dart'
    as _i75;
import '../../features/terms_and_conditions/domain/repository/terms_and_conditions_repository/submit_remote_terms_and_conditions_acceptance_repository.dart'
    as _i37;
import '../../features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/get_remote_terms_and_conditions_usecase.dart'
    as _i77;
import '../../features/terms_and_conditions/domain/use_cases/terms_and_conditions_usecase/submit_remote_terms_and_conditions_acceptance_usecase.dart'
    as _i39;
import '../../features/terms_and_conditions/presentation/bloc/terms_and_conditions_bloc.dart'
    as _i83;
import '../../features/you_are_all_setup/presentation/bloc/you_are_all_setup_bloc.dart'
    as _i46;
import '../../localization/generated/l10n.dart' as _i7;
import '../../navigation/app_route.dart' as _i8;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/login_otp_complete_event_repository_impl.dart'
    as _i58;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_token_repository_impl.dart'
    as _i63;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_save_remote_profile_data_repository_impl.dart'
    as _i81;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/register_otp_complete_repository_impl.dart'
    as _i29;
import '../../shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart'
    as _i57;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart'
    as _i62;
import '../../shared/features/otp/domain/repository/otp_repository/otp_save_remote_profile_data_repository.dart'
    as _i80;
import '../../shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart'
    as _i28;
import '../../shared/features/otp/domain/use_cases/otp_usecase/login_otp_complete_event_usecase.dart'
    as _i59;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart'
    as _i64;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_save_remote_profile_data_usecase.dart'
    as _i82;
import '../../shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart'
    as _i30;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i71;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i31;
import '../../shared/remote/api-service.dart' as _i47;
import '../../shared/remote/dio_api_service_impl.dart' as _i48;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i9;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i10;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage.dart'
    as _i13;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage_impl.dart'
    as _i14;
import '../../shared/services/local/Hive/profile_local_storage/profile/profile_model.dart'
    as _i24;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage.dart'
    as _i22;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage_impl.dart'
    as _i23;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage.dart'
    as _i43;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage_impl.dart'
    as _i44;
import '../../shared/services/remote/api_service/profile_service/profile_service.dart'
    as _i65;
import '../../shared/services/remote/api_service/profile_service/profile_service_impl.dart'
    as _i66;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i49;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i50;
import 'locator.dart' as _i84;

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
    gh.factory<_i19.LandingBloc>(() => _i19.LandingBloc());
    gh.factory<_i20.LocationBloc>(() => _i20.LocationBloc());
    gh.factory<_i21.MinimumWageBloc>(() => _i21.MinimumWageBloc());
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
    gh.factory<_i25.QualificationsBloc>(() => _i25.QualificationsBloc());
    gh.factory<_i26.RateAndWorkTimesBloc>(() => _i26.RateAndWorkTimesBloc());
    gh.factory<_i27.RegisterAccountStep1Bloc>(
        () => _i27.RegisterAccountStep1Bloc());
    gh.factory<_i28.RegisterOTPCompleteRepository>(() =>
        _i29.RegisterOTPCompleteRepositoryImpl(
            profileLocalStorage: gh<_i22.ProfileLocalStorage>()));
    gh.factory<_i30.RegisterOTPCompleteUseCase>(() =>
        _i30.RegisterOTPCompleteUseCase(
            registerOTPCompleteEventRepository:
                gh<_i28.RegisterOTPCompleteRepository>()));
    gh.factory<_i31.ResendOTPBloc>(() => _i31.ResendOTPBloc());
    gh.factory<_i32.SetupProfileGetLocalProfileRepository>(() =>
        _i33.SetupProfileGetLocalProfileRepositoryImpl(
            profileLocalStorage: gh<_i22.ProfileLocalStorage>()));
    gh.factory<_i34.SetupProfileGetLocalProfileUseCase>(() =>
        _i34.SetupProfileGetLocalProfileUseCase(
            setupProfileGetLocalProfileRepository:
                gh<_i32.SetupProfileGetLocalProfileRepository>()));
    gh.factory<_i35.SignUpBloc>(() => _i35.SignUpBloc());
    gh.factory<_i36.SkillsAndIndustryBloc>(() => _i36.SkillsAndIndustryBloc());
    gh.factory<_i37.SubmitRemoteTermsAndConditionsAcceptanceRepository>(
        () => _i38.SubmitRemoteTermsAndConditionsAcceptanceRepositoryImpl());
    gh.factory<_i39.SubmitRemoteTermsAndConditionsAcceptanceUseCase>(() =>
        _i39.SubmitRemoteTermsAndConditionsAcceptanceUseCase(
            submitRemoteTermsAndConditionsAcceptanceRepository:
                gh<_i37.SubmitRemoteTermsAndConditionsAcceptanceRepository>()));
    gh.factory<_i40.SubmitSignUpRepository>(
        () => _i41.SubmitSignUpRepositoryImpl());
    gh.factory<_i42.SubmitSignUpUseCase>(() => _i42.SubmitSignUpUseCase(
        submitSignUpRepository: gh<_i40.SubmitSignUpRepository>()));
    gh.factory<_i43.TokenLocalStorage>(() => _i44.TokenLocalStorageImpl());
    gh.factory<_i45.TokenModel>(() => _i45.TokenModel(
          refreshToken: gh<String>(),
          accessToken: gh<String>(),
          tokenID: gh<String>(),
        ));
    gh.factory<_i46.YouAreAllSetupBloc>(() => _i46.YouAreAllSetupBloc());
    gh.singleton<_i47.ApiService>(_i48.DioApiService(dio: gh<_i16.Dio>()));
    gh.singleton<_i49.Authentication>(
        _i50.PFirebaseAuthentication(firebaseAuth: gh<_i18.FirebaseAuth>()));
    gh.factory<_i51.ContinueClickedRepository>(() =>
        _i52.ContinueClickedRepositoryImpl(
            authentication: gh<_i49.Authentication>()));
    gh.factory<_i53.ContinueClickedUseCase>(() => _i53.ContinueClickedUseCase(
        continueClickedRepository: gh<_i51.ContinueClickedRepository>()));
    gh.factory<_i54.LoginContinueClickedRepository>(() =>
        _i55.LoginContinueClickedRepositoryImpl(
            authentication: gh<_i49.Authentication>()));
    gh.factory<_i56.LoginContinueClickedUseCase>(() =>
        _i56.LoginContinueClickedUseCase(
            loginContinueClickedRepository:
                gh<_i54.LoginContinueClickedRepository>()));
    gh.factory<_i57.LoginOTPCompleteEventRepository>(() =>
        _i58.LoginOTPCompleteEventRepositoryImpl(
            profileLocalStorage: gh<_i22.ProfileLocalStorage>()));
    gh.factory<_i59.LoginOTPCompleteEventUseCase>(() =>
        _i59.LoginOTPCompleteEventUseCase(
            loginOTPCompleteEventRepository:
                gh<_i57.LoginOTPCompleteEventRepository>()));
    gh.singleton<_i60.MembershipDetailsService>(
        _i61.MembershipDetailsServiceImpl(
      apiService: gh<_i47.ApiService>(),
      tokenLocalStorage: gh<_i43.TokenLocalStorage>(),
    ));
    gh.factory<_i62.OTPGetTokenRepository>(() => _i63.OTPGetTokenRepositoryImpl(
        authentication: gh<_i49.Authentication>()));
    gh.factory<_i64.OTPGetTokenUseCase>(() => _i64.OTPGetTokenUseCase(
        oTPGetTokenRepository: gh<_i62.OTPGetTokenRepository>()));
    gh.singleton<_i65.ProfileService>(_i66.ProfileServiceImpl(
      apiService: gh<_i47.ApiService>(),
      tokenLocalStorage: gh<_i43.TokenLocalStorage>(),
    ));
    gh.factory<_i67.RegisterBloc>(() => _i67.RegisterBloc(
        continueClickedUseCase: gh<_i53.ContinueClickedUseCase>()));
    gh.factory<_i68.SetupProfileBloc>(() => _i68.SetupProfileBloc(
        setupProfileGetLocalProfileUseCase:
            gh<_i34.SetupProfileGetLocalProfileUseCase>()));
    gh.factory<_i69.TermsAndConditionsService>(
        () => _i70.TermsAndConditionsServiceImpl(
              apiService: gh<_i47.ApiService>(),
              tokenLocalStorage: gh<_i43.TokenLocalStorage>(),
            ));
    gh.factory<_i71.otpBloc>(() => _i71.otpBloc(
          registerOTPCompleteUseCase: gh<_i30.RegisterOTPCompleteUseCase>(),
          otpGetTokenUseCase: gh<_i64.OTPGetTokenUseCase>(),
        ));
    gh.factory<_i72.GetMembershipInformationRepository>(() =>
        _i73.GetMembershipInformationRepositoryImpl(
            membershipDetailsService: gh<_i60.MembershipDetailsService>()));
    gh.factory<_i74.GetMembershipInformationUseCase>(() =>
        _i74.GetMembershipInformationUseCase(
            getMembershipInformationRepository:
                gh<_i72.GetMembershipInformationRepository>()));
    gh.factory<_i75.GetRemoteTermsAndConditionsRepository>(() =>
        _i76.GetRemoteTermsAndConditionsRepositoryImpl(
            termsAndConditionsService: gh<_i69.TermsAndConditionsService>()));
    gh.factory<_i77.GetRemoteTermsAndConditionsUseCase>(() =>
        _i77.GetRemoteTermsAndConditionsUseCase(
            getRemoteTermsAndConditionsRepository:
                gh<_i75.GetRemoteTermsAndConditionsRepository>()));
    gh.factory<_i78.LoginBloc>(() => _i78.LoginBloc(
        loginContinueClickedUsecase: gh<_i56.LoginContinueClickedUseCase>()));
    gh.factory<_i79.MembershipInformationBloc>(() =>
        _i79.MembershipInformationBloc(
            getMembershipInformationUseCase:
                gh<_i74.GetMembershipInformationUseCase>()));
    gh.factory<_i80.OTPSaveRemoteProfileDataRepository>(() =>
        _i81.OTPSaveRemoteProfileDataRepositoryImpl(
            profileService: gh<_i65.ProfileService>()));
    gh.factory<_i82.OTPSaveRemoteProfileDataUseCase>(() =>
        _i82.OTPSaveRemoteProfileDataUseCase(
            oTPSaveRemoteProfileDataRepository:
                gh<_i80.OTPSaveRemoteProfileDataRepository>()));
    gh.factory<_i83.TermsAndConditionsBloc>(() => _i83.TermsAndConditionsBloc(
        getRemoteTermsAndConditionsUseCase:
            gh<_i77.GetRemoteTermsAndConditionsUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i84.RegisterModule {}
