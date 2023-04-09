import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/ticket.dart';
import '../data/storage/tickets.dart';

part 'add_ticket_event.dart';
part 'add_ticket_state.dart';

class AddTicketBloc extends Bloc<AddTicketEvent, AddTicketState> {
  AddTicketBloc() : super(AddTicketState(listLength: 0, ticketList: Storage.list)) {
    on<AddTicketEvent>((event, emit) {
      emit(
        AddTicketState(listLength: event.ticketList.length, ticketList: event.ticketList),
      );
    });
  }
}
