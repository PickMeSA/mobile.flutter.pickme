import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/shared/features/otp/domain/entities/profile_entity.dart';
import 'dart:async';

import 'base_event.dart';
import 'base_state.dart';


abstract class BaseBloc<T extends BaseEvent, S extends BaseState> extends Bloc<T,S>{
  final _stateController = StreamController<BaseBlocPrimaryState>();
  ProfileEntity? profileEntity = ProfileEntity();

  BaseBloc(S initialState,{this.profileEntity}) : super(initialState);

  Stream<BaseBlocPrimaryState>? get baseState => _stateController.stream;

  Sink<BaseBlocPrimaryState>? get sinkState{
    if (_stateController.isClosed)
      return null;
    return _stateController.sink;
  }

  @mustCallSuper
  dispose(){
      _stateController.close();
  }

}