
import 'dart:async';
import 'package:bloc_concept/data/models/Address.dart';
import 'package:bloc_concept/data/repository/AddressRepository.dart';
export 'package:bloc_concept/data/repository/AddressRepository.dart';
class AddressBloc {
  var guest = Address();
  StreamController<List<Address>> _controller = StreamController<List<Address>>.broadcast();
  Function(List<Address>) get push => _controller.sink.add;
  Stream<List<Address>> get stream => _controller.stream;
  AddressBloc();

  getData() async{
    var addresses = await queryAddresses();
    push(addresses);
  }

  void dispose() {
    _controller.close();
  }
}
AddressBloc addressBloc = AddressBloc();

