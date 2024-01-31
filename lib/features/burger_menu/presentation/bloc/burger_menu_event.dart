part of 'burger_menu_bloc.dart';
 @immutable
abstract class BurgerMenuPageEvent extends BaseEvent {}

class ToggleSelectedEvent extends BurgerMenuPageEvent{
 int selectedIndex;

 ToggleSelectedEvent({required this.selectedIndex});
}

class SetupProfileSubmitProfileTypeEvent extends BurgerMenuPageEvent{}