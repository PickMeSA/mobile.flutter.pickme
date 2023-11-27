// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i16;
import 'package:firebase_auth/firebase_auth.dart' as _i17;
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
import '../../features/landing/presentation/bloc/landing_bloc.dart' as _i18;
import '../../features/login/data/repository_impl/login_repository_impl/login_continue_clicked_repository_impl.dart'
    as _i51;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i11;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i15;
import '../../features/login/domain/entities/token/token_model.dart' as _i42;
import '../../features/login/domain/repository/login_repository/login_continue_clicked_repository.dart'
    as _i50;
import '../../features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart'
    as _i52;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i64;
import '../../features/membership_information/presentation/bloc/membership_information_bloc.dart'
    as _i19;
import '../../features/minimum_wage/presentation/bloc/minimum_wage_bloc.dart'
    as _i20;
import '../../features/qualification/presentation/bloc/qualification_bloc.dart'
    as _i24;
import '../../features/rate_and_work_times/presentation/bloc/rate_and_work_times_bloc.dart'
    as _i25;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i48;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i47;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i49;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i61;
import '../../features/register_account_step_1/presentation/bloc/register_account_step1_bloc.dart'
    as _i26;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_get_local_profile_repository_impl.dart'
    as _i32;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart'
    as _i31;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart'
    as _i33;
import '../../features/setup_profile/presentation/bloc/setup_profile_bloc.dart'
    as _i62;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i37;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i36;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i38;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i34;
import '../../features/skills_and_industry/presentation/bloc/skills_and_industry_bloc.dart'
    as _i35;
import '../../features/terms_and_conditions/presentation/bloc/terms_and_conditions_bloc.dart'
    as _i39;
import '../../localization/generated/l10n.dart' as _i7;
import '../../navigation/app_route.dart' as _i8;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/login_otp_complete_event_repository_impl.dart'
    as _i54;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_token_repository_impl.dart'
    as _i57;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_save_remote_profile_data_repository_impl.dart'
    as _i66;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/register_otp_complete_repository_impl.dart'
    as _i28;
import '../../shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart'
    as _i53;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart'
    as _i56;
import '../../shared/features/otp/domain/repository/otp_repository/otp_save_remote_profile_data_repository.dart'
    as _i65;
import '../../shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart'
    as _i27;
import '../../shared/features/otp/domain/use_cases/otp_usecase/login_otp_complete_event_usecase.dart'
    as _i55;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart'
    as _i58;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_save_remote_profile_data_usecase.dart'
    as _i67;
import '../../shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart'
    as _i29;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i63;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i30;
import '../../shared/remote/api-service.dart' as _i43;
import '../../shared/remote/dio_api_service_impl.dart' as _i44;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i9;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i10;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage.dart'
    as _i13;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage_impl.dart'
    as _i14;
import '../../shared/services/local/Hive/profile_local_storage/profile/profile_model.dart'
    as _i23;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage.dart'
    as _i21;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage_impl.dart'
    as _i22;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage.dart'
    as _i40;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage_impl.dart'
    as _i41;
import '../../shared/services/remote/api_service/profile_service/profile_service.dart'
    as _i59;
import '../../shared/services/remote/api_service/profile_service/profile_service_impl.dart'
    as _i60;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i45;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i46;
import 'locator.dart' as _i68;

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
    gh.singleton<_i17.FirebaseAuth>(registerModule.firebaseAuth);
    gh.factory<_i18.LandingBloc>(() => _i18.LandingBloc());
    gh.factory<_i19.MembershipInformationBloc>(
        () => _i19.MembershipInformationBloc());
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
    gh.factory<_i24.QualificationsBloc>(() => _i24.QualificationsBloc());
    gh.factory<_i25.RateAndWorkTimesBloc>(() => _i25.RateAndWorkTimesBloc());
    gh.factory<_i26.RegisterAccountStep1Bloc>(
        () => _i26.RegisterAccountStep1Bloc());
    gh.factory<_i27.RegisterOTPCompleteRepository>(() =>
        _i28.RegisterOTPCompleteRepositoryImpl(
            profileLocalStorage: gh<_i21.ProfileLocalStorage>()));
    gh.factory<_i29.RegisterOTPCompleteUseCase>(() =>
        _i29.RegisterOTPCompleteUseCase(
            registerOTPCompleteEventRepository:
                gh<_i27.RegisterOTPCompleteRepository>()));
    gh.factory<_i30.ResendOTPBloc>(() => _i30.ResendOTPBloc());
    gh.factory<_i31.SetupProfileGetLocalProfileRepository>(() =>
        _i32.SetupProfileGetLocalProfileRepositoryImpl(
            profileLocalStorage: gh<_i21.ProfileLocalStorage>()));
    gh.factory<_i33.SetupProfileGetLocalProfileUseCase>(() =>
        _i33.SetupProfileGetLocalProfileUseCase(
            setupProfileGetLocalProfileRepository:
                gh<_i31.SetupProfileGetLocalProfileRepository>()));
    gh.factory<_i34.SignUpBloc>(() => _i34.SignUpBloc());
    gh.factory<_i35.SkillsAndIndustryBloc>(() => _i35.SkillsAndIndustryBloc());
    gh.factory<_i36.SubmitSignUpRepository>(
        () => _i37.SubmitSignUpRepositoryImpl());
    gh.factory<_i38.SubmitSignUpUseCase>(() => _i38.SubmitSignUpUseCase(
        submitSignUpRepository: gh<_i36.SubmitSignUpRepository>()));
    gh.factory<_i39.TermsAndConditionsBloc>(
        () => _i39.TermsAndConditionsBloc());
    gh.factory<_i40.TokenLocalStorage>(() => _i41.TokenLocalStorageImpl());
    gh.factory<_i42.TokenModel>(() => _i42.TokenModel(
          refreshToken: gh<String>(),
          accessToken: gh<String>(),
          tokenID: gh<String>(),
        ));
    gh.singleton<_i43.ApiService>(_i44.DioApiService(dio: gh<_i16.Dio>()));
    gh.singleton<_i45.Authentication>(
        _i46.PFirebaseAuthentication(firebaseAuth: gh<_i17.FirebaseAuth>()));
    gh.factory<_i47.ContinueClickedRepository>(() =>
        _i48.ContinueClickedRepositoryImpl(
            authentication: gh<_i45.Authentication>()));
    gh.factory<_i49.ContinueClickedUseCase>(() => _i49.ContinueClickedUseCase(
        continueClickedRepository: gh<_i47.ContinueClickedRepository>()));
    gh.factory<_i50.LoginContinueClickedRepository>(() =>
        _i51.LoginContinueClickedRepositoryImpl(
            authentication: gh<_i45.Authentication>()));
    gh.factory<_i52.LoginContinueClickedUseCase>(() =>
        _i52.LoginContinueClickedUseCase(
            loginContinueClickedRepository:
                gh<_i50.LoginContinueClickedRepository>()));
    gh.factory<_i53.LoginOTPCompleteEventRepository>(() =>
        _i54.LoginOTPCompleteEventRepositoryImpl(
            profileLocalStorage: gh<_i21.ProfileLocalStorage>()));
    gh.factory<_i55.LoginOTPCompleteEventUseCase>(() =>
        _i55.LoginOTPCompleteEventUseCase(
            loginOTPCompleteEventRepository:
                gh<_i53.LoginOTPCompleteEventRepository>()));
    gh.factory<_i56.OTPGetTokenRepository>(() => _i57.OTPGetTokenRepositoryImpl(
        authentication: gh<_i45.Authentication>()));
    gh.factory<_i58.OTPGetTokenUseCase>(() => _i58.OTPGetTokenUseCase(
        oTPGetTokenRepository: gh<_i56.OTPGetTokenRepository>()));
    gh.singleton<_i59.ProfileService>(_i60.ProfileServiceImpl(
      apiService: gh<_i43.ApiService>(),
      tokenLocalStorage: gh<_i40.TokenLocalStorage>(),
    ));
    gh.factory<_i61.RegisterBloc>(() => _i61.RegisterBloc(
        continueClickedUseCase: gh<_i49.ContinueClickedUseCase>()));
    gh.factory<_i62.SetupProfileBloc>(() => _i62.SetupProfileBloc(
        setupProfileGetLocalProfileUseCase:
            gh<_i33.SetupProfileGetLocalProfileUseCase>()));
    gh.factory<_i63.otpBloc>(() => _i63.otpBloc(
          registerOTPCompleteUseCase: gh<_i29.RegisterOTPCompleteUseCase>(),
          otpGetTokenUseCase: gh<_i58.OTPGetTokenUseCase>(),
        ));
    gh.factory<_i64.LoginBloc>(() => _i64.LoginBloc(
        loginContinueClickedUsecase: gh<_i52.LoginContinueClickedUseCase>()));
    gh.factory<_i65.OTPSaveRemoteProfileDataRepository>(() =>
        _i66.OTPSaveRemoteProfileDataRepositoryImpl(
            profileService: gh<_i59.ProfileService>()));
    gh.factory<_i67.OTPSaveRemoteProfileDataUseCase>(() =>
        _i67.OTPSaveRemoteProfileDataUseCase(
            oTPSaveRemoteProfileDataRepository:
                gh<_i65.OTPSaveRemoteProfileDataRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i68.RegisterModule {}
