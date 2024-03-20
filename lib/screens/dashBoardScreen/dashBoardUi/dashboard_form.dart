import 'package:club/screens/dashBoardScreen/dashBoardCubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardForm extends StatelessWidget {
  const DashBoardForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _mainWrapperBody(context),
      bottomNavigationBar: _mainWrapperBottomNavBar(context),
    );
  }

  BottomAppBar _mainWrapperBottomNavBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bottomAppBarItem(
            context,
            defaultIcon: Icons.home_outlined,
            page: 0,
            label: "Home",
            filledIcon: Icons.home_filled,
          ),
          _bottomAppBarItem(
            context,
            defaultIcon: Icons.favorite_border,
            page: 1,
            label: "Favorite",
            filledIcon: Icons.favorite,
          ),
          _bottomAppBarItem(
            context,
            defaultIcon: Icons.settings_outlined,
            page: 2,
            label: "Setting",
            filledIcon: Icons.settings,
          ),
        ],
      ),
    );
  }

  Widget _bottomAppBarItem(
    BuildContext context, {
    required defaultIcon,
    required page,
    required label,
    required filledIcon,
  }) {
    return GestureDetector(
      onTap: () {
        context.read<DashBoardCubit>().onPageChanged(page);
        context.read<DashBoardCubit>().state.pageController.animateToPage(page,
            duration: const Duration(milliseconds: 10),
            curve: Curves.fastLinearToSlowEaseIn);
      },
      child: Container(
        height: 60,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              context.watch<DashBoardCubit>().state.currentTab == page
                  ? filledIcon
                  : defaultIcon,
              color: context.watch<DashBoardCubit>().state.currentTab == page
                  ? Colors.amber
                  : Colors.grey,
              size: 26,
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              label,
              style: TextStyle(
                color: context.watch<DashBoardCubit>().state.currentTab == page
                    ? Colors.amber
                    : Colors.grey,
                fontSize: 13,
                fontWeight:
                    context.watch<DashBoardCubit>().state.currentTab == page
                        ? FontWeight.w600
                        : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  PageView _mainWrapperBody(BuildContext context) {
    return PageView(
      onPageChanged: (int page) =>
          context.read<DashBoardCubit>().onPageChanged(page),
      controller: context.read<DashBoardCubit>().state.pageController,
      children: context.read<DashBoardCubit>().state.topLevelPages,
    );
  }
}
