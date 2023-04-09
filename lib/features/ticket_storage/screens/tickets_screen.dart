import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/add_ticket_bloc.dart';
import '../widgets/ticket_widget.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTicketBloc, AddTicketState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.listLength,
          itemBuilder: (_, index) {
            final ticket = state.ticketList[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: TicketWidget(title: ticket.title),
            );
          },
        );
      },
    );
  }
}
