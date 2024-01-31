
import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/constants/default_values.dart';
import 'package:pickme/shared/widgets/w_app_bar.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


import 'bloc/scan_qr_code_bloc.dart';

@RoutePage()
class ScanQrCodePage extends BasePage {
  const ScanQrCodePage({super.key});

  @override
  _ScanQrCodePageState createState() => _ScanQrCodePageState();
}

class _ScanQrCodePageState extends BasePageState<ScanQrCodePage, ScanQrCodeBloc> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }
  @override
  Widget buildView(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocConsumer<ScanQrCodeBloc, ScanQrCodePageState>(
      listener: (context, state){},
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: (result == null)?QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ):Center(child: const Text("Scan successful!"),),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: (result != null)
                      ? PrimaryButton.fullWidth(
                      onPressed: ()=>context.router.push(ReviewAUserRoute(userId: "$result")),
                      child: const Text("Begin review!")
                  )
                      : const Text('Scan a code'),
                ),
              )
            ],
          ),
        );
      },
    );
  }


  @override
  ScanQrCodeBloc initBloc() {
    return locator<ScanQrCodeBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }
  @override
  PreferredSizeWidget buildAppbar(){
    return getAppBar(
      title: Text(getLocalization().reviewUser,),
    );
  }
  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
        setState(() {
          result = scanData;
        });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
