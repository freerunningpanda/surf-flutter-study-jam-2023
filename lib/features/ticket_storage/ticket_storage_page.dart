import 'package:flutter/material.dart';

import '../../res/app_colors.dart';
import '../../res/app_strings.dart';
import '../../res/app_typography.dart';
// import 'screens/empty_screen.dart';
import 'screens/tickets_screen.dart';
import 'widgets/add_button.dart';


/// Экран “Хранения билетов”.
class TicketStoragePage extends StatelessWidget {
  const TicketStoragePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appBarColor,
        title: const Text(
          AppStrings.ticketsStorage,
          style: AppTypography.text22Regular,
        ),
      ),
      body: const TicketsScreen(),
      floatingActionButton: const AddButton(),
    );
  }
}
