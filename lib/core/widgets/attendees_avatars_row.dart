import 'dart:math';
import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/models/user_model.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/attendes_avatar.dart';
import 'package:flutter/material.dart';

/// Widget موحد لعرض صور الحضور بشكل عشوائي
/// يعرض حتى 3 مستخدمين بشكل عشوائي من قائمة الحضور
/// لا يظهر الصور إذا لم يكن هناك حضور
class AttendeesAvatarsRow extends StatefulWidget {
  final EventModel event;
  final UserRepo userRepo;
  final double avatarRadius;
  final double spacing;
  final bool showGoingText;
  final TextStyle? textStyle;

  const AttendeesAvatarsRow({
    super.key,
    required this.event,
    required this.userRepo,
    this.avatarRadius = 15,
    this.spacing = 4,
    this.showGoingText = true,
    this.textStyle,
  });

  @override
  State<AttendeesAvatarsRow> createState() => _AttendeesAvatarsRowState();
}

class _AttendeesAvatarsRowState extends State<AttendeesAvatarsRow> {
  List<String> _randomAttendeeIds = [];

  @override
  void initState() {
    super.initState();
    _selectRandomAttendees();
  }

  @override
  void didUpdateWidget(AttendeesAvatarsRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    // إعادة اختيار عشوائي إذا تغيرت قائمة الحضور
    if (oldWidget.event.attendeeIds != widget.event.attendeeIds) {
      _selectRandomAttendees();
    }
  }

  /// اختيار 3 مستخدمين بشكل عشوائي من قائمة الحضور
  void _selectRandomAttendees() {
    if (widget.event.attendeeIds.isEmpty) {
      _randomAttendeeIds = [];
      return;
    }

    final random = Random();
    final attendeeIds = List<String>.from(widget.event.attendeeIds);
    final count = min(3, attendeeIds.length);

    // خلط القائمة واختيار أول count عناصر
    attendeeIds.shuffle(random);
    _randomAttendeeIds = attendeeIds.take(count).toList();
  }

  @override
  Widget build(BuildContext context) {
    // إذا لم يكن هناك حضور، لا تعرض شيء
    if (widget.event.attendeeIds.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        // عرض الـ avatars
        ..._randomAttendeeIds.map((userId) {
          return Padding(
            padding: EdgeInsets.only(right: widget.spacing),
            child: FutureBuilder<UserModel?>(
              future: _getUser(userId),
              builder: (context, snapshot) {
                return SizedBox(
                  width: widget.avatarRadius * 2,
                  height: widget.avatarRadius * 2,
                  child: AttendesAvatar(
                    user: snapshot.data,
                    isPlaceholder: !snapshot.hasData,
                  ),
                );
              },
            ),
          );
        }),

        // النص إذا كان مطلوب
        if (widget.showGoingText) ...[
          SizedBox(width: widget.spacing * 2),
          Flexible(
            child: Text(
              '+${widget.event.attendeeCount} Going',
              style: widget.textStyle ??
                  Styels.textStyleMedium12.copyWith(
                    color: AppColor.actionTextColor,
                  ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
    );
  }

  Future<UserModel?> _getUser(String userId) async {
    final result = await widget.userRepo.getUserByUid(userId);
    return result.fold(
      (failure) => null,
      (user) => user,
    );
  }
}
