
import 'dart:async';
import 'package:bloc_concept/data/models/Guest.dart';
import 'package:bloc_concept/data/repository/GuestRepository.dart';

class GuestBloc {
  var guest = Guest();
  StreamController<List<Guest>> _controller = StreamController<List<Guest>>.broadcast();
  Function(List<Guest>) get push => _controller.sink.add;
  Stream<List<Guest>> get stream => _controller.stream;
  GuestBloc();

  getData() async{
    var guests = await queryGuests();
    push(guests);
  }

  void dispose() {
    _controller.close();
  }
}
GuestBloc guestBloc = GuestBloc();

