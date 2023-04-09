import 'package:flutter/material.dart';

import '../widgets/ticket_widget.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SizedBox(
          height: 20,
        ),
        TicketWidget(title: 'Ticket 1'),
      ],
    );
  }
}
