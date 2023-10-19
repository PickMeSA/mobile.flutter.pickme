// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pickme/core/locator/locator.dart' as _i7;
import 'package:pickme/features/landing/presentation/bloc/landing_bloc.dart'
    as _i6;
import 'package:pickme/localization/generated/l10n.dart' as _i3;
import 'package:pickme/navigation/app_route.dart' as _i4;

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
    final registerModule = _$RegisterModule(this);
    gh.factory<_i3.AppLocalizations>(() => registerModule.appLocalizations);
    gh.lazySingleton<_i4.AppRouter>(() => _i4.AppRouter());
    gh.factory<_i5.AutoRoute>(() => registerModule.autoRoute);
    gh.factory<_i6.LandingBloc>(() => _i6.LandingBloc());
    return this;
  }
}

class _$RegisterModule extends _i7.RegisterModule {
  _$RegisterModule(this._getIt);

  final _i1.GetIt _getIt;

  @override
  _i3.AppLocalizations get appLocalizations => _i3.AppLocalizations();

  @override
  _i5.AutoRoute get autoRoute => _i5.AutoRoute(
        page: _getIt<_i5.PageInfo<dynamic>>(),
        path: _getIt<String>(),
        usesPathAsKey: _getIt<bool>(),
        guards: _getIt<List<_i5.AutoRouteGuard>>(),
        fullMatch: _getIt<bool>(),
        type: _getIt<_i5.RouteType>(),
        meta: _getIt<Map<String, dynamic>>(),
        maintainState: _getIt<bool>(),
        fullscreenDialog: _getIt<bool>(),
        children: _getIt<List<_i5.AutoRoute>>(),
        title: _getIt<_i5.TitleBuilder>(),
        restorationId: _getIt<_i5.RestorationIdBuilder>(),
        keepHistory: _getIt<bool>(),
        initial: _getIt<bool>(),
        allowSnapshotting: _getIt<bool>(),
      );
}
