/*
 * We use dart:js to use the native JS mixpanel object.
 * 
 * See the following docs for more information:
 * https://www.dartlang.org/articles/js-dart-interop/
 */

library mixpanel;

import 'dart:js';
import 'package:mixpanel/mixpanel_api.dart';

class MixpanelError extends Error {
  String _message;
  MixpanelError(this._message);
  String toString() => 'MixpanelError: $_message';
}

class Mixpanel extends MixpanelAPI {
  JsObject _mixpanel;
  
  Mixpanel() {
    _mixpanel = context['mixpanel'];
    if (_mixpanel == null) {
      throw new MixpanelError(
          'Make sure you include the Mixpanel JS code inside the <head> and '
          '</head> tags. See the INSTALL section for more information.');
    }
  }

  @override
  void track(String event_name, {Map properties, Function callback}) {
    JsObject jsProperties =
        (properties == null ? null : new JsObject.jsify(properties));
    _mixpanel.callMethod('track', [event_name, jsProperties, callback]);
  }

  @override
  void track_links(String css_selector, String event_name, {var properties}) {
    if (properties is Map) {
      JsObject jsProperties =
          (properties == null ? null : new JsObject.jsify(properties));
      _mixpanel.callMethod('track_links', [css_selector, event_name, jsProperties]);
    } else if (properties is Function) {
      _mixpanel.callMethod('track_links', [css_selector, event_name, properties]);
    } else {
      throw new MixpanelError(
          'track_links: `properties` must be either a Map or a Function.');
    }
  }

  @override
  void track_forms(String css_selector, String event_name, {var properties}) {
    if (properties is Map) {
      JsObject jsProperties =
          (properties == null ? null : new JsObject.jsify(properties));
      _mixpanel.callMethod('track_forms', [css_selector, event_name, jsProperties]);
    } else if (properties is Function) {
      _mixpanel.callMethod('track_forms', [css_selector, event_name, properties]);
    } else {
      throw new MixpanelError(
          'track_forms: `properties` must be either a Map or a Function.');
    }
  }
  
  @override
  void track_pageview({String page}) {
    _mixpanel.callMethod('track_pageview', [page]);
  }

  @override
  void register(Map properties) {
    JsObject jsProperties =
        (properties == null ? null : new JsObject.jsify(properties));
    _mixpanel.callMethod('register', [jsProperties]);
  }

  @override
  void register_once(Map properties, {var default_value}) {
    JsObject jsProperties =
        (properties == null ? null : new JsObject.jsify(properties));
    _mixpanel.callMethod('register_once', [jsProperties, default_value]);
  }

  @override
  void unregister(String property_name) {
    _mixpanel.callMethod('unregister', [property_name]);
  }

  @override
  get_property(String property_name) {
    return _mixpanel.callMethod('get_property', [property_name]);
  }

  @override
  void identify(String unique_id) {
    _mixpanel.callMethod('identify', [unique_id]);
  }

  @override
  void alias(String alias) {
    _mixpanel.callMethod('alias', [alias]);
  }

  @override
  get_distinct_id() {
    return _mixpanel.callMethod('get_distinct_id', []);
  }

  @override
  void name_tag(String name) {
    _mixpanel.callMethod('name_tag', [name]);
  }

  @override
  void set_config(Map config) {
    JsObject jsConfig =
        (config == null ? null : new JsObject.jsify(config));
    _mixpanel.callMethod('set_config', [jsConfig]);
  }

  @override
  void init(String token, {Map config, String name}) {
    JsObject jsConfig =
        (config == null ? null : new JsObject.jsify(config));
    _mixpanel.callMethod('init', [token, jsConfig, name]);
  }

  @override
  void disable({List events}) {
    JsObject jsEvents =
        (events == null ? null : new JsObject.jsify(events));
    _mixpanel.callMethod('disable', [jsEvents]);
  }
}
