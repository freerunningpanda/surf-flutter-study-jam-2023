import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/empty_screen.dart';

import '../../bloc/add_ticket_bloc.dart';
import '../../res/app_colors.dart';
import '../../res/app_strings.dart';
import '../../res/app_typography.dart';
import 'screens/tickets_screen.dart';
import 'widgets/add_button.dart';

/// Экран “Хранения билетов”.
class TicketStoragePage extends StatelessWidget {
  const TicketStoragePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const _AppBar(),
      body: BlocBuilder<AddTicketBloc, AddTicketState>(
        builder: (context, state) {
          if (state.ticketList.isEmpty) {
            return const EmptyScreen();
          } else {
            return const TicketsScreen();
          }
        },
      ),
      floatingActionButton: const AddButton(),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(85);

  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.appBarColor,
      title: const Text(
        AppStrings.ticketsStorage,
        style: AppTypography.text22Regular,
      ),
    );
  }
}
