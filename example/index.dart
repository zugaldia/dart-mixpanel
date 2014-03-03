import 'package:mixpanel/mixpanel.dart';

// Lazy loaded
final Mixpanel mixpanel = new Mixpanel();

main() {
  print('Sending an event to Mixpanel.');
  mixpanel.track("Hello from Dart!");
}
