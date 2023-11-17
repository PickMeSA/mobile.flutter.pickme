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
import '../../features/add_skills/presentation/bloc/add_skills_bloc.dart'
    as _i5;
import '../../features/add_work_experience/presentation/bloc/add_work_experience_bloc.dart'
    as _i6;
import '../../features/landing/presentation/bloc/landing_bloc.dart' as _i16;
import '../../features/login/data/repository_impl/login_repository_impl/login_continue_clicked_repository_impl.dart'
    as _i47;
import '../../features/login/domain/entities/app_state/app_state_model.dart'
    as _i10;
import '../../features/login/domain/entities/biometrics/biometrics_model.dart'
    as _i13;
import '../../features/login/domain/entities/token/token_model.dart' as _i38;
import '../../features/login/domain/repository/login_repository/login_continue_clicked_repository.dart'
    as _i46;
import '../../features/login/domain/use_cases/login_usecase/login_continue_clicked_usecase.dart'
    as _i48;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i58;
import '../../features/membership_information/presentation/bloc/membership_information_bloc.dart'
    as _i17;
import '../../features/qualification/presentation/bloc/qualification_bloc.dart'
    as _i21;
import '../../features/register/data/repository_impl/continue_clicked_repository_impl.dart'
    as _i44;
import '../../features/register/domain/repository/continue_clicked_repository.dart'
    as _i43;
import '../../features/register/domain/usecase/continue_clicked_usecase.dart'
    as _i45;
import '../../features/register/presentation/bloc/register__bloc.dart' as _i55;
import '../../features/register_account_step_1/presentation/bloc/register_account_step1_bloc.dart'
    as _i22;
import '../../features/setup_profile/data/repository_impl/setup_profile_repository_impl/setup_profile_get_local_profile_repository_impl.dart'
    as _i28;
import '../../features/setup_profile/domain/repository/setup_profile_repository/setup_profile_get_local_profile_repository.dart'
    as _i27;
import '../../features/setup_profile/domain/use_cases/setup_profile_usecase/setup_profile_get_local_profile_usecase.dart'
    as _i29;
import '../../features/setup_profile/presentation/bloc/setup_profile_bloc.dart'
    as _i56;
import '../../features/sign_up/data/repository_impl/sign_up_repository_impl/submit_sign_up_repository_impl.dart'
    as _i33;
import '../../features/sign_up/domain/repository/sign_up_repository/submit_sign_up_repository.dart'
    as _i32;
import '../../features/sign_up/domain/use_cases/sign_up_usecase/submit_sign_up_usecase.dart'
    as _i34;
import '../../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i30;
import '../../features/skills_and_industry/presentation/bloc/skills_and_industry_bloc.dart'
    as _i31;
import '../../features/terms_and_conditions/presentation/bloc/terms_and_conditions_bloc.dart'
    as _i35;
import '../../localization/generated/l10n.dart' as _i7;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/login_otp_complete_event_repository_impl.dart'
    as _i50;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/otp_get_token_repository_impl.dart'
    as _i53;
import '../../shared/features/otp/data/repository_impl/otp_repository_impl/register_otp_complete_repository_impl.dart'
    as _i24;
import '../../shared/features/otp/domain/repository/otp_repository/login_otp_complete_event_repository.dart'
    as _i49;
import '../../shared/features/otp/domain/repository/otp_repository/otp_get_token_repository.dart'
    as _i52;
import '../../shared/features/otp/domain/repository/otp_repository/register_otp_complete_repository.dart'
    as _i23;
import '../../shared/features/otp/domain/use_cases/otp_usecase/login_otp_complete_event_usecase.dart'
    as _i51;
import '../../shared/features/otp/domain/use_cases/otp_usecase/otp_get_token_usecase.dart'
    as _i54;
import '../../shared/features/otp/domain/use_cases/otp_usecase/register_otp_complete_usecase.dart'
    as _i25;
import '../../shared/features/otp/presentation/bloc/otp_bloc.dart' as _i57;
import '../../shared/features/resend_otp/presentation/bloc/resend_otp_bloc.dart'
    as _i26;
import '../../shared/remote/api-service.dart' as _i39;
import '../../shared/remote/dio_api_service_impl.dart' as _i40;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage.dart'
    as _i8;
import '../../shared/services/local/Hive/app_state_local_storage/app_state_local_storage_impl.dart'
    as _i9;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage.dart'
    as _i11;
import '../../shared/services/local/Hive/biometrics_local_storage/biometrics_local_storage_impl.dart'
    as _i12;
import '../../shared/services/local/Hive/profile_local_storage/profile/profile_model.dart'
    as _i20;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage.dart'
    as _i18;
import '../../shared/services/local/Hive/profile_local_storage/profile_local_storage_impl.dart'
    as _i19;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage.dart'
    as _i36;
import '../../shared/services/local/Hive/token_local_storage/token_local_storage_impl.dart'
    as _i37;
import '../../shared/services/remote/authentication/authentication.dart'
    as _i41;
import '../../shared/services/remote/authentication/firebase_authentication.dart'
    as _i42;
import 'locator.dart' as _i59;

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
    gh.factory<_i17.MembershipInformationBloc>(
        () => _i17.MembershipInformationBloc());
    gh.factory<_i18.ProfileLocalStorage>(() => _i19.ProfileLocalStorageImpl());
    gh.factory<_i20.ProfileModel>(() => _i20.ProfileModel(
          workPermitNumber: gh<String>(),
          idNumber: gh<String>(),
          emailAddress: gh<String>(),
          phoneNumber: gh<String>(),
          surname: gh<String>(),
          firstName: gh<String>(),
          passportNumber: gh<String>(),
        ));
    gh.factory<_i21.QualificationsBloc>(() => _i21.QualificationsBloc());
    gh.factory<_i22.RegisterAccountStep1Bloc>(
        () => _i22.RegisterAccountStep1Bloc());
    gh.factory<_i23.RegisterOTPCompleteRepository>(() =>
        _i24.RegisterOTPCompleteRepositoryImpl(
            profileLocalStorage: gh<_i18.ProfileLocalStorage>()));
    gh.factory<_i25.RegisterOTPCompleteUseCase>(() =>
        _i25.RegisterOTPCompleteUseCase(
            registerOTPCompleteEventRepository:
                gh<_i23.RegisterOTPCompleteRepository>()));
    gh.factory<_i26.ResendOTPBloc>(() => _i26.ResendOTPBloc());
    gh.factory<_i27.SetupProfileGetLocalProfileRepository>(() =>
        _i28.SetupProfileGetLocalProfileRepositoryImpl(
            profileLocalStorage: gh<_i18.ProfileLocalStorage>()));
    gh.factory<_i29.SetupProfileGetLocalProfileUseCase>(() =>
        _i29.SetupProfileGetLocalProfileUseCase(
            setupProfileGetLocalProfileRepository:
                gh<_i27.SetupProfileGetLocalProfileRepository>()));
    gh.factory<_i30.SignUpBloc>(() => _i30.SignUpBloc());
    gh.factory<_i31.SkillsAndIndustryBloc>(() => _i31.SkillsAndIndustryBloc());
    gh.factory<_i32.SubmitSignUpRepository>(
        () => _i33.SubmitSignUpRepositoryImpl());
    gh.factory<_i34.SubmitSignUpUseCase>(() => _i34.SubmitSignUpUseCase(
        submitSignUpRepository: gh<_i32.SubmitSignUpRepository>()));
    gh.factory<_i35.TermsAndConditionsBloc>(
        () => _i35.TermsAndConditionsBloc());
    gh.factory<_i36.TokenLocalStorage>(() => _i37.TokenLocalStorageImpl());
    gh.factory<_i38.TokenModel>(() => _i38.TokenModel(
          refreshToken: gh<String>(),
          accessToken: gh<String>(),
          tokenID: gh<String>(),
        ));
    gh.singleton<_i39.ApiService>(_i40.DioApiService(dio: gh<_i14.Dio>()));
    gh.singleton<_i41.Authentication>(
        _i42.PFirebaseAuthentication(firebaseAuth: gh<_i15.FirebaseAuth>()));
    gh.factory<_i43.ContinueClickedRepository>(() =>
        _i44.ContinueClickedRepositoryImpl(
            authentication: gh<_i41.Authentication>()));
    gh.factory<_i45.ContinueClickedUseCase>(() => _i45.ContinueClickedUseCase(
        continueClickedRepository: gh<_i43.ContinueClickedRepository>()));
    gh.factory<_i46.LoginContinueClickedRepository>(() =>
        _i47.LoginContinueClickedRepositoryImpl(
            authentication: gh<_i41.Authentication>()));
    gh.factory<_i48.LoginContinueClickedUseCase>(() =>
        _i48.LoginContinueClickedUseCase(
            loginContinueClickedRepository:
                gh<_i46.LoginContinueClickedRepository>()));
    gh.factory<_i49.LoginOTPCompleteEventRepository>(() =>
        _i50.LoginOTPCompleteEventRepositoryImpl(
            profileLocalStorage: gh<_i18.ProfileLocalStorage>()));
    gh.factory<_i51.LoginOTPCompleteEventUseCase>(() =>
        _i51.LoginOTPCompleteEventUseCase(
            loginOTPCompleteEventRepository:
                gh<_i49.LoginOTPCompleteEventRepository>()));
    gh.factory<_i52.OTPGetTokenRepository>(() => _i53.OTPGetTokenRepositoryImpl(
        authentication: gh<_i41.Authentication>()));
    gh.factory<_i54.OTPGetTokenUseCase>(() => _i54.OTPGetTokenUseCase(
        oTPGetTokenRepository: gh<_i52.OTPGetTokenRepository>()));
    gh.factory<_i55.RegisterBloc>(() => _i55.RegisterBloc(
        continueClickedUseCase: gh<_i45.ContinueClickedUseCase>()));
    gh.factory<_i56.SetupProfileBloc>(() => _i56.SetupProfileBloc(
        setupProfileGetLocalProfileUseCase:
            gh<_i29.SetupProfileGetLocalProfileUseCase>()));
    gh.factory<_i57.otpBloc>(() => _i57.otpBloc(
          registerOTPCompleteUseCase: gh<_i25.RegisterOTPCompleteUseCase>(),
          otpGetTokenUseCase: gh<_i54.OTPGetTokenUseCase>(),
        ));
    gh.factory<_i58.LoginBloc>(() => _i58.LoginBloc(
        loginContinueClickedUsecase: gh<_i48.LoginContinueClickedUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i59.RegisterModule {}
