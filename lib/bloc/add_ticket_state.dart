part of 'add_ticket_bloc.dart';

class AddTicketState extends Equatable {
  final List<Ticket> ticketList;
  final int listLength;

  const AddTicketState({
    required this.ticketList,
    required this.listLength,
  });


  @override
  List<Object?> get props => [];


}
