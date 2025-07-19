import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/home/data/model/event_model.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final EventModel event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _EventImageWithOverlay(event: event),
          const SizedBox(height: 10),
          Text(
            event.title,
            style: Styels.textStyle18.copyWith(color: Colors.black),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          _GoingUsersSection(going: event.going),
          const SizedBox(height: 6),
          _LocationSection(location: event.location),
        ],
      ),
    );
  }
}

class _EventImageWithOverlay extends StatelessWidget {
  final EventModel event;

  const _EventImageWithOverlay({required this.event});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            event.image,
            height: 120,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          right: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_DateTag(date: event.date), _BookmarkIcon()],
          ),
        ),
      ],
    );
  }
}

class _DateTag extends StatelessWidget {
  final String date;

  const _DateTag({required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        date,
        style: Styels.textStyle16.copyWith(color: Color(0xffEB5757)),
      ),
    );
  }
}

class _BookmarkIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Icon(Icons.bookmark, color: Color(0xffEB5757)),
    );
  }
}

class _GoingUsersSection extends StatelessWidget {
  final int going;

  const _GoingUsersSection({required this.going});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 10,
          backgroundImage: NetworkImage("https://i.pravatar.cc/30"),
        ),
        const SizedBox(width: 4),
        const CircleAvatar(
          radius: 10,
          backgroundImage: NetworkImage("https://i.pravatar.cc/31"),
        ),
        const SizedBox(width: 4),
        const CircleAvatar(
          radius: 10,
          backgroundImage: NetworkImage("https://i.pravatar.cc/32"),
        ),
        const SizedBox(width: 6),
        Text(
          '+$going Going',
          style: Styels.textStyle14.copyWith(color: Color(0xFF3F38DD)),
        ),
      ],
    );
  }
}

class _LocationSection extends StatelessWidget {
  final String location;

  const _LocationSection({required this.location});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            location,
            style: const TextStyle(color: Colors.grey),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
