part of 'burger_menu_bloc.dart';
@immutable
abstract class BurgerMenuPageState extends BaseState {
  String? error;
  ProfileModel? profileModel;

  BurgerMenuPageState({this.error,this.profileModel});
}

class BurgerMenuPageInitState extends BurgerMenuPageState  {}

class ToggleSelectedState extends BurgerMenuPageState{
  ToggleSelectedState();
}


class SetupProfileSubmitProfileTypeState extends BurgerMenuPageState{
  SetupProfileSubmitProfileTypeState({ super.profileModel, super.error});}


