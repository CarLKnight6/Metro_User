import 'package:riverpod/riverpod.dart';

final destinationProvider = StateProvider.autoDispose<String>((ref) {
  return 'Destination Location';
});

final pickupLocation = StateProvider.autoDispose<String>((ref) {
  return 'PickupLocation Location';
});
