/*
 * This is the interface we have to implement in the actual Mixpanel class.
 * It's also testable because it has no references to dart:js. If you try to
 * run the tests importing dart:js you get the following error:
 * 
 *   "The built-in library 'dart:js' is not available on the stand-alone VM.
 *   'package:mixpanel/mixpanel.dart': error: line 10 pos 1: library handler
 *   failed import 'dart:js';"
 */

library mixpanel_api;

abstract class MixpanelAPI {

  /*
   * We're replicating the full JS API:
   * https://mixpanel.com/docs/integration-libraries/javascript-full-api
   */

  void track(String event_name, {Map properties, Function callback});
  void track_links(String css_selector, String event_name, {var properties});
  void track_forms(String css_selector, String event_name, {var properties});
  void track_pageview({String page});
  void register(Map properties);
  void register_once(Map properties, {var default_value});
  void unregister(String property_name);
  get_property(String property_name);
  void identify(String unique_id);
  void alias(String alias);
  get_distinct_id();
  void name_tag(String name);
  void set_config(Map config);
  void init(String token, {Map config, String name});
  void disable({List events});
}
