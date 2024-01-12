import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'edit_my_banking_details_event.dart';
part 'edit_my_banking_details_state.dart';

@injectable
class EditMyBankingDetailsBloc
    extends BaseBloc<EditMyBankingDetailsPageEvent, EditMyBankingDetailsPageState> {
    EditMyBankingDetailsBloc(): super(EditMyBankingDetailsPageInitState()) {}
} 
