import 'dart:convert';

import 'package:flutter_buddies/constants/secrets.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_buddies/data/models/event.dart';

class EventRepository {
  static final EventRepository _eventRepository = EventRepository._();
  List<Event> _events = [];

  static EventRepository get() => _eventRepository;

  factory EventRepository() {
    return _eventRepository;
  }

  EventRepository._();

  Future<List<Event>> fetchAll({bool fresh = false}) async {
    if (_events.isEmpty || fresh) {
      // fetch events from calendar API
      final response = await http.get(
        Uri.parse(
            'https://www.googleapis.com/calendar/v3/calendars/gh1n5rutlqgsjpvqrba97e9atk@group.calendar.google.com/events?key=' +
                Secrets.calendar_key),
      );
      if (response.statusCode != 200) {
        // handle error
        print('ERROR ${response.statusCode}: ${response.reasonPhrase}');
      } else {
        // decode body if response status is OK
        final Map<String, dynamic> eventsJson = json.decode(response.body);
        final List<dynamic> eventItems = eventsJson['items'];
        // transform to Events
        eventItems.forEach((itemJson) {
          try {
            // some of the events are 'cancelled' and
            // don't have required attributes for parsing into Event
            _events.add(Event.fromJson(itemJson));
          } catch (e) {
            //print('ERROR (fetchAll): $e');
          }
        });
      }
    }
    return _events;
  }

  Future<List<Event>> take([int count = 4]) async {
    await fetchAll();
    return _events.take(count).toList();
  }
}

class FakeEventRepository implements EventRepository {
  final EventRepository _delegate;

  List<Event> get _events => _delegate._events;
  set _events(value) => _delegate._events = value;

  FakeEventRepository() : _delegate = EventRepository();

  Future<List<Event>> take([int count = 4]) => _delegate.take();

  @override
  Future<List<Event>> fetchAll({bool fresh = false}) async {
    int eventsNumber = 10;
    if (_events.isEmpty || _events.length != eventsNumber || fresh) {
      _events = [];
      while (eventsNumber-- > 0) {
        _events.add(Event.fake);
      }
    }
    await Future.delayed(Duration(milliseconds: 400));
    return _events;
  }
}
