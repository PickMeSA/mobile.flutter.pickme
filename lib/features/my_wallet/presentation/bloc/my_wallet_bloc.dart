import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'my_wallet_event.dart';
part 'my_wallet_state.dart';

@injectable
class MyWalletBloc
    extends BaseBloc<MyWalletPageEvent, MyWalletPageState> {
    MyWalletBloc(): super(MyWalletPageInitState()) {}
} 
