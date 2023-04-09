import 'package:flutter/material.dart';

import '../../../res/app_strings.dart';
import '../../../res/app_typography.dart';


/// Экран “Пустого состояния”.
class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        AppStrings.noTickets,
        style: AppTypography.text16Regular,
      ),
    );
  }
}
