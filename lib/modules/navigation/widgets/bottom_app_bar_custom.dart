import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class BottomAppBarCustom extends StatelessWidget {
  const BottomAppBarCustom({
    required this.selectedIndex,
    required this.onTap,
    super.key,
  });

  final int selectedIndex;
  final ValueSetter<int> onTap;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: Platform.isIOS ? 65 : 75,
      color: Colors.transparent,
      // shadowColor: AppColors.kBlackColor,
      elevation: 2,
      notchMargin: 20,
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: Platform.isIOS ? 4 : 8,
      ),
      // surfaceTintColor: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          itemNavigation(
            label: 'Home',
            index: 0,
            icon: PhosphorIcons.house,
            iconSelected: PhosphorIcons.house,
            onTap: () => onTap(0),
          ),
          itemNavigation(
            label: 'History',
            index: 1,
            icon: Icons.history,
            iconSelected: Icons.history,
            onTap: () => onTap(1),
          ),
          itemNavigation(
            label: '',
            index: 2,
          ),

          itemNavigation(
            label: 'Wallet',
            index: 3,
            icon: PhosphorIcons.wallet,
            iconSelected: PhosphorIcons.wallet,
            onTap: () => onTap(3),
          ),
          itemNavigation(
            label: 'Settings',
            index: 4,
            icon: PhosphorIcons.gear,
            iconSelected: PhosphorIcons.gear,
            onTap: () => onTap(4),
          ),
        ],
      ),
    );
  }

  Widget itemNavigation({
    required String label,
    required int index,
     IconData? icon,
     IconData? iconSelected,
     VoidCallback? onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 70,
          minHeight: 65,
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.transparent,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                index == selectedIndex
                    ? iconSelected
                    : icon,
                color: index == selectedIndex
                    ? const Color(0xFF84B542)
                    : Colors.grey,
              ),

              Text(
                label,
                style: TextStyle(
                  color: index == selectedIndex
                      ? const Color(0xFF84B542)
                      : Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
