import 'package:ev_flutter/modules/history/view/history_page.dart';
import 'package:ev_flutter/modules/home/view/home_page.dart';
import 'package:ev_flutter/modules/navigation/blocs/navigation_cubit.dart';
import 'package:ev_flutter/modules/navigation/widgets/bottom_app_bar_custom.dart';
import 'package:ev_flutter/modules/setting/view/setting_page.dart';
import 'package:ev_flutter/modules/wallet/view/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});
  static const routePath = '/navigation';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: const NavigationView(),
    );
  }
}

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  final listWidget =  [
    const HomePage(),
    const HistoryPage(),
    Container(),
    const WalletPage(),
    const SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    final selectedIndex = context.select(
          (NavigationCubit cubit) => cubit.state.indexTab,
    );
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          body: IndexedStack(
            index: selectedIndex,
            children: listWidget,
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomAppBarCustom(
              selectedIndex: selectedIndex,
              onTap: (index) {
                context.read<NavigationCubit>().changeIndex(index);
              },
            ),
          ),
        ),
        Positioned(
          bottom: 54,
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFF84B542),
              borderRadius: BorderRadius.circular(30),
            ),
            child:  const Icon(
              PhosphorIcons.scan,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),

      ],
    );
  }
}
