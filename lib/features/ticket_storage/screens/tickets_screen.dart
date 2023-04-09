import 'package:flutter/material.dart';

import '../../../data/storage/tickets.dart';
import '../widgets/ticket_widget.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  State<TicketsScreen> createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  final list = Storage.list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, index) {
          final ticket = list[index];
          return TicketWidget(title: ticket.title);
        });
  }
}
