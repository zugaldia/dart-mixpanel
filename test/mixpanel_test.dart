/*
 * We use some reflection to extract info from the MixpanelAPI class to make
 * sure it has a complete stable API.
 */

library mixpanel_test;

import 'dart:mirrors';

import 'package:unittest/unittest.dart';
import 'package:mixpanel/mixpanel_api.dart';

// Shortcut
String getSimpleName(mirrorObject) =>
    MirrorSystem.getName(mirrorObject.simpleName);

main() {
  // Every group creates a fresh new instance
  ClassMirror mirror;
  Iterable<DeclarationMirror> methods;
  
  /*
   * Makes sure the class is correctly loaded
   */
  
  group('class info', () {
    setUp(() {
      mirror = reflectClass(MixpanelAPI);
      methods = mirror.declarations.values
          .where((m) => m is MethodMirror); 
    });
    
    test('name', () {
      expect('MixpanelAPI', equals(getSimpleName(mirror)));
    });
  });
  
  /*
   * Sending data to Mixpanel
   */
  
  group('send data', () {
    setUp(() {
      mirror = reflectClass(MixpanelAPI);
      methods = mirror.declarations.values
          .where((m) => m is MethodMirror); 
    });

    test('mixpanel.track', () {
      DeclarationMirror method = methods
          .where((m) => getSimpleName(m) == 'track')
          .first;
      
      // Parameters
      List<ParameterMirror> parameters = (method as MethodMirror).parameters;
      expect(parameters, hasLength(3));

      expect('event_name', getSimpleName(parameters[0]));
      expect('String', getSimpleName(parameters[0].type));
      expect(false, parameters[0].isOptional);

      expect('properties', getSimpleName(parameters[1]));
      expect('Map', getSimpleName(parameters[1].type));
      expect(true, parameters[1].isOptional);

      expect('callback', getSimpleName(parameters[2]));
      expect('Function', getSimpleName(parameters[2].type));
      expect(true, parameters[2].isOptional);
    });
    
    test('mixpanel.track_links', () {
      DeclarationMirror method = methods
          .where((m) => getSimpleName(m) == 'track_links')
          .first;
      
      // Parameters
      List<ParameterMirror> parameters = (method as MethodMirror).parameters;
      expect(parameters, hasLength(3));
      
      expect('css_selector', getSimpleName(parameters[0]));
      expect('String', getSimpleName(parameters[0].type));
      expect(false, parameters[0].isOptional);

      expect('event_name', getSimpleName(parameters[1]));
      expect('String', getSimpleName(parameters[1].type));
      expect(false, parameters[1].isOptional);

      expect('properties', getSimpleName(parameters[2]));
      expect('dynamic', getSimpleName(parameters[2].type));
      expect(true, parameters[2].isOptional);
    });
    
    test('mixpanel.track_forms', () {
      DeclarationMirror method = methods
          .where((m) => getSimpleName(m) == 'track_forms')
          .first;
      
      // Parameters
      List<ParameterMirror> parameters = (method as MethodMirror).parameters;
      expect(parameters, hasLength(3));

      expect('css_selector', getSimpleName(parameters[0]));
      expect('String', getSimpleName(parameters[0].type));
      expect(false, parameters[0].isOptional);

      expect('event_name', getSimpleName(parameters[1]));
      expect('String', getSimpleName(parameters[1].type));
      expect(false, parameters[1].isOptional);

      expect('properties', getSimpleName(parameters[2]));
      expect('dynamic', getSimpleName(parameters[2].type));
      expect(true, parameters[2].isOptional);
    });
    
    test('mixpanel.track_pageview', () {
      DeclarationMirror method = methods
          .where((m) => getSimpleName(m) == 'track_pageview')
          .first;
      
      // Parameters
      List<ParameterMirror> parameters = (method as MethodMirror).parameters;
      expect(parameters, hasLength(1));

      expect('page', getSimpleName(parameters[0]));
      expect('String', getSimpleName(parameters[0].type));
      expect(true, parameters[0].isOptional);
    });
  });
  
  /*
   * Saving data about users
   */
  
  group('users', () {
    setUp(() {
      mirror = reflectClass(MixpanelAPI);
      methods = mirror.declarations.values
          .where((m) => m is MethodMirror); 
    });
    
    test('mixpanel.register', () {
      DeclarationMirror method = methods
          .where((m) => getSimpleName(m) == 'register')
          .first;
      
      // Parameters
      List<ParameterMirror> parameters = (method as MethodMirror).parameters;
      expect(parameters, hasLength(1));

      expect('properties', getSimpleName(parameters[0]));
      expect('Map', getSimpleName(parameters[0].type));
      expect(false, parameters[0].isOptional);
    });
    
    test('mixpanel.register_once', () {
      DeclarationMirror method = methods
          .where((m) => getSimpleName(m) == 'register_once')
          .first;
      
      // Parameters
      List<ParameterMirror> parameters = (method as MethodMirror).parameters;
      expect(parameters, hasLength(2));

      expect('properties', getSimpleName(parameters[0]));
      expect('Map', getSimpleName(parameters[0].type));
      expect(false, parameters[0].isOptional);
      
      expect('default_value', getSimpleName(parameters[1]));
      expect('dynamic', getSimpleName(parameters[1].type));
      expect(true, parameters[1].isOptional);
    });
    
    test('mixpanel.unregister', () {
      DeclarationMirror method = methods
          .where((m) => getSimpleName(m) == 'unregister')
          .first;
      
      // Parameters
      List<ParameterMirror> parameters = (method as MethodMirror).parameters;
      expect(parameters, hasLength(1));

      expect('property_name', getSimpleName(parameters[0]));
      expect('String', getSimpleName(parameters[0].type));
      expect(false, parameters[0].isOptional);
    });
    
    test('mixpanel.get_property', () {
      DeclarationMirror method = methods
          .where((m) => getSimpleName(m) == 'get_property')
          .first;
      
      // Parameters
      List<ParameterMirror> parameters = (method as MethodMirror).parameters;
      expect(parameters, hasLength(1));

      expect('property_name', getSimpleName(parameters[0]));
      expect('String', getSimpleName(parameters[0].type));
      expect(false, parameters[0].isOptional);
    });
    
    test('mixpanel.identify', () {
      DeclarationMirror method = methods
          .where((m) => getSimpleName(m) == 'identify')
          .first;
      
      // Parameters
      List<ParameterMirror> parameters = (method as MethodMirror).parameters;
      expect(parameters, hasLength(1));

      expect('unique_id', getSimpleName(parameters[0]));
      expect('String', getSimpleName(parameters[0].type));
      expect(false, parameters[0].isOptional);
    });
    
    test('mixpanel.alias', () {
      DeclarationMirror method = methods
          .where((m) => getSimpleName(m) == 'alias')
          .first;
      
      // Parameters
      List<ParameterMirror> parameters = (method as MethodMirror).parameters;
      expect(parameters, hasLength(1));

      expect('alias', getSimpleName(parameters[0]));
      expect('String', getSimpleName(parameters[0].type));
      expect(false, parameters[0].isOptional);
    });
    
    test('mixpanel.get_distinct_id', () {
      DeclarationMirror method = methods
          .where((m) => getSimpleName(m) == 'get_distinct_id')
          .first;
      
      // Parameters
      List<ParameterMirror> parameters = (method as MethodMirror).parameters;
      expect(parameters, hasLength(0));
      // This method has no parameters
    });
    
    test('mixpanel.name_tag', () {
      DeclarationMirror method = methods
          .where((m) => getSimpleName(m) == 'name_tag')
          .first;
      
      // Parameters
      List<ParameterMirror> parameters = (method as MethodMirror).parameters;
      expect(parameters, hasLength(1));
      
      expect('name', getSimpleName(parameters[0]));
      expect('String', getSimpleName(parameters[0].type));
      expect(false, parameters[0].isOptional);
    });
  });
  
  /*
   * Managing tracking objects & tracking behavior
   */

  group('config', () {
    setUp(() {
      mirror = reflectClass(MixpanelAPI);
      methods = mirror.declarations.values
          .where((m) => m is MethodMirror); 
    });
    
    test('mixpanel.', () {
      DeclarationMirror method = methods
          .where((m) => getSimpleName(m) == 'set_config')
          .first;
      
      // Parameters
      List<ParameterMirror> parameters = (method as MethodMirror).parameters;
      expect(parameters, hasLength(1));

      expect('config', getSimpleName(parameters[0]));
      expect('Map', getSimpleName(parameters[0].type));
      expect(false, parameters[0].isOptional);
    });
    
    test('mixpanel.init', () {
      DeclarationMirror method = methods
          .where((m) => getSimpleName(m) == 'init')
          .first;
      
      // Parameters
      List<ParameterMirror> parameters = (method as MethodMirror).parameters;
      expect(parameters, hasLength(3));

      expect('token', getSimpleName(parameters[0]));
      expect('String', getSimpleName(parameters[0].type));
      expect(false, parameters[0].isOptional);

      expect('config', getSimpleName(parameters[1]));
      expect('Map', getSimpleName(parameters[1].type));
      expect(true, parameters[1].isOptional);

      expect('name', getSimpleName(parameters[2]));
      expect('String', getSimpleName(parameters[2].type));
      expect(true, parameters[2].isOptional);
    });
    
    test('mixpanel.disable', () {
      DeclarationMirror method = methods
          .where((m) => getSimpleName(m) == 'disable')
          .first;
      
      // Parameters
      List<ParameterMirror> parameters = (method as MethodMirror).parameters;
      expect(parameters, hasLength(1));

      expect('events', getSimpleName(parameters[0]));
      expect('List', getSimpleName(parameters[0].type));
      expect(true, parameters[0].isOptional);
    });
  });
  
}
