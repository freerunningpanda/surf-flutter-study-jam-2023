import 'package:flutter/material.dart';

import '../../../data/model/ticket.dart';
import '../widgets/ticket_widget.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  List<Ticket> list = [
    Ticket(title: 'Ticket 1')
  ];

  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   children: const [
    //     SizedBox(
    //       height: 20,
    //     ),
    //     TicketWidget(title: 'Ticket 1'),
    //   ],
    // );
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) {
      final ticket = list[index];
      return TicketWidget(title: ticket.title);
    });
  }
}
