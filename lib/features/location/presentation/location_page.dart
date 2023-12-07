
import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickme/base_classes/base_state.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pickme/navigation/app_route.dart';
import 'package:pickme/shared/features/otp/domain/entities/otp_location_entity.dart';
import 'package:pickme/shared/widgets/w_page_loader.dart';
import 'package:pickme/shared/widgets/w_progress_indicator.dart';
import 'package:pickme/shared/widgets/w_text.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'bloc/location_bloc.dart';

@RoutePage()
class LocationPage extends BasePage {
  const LocationPage({super.key});

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends BasePageState<LocationPage, LocationBloc> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BlocConsumer<LocationBloc, LocationPageState>(
      listener: (context, state){
        if(state is LocationRemoteSubmitLocationState && state.dataState == DataState.success){

            Navigator.pop(context);
            getBloc().preloaderActive = false;
            context.router.push(const FinalDetailsRoute());

        }

        if(state is LocationRemoteSubmitLocationState && state.dataState == DataState.loading){
          preloader(context);
          getBloc().preloaderActive = true;
        }

        if(state is LocationRemoteSubmitLocationState && state.dataState == DataState.error){
          print(state.error);
        }
      },
      builder: (context, state) {
        return SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child:SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  wText(getLocalization().step6,style:theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                      color: theme.primaryColor
                  )),
                  const SizedBox(height: 10,),
                  wText(getLocalization().whereAreYouLocated,
                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
                  30.height,

                     Container(
                       height: 450,
                       decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(10))) ,
                       child: PlacePicker(
                           apiKey: "AIzaSyAw_cAyNUUBuni6xQi09gNcMFc610lfob8",
                           onPlacePicked: (result) {
                     print(result);
                     getBloc().add(LocationSelectedEvent(otpLocationEntity:getLocation(result)));
                     },
                       initialPosition: const LatLng(-33.8567844, 151.213108),
                       useCurrentLocation: true,
                       resizeToAvoidBottomInset: false, // only works in page mode, less flickery, remove if wrong offsets
                     ),
                     ),
                  20.height,
                  50.height,
                  Row(
                    children: [
                      Container(
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2,
                                color: Colors.black),
                            borderRadius: const BorderRadius.all(Radius.circular(10))),
                        child: InkWell(onTap: ()=> context.router.pop(),child: const Icon(Icons.arrow_back)) ,

                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: PrimaryButton(
                          style: ButtonStyle(
                              side: MaterialStateProperty.resolveWith((Set<MaterialState> states){
                                return BorderSide(
                                  color: states.contains(MaterialState.disabled)?
                                  theme.colorScheme.secondary.withOpacity(0):
                                  theme.colorScheme.secondary,
                                  width: 2,
                                );
                              }
                              ),
                              backgroundColor: MaterialStateProperty.resolveWith(
                                      (Set<MaterialState> states){
                                    return states.contains(MaterialState.disabled)?
                                    theme.colorScheme.secondary.withOpacity(0.3):
                                    theme.colorScheme.secondary;
                                  }
                              )
                          ),
                          onPressed: !getBloc().checked?null:() {
                            getBloc().add(LocationRemoteSubmitLocationEvent());
                          },
                          child: Text(getLocalization().nextStep),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )  ,
        );
      },
    );
  }


  @override
  LocationBloc initBloc() {
    return locator<LocationBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  OTPLocationEntity getLocation(PickResult result){
    return OTPLocationEntity(id: result.placeId, latitude: result.geometry?.location.lat, longitude: result.geometry?.location.lng);
  }

}
