import 'package:riverpod/riverpod.dart';

final destinationProvider = StateProvider.autoDispose<String>((ref) {
  return 'Destination Location';
});

final pickupProvider = StateProvider.autoDispose<String>((ref) {
  return 'Pickup Location';
});

final addressProvider = StateProvider<String>((ref) {
  return 'Select Barangay';
});
