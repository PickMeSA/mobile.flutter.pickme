import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/in_app_purchases/presentation/in_app_purchase_bloc.dart';
import 'package:pickme/shared/widgets/w_error_popup.dart';
import 'package:pickme/shared/widgets/w_labeled_panel.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';

import '../../../shared/in_app_purchases/presentation/models/in_app_purchase_details.dart';
import 'bloc/final_details_bloc.dart';

@RoutePage()
class FinalDetailsPage extends BasePage {
  const FinalDetailsPage({super.key});

  @override
  State<FinalDetailsPage> createState() => _FinalDetailsPageState();
}

class _FinalDetailsPageState
    extends BasePageState<FinalDetailsPage, FinalDetailsBloc> {
  bool isSelectingProfilePicture = false;


  final TextEditingController aboutYouController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  PreferredSizeWidget? buildAppbar() => null;

  @override
  Widget buildView(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<FinalDetailsBloc, BaseState>(listener: (context, state) {
          if (state is SubmitClickedState) {
            _handleSubmitClickedState(state, context);
          }
          if (state is UpdatePurchaseDetailsState) {
            _handleUpdatePurchaseDetailsState(context, state);
          }
        }),
        BlocListener<InAppPurchasesBloc, InAppPurchaseState>(
          listener: (context, state) {
            _handleInAppPurchaseState(state, context);
          },
        ),
      ],
      child:
          BlocBuilder<FinalDetailsBloc, BaseState>(builder: (context, state) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Column(children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wText(getLocalization().step7,
                          style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 32,
                              color: theme.primaryColor)),
                      const SizedBox(
                        height: 10,
                      ),
                      wText(getLocalization().finalDetails,
                          style: const TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w400)),
                      20.height,
                      Row(
                        children: [
                          const Spacer(),
                          SizedBox(
                            height: 64,
                            width: 64,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelectingProfilePicture = true;
                                });
                                _pickFile();
                              },
                              child: Stack(
                                children: [
                                  // CircleAvatar(radius: 48,backgroundColor: Colors.white),
                                  Positioned(
                                    top: 1,
                                    left: 1,
                                    child: AppImageAvatar(
                                      image: (getBloc()
                                                  .finalDetailsEntity
                                                  .profilePicture ==
                                              null)
                                          ? null
                                          : CachedNetworkImageProvider(getBloc()
                                              .finalDetailsEntity
                                              .profilePicture!
                                              .url!),
                                    ),
                                  ),
                                  if (state is ProfilePictureAddedState &&
                                      state.dataState == DataState.loading)
                                    const Positioned(
                                        top: 0,
                                        left: 0,
                                        child: SizedBox(
                                          height: 64,
                                          width: 64,
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        )),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: CircleAvatar(
                                        radius: 9,
                                        backgroundColor: Colors.black,
                                        child: (getBloc()
                                                    .finalDetailsEntity
                                                    .profilePicture ==
                                                null)
                                            ? const Icon(Icons.add,
                                                color: Colors.black, size: 11)
                                            : const Icon(Icons.edit,
                                                color: Colors.black, size: 11),
                                      )),
                                  Positioned(
                                      bottom: 1,
                                      right: 1,
                                      child: CircleAvatar(
                                        radius: 8,
                                        backgroundColor: Colors.white,
                                        child: (getBloc()
                                                    .finalDetailsEntity
                                                    .profilePicture ==
                                                null)
                                            ? const Icon(Icons.add,
                                                color: Colors.black, size: 11)
                                            : const Icon(Icons.edit,
                                                color: Colors.black, size: 11),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      if (state is ProfilePictureAddedState &&
                          state.dataState == DataState.error)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            getBloc().uploadErrorMessage,
                            style: TextStyle(color: theme.colorScheme.error),
                          ),
                        ),
                      40.height,
                      Form(
                        key: formKey,
                        child: AppTextFormField(
                          isValidationRequired: true,
                          controller: aboutYouController,
                          keyboardType: TextInputType.multiline,
                          labelText:
                              getLocalization().aboutYouBasedOnYourProfile +
                                  "*",
                          textFieldType: TextFieldType.OTHER,
                          maxLines: 10,
                          maxLength: 2000,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return getLocalization().fieldCannotBeEmpty;
                            }
                            return null;
                          },
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelectingProfilePicture = false;
                            });
                            _pickFile();
                          },
                          child: labelledPanel(
                              labelText: getBloc().policeClearancePath == null
                                  ? getLocalization().policeClearanceOptional
                                  : getBloc().policeClearancePath!,
                              content: Container(
                                height: 96,
                                child: Center(
                                    child: Row(
                                  children: [
                                    const Spacer(),
                                    (state is PoliceClearanceAddedState &&
                                            state.dataState ==
                                                DataState.loading)
                                        ? const CircularProgressIndicator()
                                        : SvgPicture.asset(
                                            "assets/upload_icon.svg"),
                                    10.width,
                                    wText(getLocalization().upload,
                                        style: theme.textTheme.bodyMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey)),
                                    const Spacer(),
                                  ],
                                )),
                              ))),
                      if (state is PoliceClearanceAddedState &&
                          state.dataState == DataState.error)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            getBloc().uploadErrorMessage,
                            style: TextStyle(color: theme.colorScheme.error),
                          ),
                        ),
                      40.height,
                      Text(getLocalization().whatIsBeingPaid,
                          style: const TextStyle(
                            color: Colors.black45,
                          )),
                      5.height,
                      Text(
                        getLocalization().theOnceOff50RandSubscription,
                      ),
                      40.height,
                      Row(
                        children: [
                          Container(
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: InkWell(
                                onTap: () => context.router.pop(),
                                child: const Icon(Icons.arrow_back)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: PrimaryButton(
                              onPressed: () {
                                getBloc().add(SubmitClickedEvent(
                                    description: aboutYouController.text));
                              },
                              child: Text(getLocalization().payNow),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            20.height,
            Padding(
              padding: const EdgeInsets.all(10),
              child: TertiaryButton.fullWidth(
                onPressed: () {
                  BlocProvider.of<InAppPurchasesBloc>(context)
                      .add(RestoreSubscriptionEvent());
                },
                child: Text(getLocalization().restorePurchase),
              ),
            )
          ]),
        );
      }),
    );
  }

  _handleSubmitClickedState(SubmitClickedState state, BuildContext context) {
     dismissLoadingIndicator();
    switch (state.dataState) {
      case DataState.init:
        break;
      case DataState.success:
        if (!state.profileEntity!.subscriptionPaid!) {
          if (Platform.isIOS) {
            BlocProvider.of<InAppPurchasesBloc>(context)
                .add(CreateSubscriptionEvent());
          } else {
            context.router.push(PaySomeoneWebViewRoute(from: 0));
          }
        } else {
          context.router.pushAndPopUntil(BottomNavigationBarRoute(),
              predicate: (Route<dynamic> route) => false);
        }
      case DataState.loading:
      case DataState.reloading:
        addLoadingIndicator(context);
      case DataState.error:
        _onNonRecoverableError(context, state.error);
    }
  }

  _handleUpdatePurchaseDetailsState(
      BuildContext context, UpdatePurchaseDetailsState state) {
    dismissLoadingIndicator();
    switch (state.dataState) {
      case DataState.init:
        break;
      case DataState.loading:
      case DataState.reloading:
        addLoadingIndicator(context);
      case DataState.success:
        final activationDetails = state.activationResultDetails;
        if (activationDetails == null) {
          _onNonRecoverableError(context, state.error);
        } else {
          context.router.push(PaymentOutcomeRoute(
            from: 0,
            paymentSuccess: activationDetails.activated,
          ));
        }
      case DataState.error:
        _onNonRecoverableError(context, state.error);
    }
  }

  _handleInAppPurchaseState(InAppPurchaseState state, BuildContext context) {
    dismissLoadingIndicator();
    final error = state.error, product = state.product;

    switch (state.runtimeType) {
      case InAppNotFoundState:
        _onNonRecoverableError(context, error);
        break;
      case InAppRestoredState:
        if (error != null || product == null) {
          _onNonRecoverableError(context, error);
        } else {
          BlocProvider.of<InAppPurchasesBloc>(context)
              .add(SubscriptionFoundEvent(subscribedProductId: product));
        }
        break;
      case InAppPurchaseLoadingState:
        addLoadingIndicator(context);
      case InAppPurchasedState:
        if ((state as InAppPurchasedState).isPurchasedCancelled) {
          _showConfirmationDialog(context);
        }
        break;
      case InAppPurchaseActivatedState:
        if (error != null) {
          _onNonRecoverableError(context, error);
        } else if ((state as InAppPurchaseActivatedState)
            .isSubscriptionActivated) {
          context.router.push(PaymentOutcomeRoute(
            from: 0,
            paymentSuccess: true,
          ));
        } else {
          final purchaseDetails = state.purchaseDetails;
          if (purchaseDetails == null) {
            _onNonRecoverableError(context, error);
          } else {
            _showRetryDialog(context, purchaseDetails);
          }
        }
        break;
    }
  }

  _showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button to close dialog
      builder: (BuildContext context) {
        return AppDialog(
          backgroundColor: Colors.white,
          title: getLocalization().cancellationConfirmation,
          content: getLocalization().areYouSureYouWantToCancelThisPurchase,
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: SecondaryButtonDark(
                    child: Text(getLocalization().no),
                    onPressed: () {
                      BlocProvider.of<InAppPurchasesBloc>(context)
                          .add(CreateSubscriptionEvent());
                    },
                  ),
                ),
                20.width,
                Expanded(
                  child: PrimaryButtonDark(
                    child: Text(getLocalization().yes),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  _showRetryDialog(
      BuildContext context, InAppPurchaseDetails purchaseDetails) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button to close dialog
      builder: (BuildContext context) {
        return AppDialog(
          backgroundColor: Colors.white,
          title: getLocalization().activationFailed,
          content: getLocalization().activationFailedDescription,
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: SecondaryButtonDark(
                    child: Text(getLocalization().cancel),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                20.width,
                Expanded(
                  child: PrimaryButtonDark(
                    child: Text(getLocalization().retry),
                    onPressed: () {
                      Navigator.of(context).pop();
                      BlocProvider.of<InAppPurchasesBloc>(context)
                          .add(ActivatePurchaseEvent(purchaseDetails));
                    },
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  @override
  FinalDetailsBloc initBloc() {
    return locator<FinalDetailsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  Future<void> _pickFile() async {
    // File? result = await FilePicker.platform.pickFiles();
    ImagePicker imagePicker = ImagePicker();
    XFile? result = await imagePicker.pickImage(source: ImageSource.gallery);

    if (result != null) {
      getBloc().add(ProfilePictureAddedEvent(filePath: result.path));
    } else {
      // User canceled the file picker
      // Handle accordingly (e.g., show a message)
    }
  }

  // mark - Loading, Error Handling

  _onNonRecoverableError(BuildContext context, String? error) {
    wErrorPopUp(
        message: error ??
            getLocalization().anErrorOccurredWhileProcessingYourRequest,
        type: getLocalization().error,
        context: context);
  }

}
