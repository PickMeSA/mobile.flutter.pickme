import 'package:pickme/base_classes/base_bloc.dart';
import 'package:pickme/base_classes/base_event.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'scan_qr_code_event.dart';
part 'scan_qr_code_state.dart';

@injectable
class ScanQrCodeBloc
    extends BaseBloc<ApplicationSentPageEvent, ScanQrCodePageState> {
    ScanQrCodeBloc(): super(ScanQrCodePageInitState()) {}
} 
