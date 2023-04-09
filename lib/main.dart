import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/add_ticket_bloc.dart';
import 'features/ticket_storage/ticket_storage_page.dart';
import 'res/app_colors.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AddTicketBloc>(
      create: (_) => AddTicketBloc(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Async Tour',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.appBarColor,
        ),
      ),
      home: const TicketStoragePage(),
    );
  }
}
