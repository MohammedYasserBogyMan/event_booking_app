import 'package:event_booking_app/core/constants/cons.dart';
import 'package:event_booking_app/core/models/event_model.dart';

final List<List<EventModel>> categoryEvents = [
  [
    EventModel(
      id: "event_1", // لازم ID فريد لكل إيفنت
      title: "Local Football League",
      description: "Annual local football league match.", // أضفنا وصف
      date: DateTime(2025, 7, 15), // تحول التاريخ لـDateTime
      location: "City Stadium",
      imageUrl: kenentimage, // غيرنا image إلى imageUrl
      going: 12,
      publisherId: "user_1", // ID ناشر الإيفنت (ممكن تاخده من Firebase Auth)
      maxAttendees: 100, // اختياري، حد أقصى للحضور
    ),
    EventModel(
      id: "event_2",
      title: "Basketball Finals",
      description: "Exciting basketball finals.",
      date: DateTime(2025, 7, 20),
      location: "National Arena",
      imageUrl: kenentimage,
      going: 25,
      publisherId: "user_1",
      maxAttendees: 200,
    ),
  ],
  [
    EventModel(
      id: "event_3",
      title: "Jazz Night",
      description: "A night of smooth jazz music.",
      date: DateTime(2025, 7, 22),
      location: "Music Hall",
      imageUrl: kenentimage,
      going: 40,
      publisherId: "user_2",
      maxAttendees: 50,
    ),
    EventModel(
      id: "event_4",
      title: "Indie Band Show",
      description: "Live indie band performance.",
      date: DateTime(2025, 7, 25),
      location: "Downtown Club",
      imageUrl: kenentimage,
      going: 60,
      publisherId: "user_2",
      maxAttendees: 80,
    ),
  ],
  [
    EventModel(
      id: "event_5",
      title: "International Food Festival",
      description: "Taste cuisines from around the world.",
      date: DateTime(2025, 7, 18),
      location: "Central Park",
      imageUrl: kenentimage,
      going: 80,
      publisherId: "user_3",
      maxAttendees: 500,
    ),
    EventModel(
      id: "event_6",
      title: "Street Food Carnival",
      description: "Enjoy street food from local vendors.",
      date: DateTime(2025, 7, 19),
      location: "Main Street",
      imageUrl: kenentimage,
      going: 45,
      publisherId: "user_3",
      maxAttendees: 300,
    ),
  ],
  [
    EventModel(
      id: "event_7",
      title: "AI & ML Conference",
      description: "Learn about AI and ML advancements.",
      date: DateTime(2025, 7, 23),
      location: "Tech Center",
      imageUrl: kenentimage,
      going: 100,
      publisherId: "user_4",
      maxAttendees: 150,
    ),
    EventModel(
      id: "event_8",
      title: "Startup Pitch Event",
      description: "Pitch your startup to investors.",
      date: DateTime(2025, 7, 24),
      location: "Innovation Hub",
      imageUrl: kenentimage,
      going: 30,
      publisherId: "user_4",
      maxAttendees: 100,
    ),
  ],
  [
    EventModel(
      id: "event_9",
      title: "Modern Art Exhibition",
      description: "Explore modern art collections.",
      date: DateTime(2025, 7, 21),
      location: "City Art Gallery",
      imageUrl: kenentimage,
      going: 22,
      publisherId: "user_5",
      maxAttendees: 50,
    ),
    EventModel(
      id: "event_10",
      title: "Photography Contest",
      description: "Showcase your photography skills.",
      date: DateTime(2025, 7, 22),
      location: "Cultural Center",
      imageUrl: kenentimage,
      going: 18,
      publisherId: "user_5",
      maxAttendees: 40,
    ),
  ],
];
