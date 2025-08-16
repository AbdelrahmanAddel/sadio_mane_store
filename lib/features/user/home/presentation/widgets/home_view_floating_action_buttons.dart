import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

class HomeViewFloatingActionButton extends StatefulWidget {
  const HomeViewFloatingActionButton({
    required this.scrollController,
    super.key,
  });
  final ScrollController scrollController;

  @override
  State<HomeViewFloatingActionButton> createState() =>
      _HomeViewFloatingActionButtonState();
}

class _HomeViewFloatingActionButtonState
    extends State<HomeViewFloatingActionButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomEnd,
      child: _buildHomeViewFloatingActionButton(context),
    );
  }

  Widget _buildHomeViewFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: context.theme.appColors.bluePinkLight,
      onPressed: () {
        widget.scrollController.animateTo(
          0,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      },
      child: const Icon(Icons.arrow_upward_rounded, size: 35),
    );
  }
}
