part of 'add_ticket_bloc.dart';

// Эвент добавления билета
class AddTicketEvent {
  final List<Ticket> ticketList;

  AddTicketEvent({
    required this.ticketList,
  });
}
