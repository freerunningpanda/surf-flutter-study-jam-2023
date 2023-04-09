part of 'add_ticket_bloc.dart';

/// Стэйт добавления билета
class AddTicketState extends Equatable {
  final List<Ticket> ticketList;
  final int listLength; // Поле длины. Нужно для перерисовки виджета, потому что блок не воспринимает изменение
  // количества элементов в списке

  const AddTicketState({
    required this.ticketList,
    required this.listLength,
  });


  @override
  List<Object?> get props => [];


}
