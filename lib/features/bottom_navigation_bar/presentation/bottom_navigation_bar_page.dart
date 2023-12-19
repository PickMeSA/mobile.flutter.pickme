
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ui_components/flutter_ui_components.dart';
import 'package:pickme/core/locator/locator.dart';
import 'package:pickme/features/bottom_navigation_bar/presentation/bloc/bottom_navigation_bar_bloc.dart';
import 'package:pickme/features/home/presentation/home_page.dart';
import 'package:pickme/features/jobs/applying/jobs_landing_page/presentation/jobs_landing_page.dart';
import 'package:pickme/features/my_bookings_upcoming/presentation/my_bookings_upcoming_page.dart';
import 'package:pickme/localization/generated/l10n.dart';
import 'package:pickme/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class BottomNavigationBarPage extends BasePage {
  const BottomNavigationBarPage({super.key});

  @override
  _BottomNavigationBarPageState createState() => _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends BasePageState<BottomNavigationBarPage, BottomNavigationBarBloc> {

  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

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
    return BlocConsumer<BottomNavigationBarBloc, BottomNavigationBarPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return PersistentTabView(
           context,
           controller: _controller,
           screens: _buildScreens(),
           items: _navBarsItems(theme: theme),
           confineInSafeArea: true,
           backgroundColor: Colors.white, // Default is Colors.white.
           handleAndroidBackButtonPress: true, // Default is true.
           resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
           stateManagement: true, // Default is true.
           hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
           decoration: NavBarDecoration(
             borderRadius: BorderRadius.circular(10.0),
             colorBehindNavBar: Colors.white,
           ),
           popAllScreensOnTapOfSelectedTab: true,
           popActionScreens: PopActionScreensType.all,
           itemAnimationProperties: const ItemAnimationProperties( // Navigation Bar's items animation properties.
             duration: Duration(milliseconds: 200),
             curve: Curves.ease,
           ),
           screenTransitionAnimation: const ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
             animateTabTransition: true,
             curve: Curves.ease,
             duration: Duration(milliseconds: 200),
           ),
           navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
         );
      },
    );
  }


  @override
  BottomNavigationBarBloc initBloc() {
    return locator<BottomNavigationBarBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  List<PersistentBottomNavBarItem> _navBarsItems({required ThemeData theme}) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.home),
        title: ("Home"),
        activeColorPrimary: theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.calendar),
        title: ("My bookings"),
        activeColorPrimary: theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.briefcase),
        title: ("Jobs"),
        activeColorPrimary: theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.bubble),
        title: ("Chats"),
        activeColorPrimary: theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Iconsax.profile),
        title: ("Profile"),
        activeColorPrimary: theme.primaryColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),

    ];
  }

  List<Widget> _buildScreens() {
    return [
        const HomePage(),
        const MyBookingsUpcomingPage(),
        const JobsLandingPage(),
        const HomePage(),
        const HomePage(),


    ];
  }


}
