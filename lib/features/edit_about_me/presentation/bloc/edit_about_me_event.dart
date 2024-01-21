part of 'edit_about_me_bloc.dart';
 @immutable
abstract class EditAboutMePageEvent extends BaseEvent {}

class SubmitClickedEvent extends EditAboutMePageEvent{
 final String description;
 SubmitClickedEvent({required this.description});
}
