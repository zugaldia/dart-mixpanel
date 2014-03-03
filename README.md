# Mixpanel for Dart

A Dart wrapper around the Mixpanel JS API.

Note: This package is not officially provided by Mixpanel.
However it does rely on the official Mixpanel JS library.

## Install

This is a pub package. To install it, and link it into your app, add `mixpanel` to your `pubspec.yaml`. For example:

```
name: your_cool_app
dependencies:
  mixpanel: any
```

If you use the Dart Editor, the IDE will automatically download the package for you.

If you use the command line, ensure the Dart SDK is on your path, and the run: `pub install`.

## Example

Load your Mixpanel JS library in `<head>` as usual, then invoke any Mixpanel
methods from your Dart code after instantiating the Mixpanel class:

```
import 'package:mixpanel/mixpanel.dart';

// Lazy loaded
final Mixpanel mixpanel = new Mixpanel();

main() {
  // Track an event
  mixpanel.track("Hello from Dart!");
}
```

See the `example` directory for a minimal Dart program.

## API

* `void track(String event_name, {Map properties, Function callback})`
* `void track_links(String css_selector, String event_name, {var properties})`
* `void track_forms(String css_selector, String event_name, {var properties})`
* `void track_pageview({String page})`
* `void register(Map properties)`
* `void register_once(Map properties, {var default_value})`
* `void unregister(String property_name)`
* `get_property(String property_name)`
* `void identify(String unique_id)`
* `void alias(String alias)`
* `get_distinct_id()`
* `void name_tag(String name)`
* `void set_config(Map config)`
* `void init(String token, {Map config, String name})`
* `void disable({List events})`

See the [official Mixpanel JS API](https://mixpanel.com/docs/integration-libraries/javascript-full-api)
for further details on each method.

## Support

You can file issues at https://github.com/silicalabs/dart-mixpanel/issues.

## Authors

* Antonio Zugaldia <antonio@silicalabs.com>
* You?

## License

See [LICENSE](https://github.com/silicalabs/dart-mixpanel/blob/master/LICENSE)
