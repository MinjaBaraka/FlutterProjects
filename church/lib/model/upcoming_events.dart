import 'package:equatable/equatable.dart';

class EventsUpcoming extends Equatable {
  final String dateEvents;
  final String timeEvents;
  final String agedEvents;
  final String lgHeaderInfoEvents;
  final String paragraphInfoEvents;

  const EventsUpcoming({
    required this.dateEvents,
    required this.timeEvents,
    required this.agedEvents,
    required this.lgHeaderInfoEvents,
    required this.paragraphInfoEvents,
  });

  static const List<EventsUpcoming> upcomingEvents = [
    EventsUpcoming(
      dateEvents: "06 May",
      timeEvents: "12:30 pm",
      agedEvents: "All",
      lgHeaderInfoEvents: "Bookstore Spiring open House",
      paragraphInfoEvents:
          "If your application needs to display some contents, it's quite common to separate the contents into multiple tabs.",
    ),
    EventsUpcoming(
      dateEvents: "09 May",
      timeEvents: "04:30 pm",
      agedEvents: "18-50 age",
      lgHeaderInfoEvents: "Leadership Summit 2018",
      paragraphInfoEvents:
          "In Flutter, creating such a layout can be done easily thanks to TabBar and TabBarView widgets.",
    ),
    EventsUpcoming(
      dateEvents: "10 May",
      timeEvents: "10:00 pm",
      agedEvents: "20-above",
      lgHeaderInfoEvents: "Parents Guide for great life",
      paragraphInfoEvents:
          "In Flutter, creating such a layout can be done easily thanks to TabBar and TabBarView widgets.",
    ),
  ];

  @override
  List<Object?> get props => [
        dateEvents,
        timeEvents,
        agedEvents,
        lgHeaderInfoEvents,
        paragraphInfoEvents,
      ];
}
