import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_state.dart';
import 'package:event_booking_app/core/controllers/follow_cubit/follow_cubit.dart';
import 'package:event_booking_app/core/models/event_model.dart';
import 'package:event_booking_app/core/utils/app_router.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/formatters.dart';
import 'package:event_booking_app/core/utils/navigation.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:event_booking_app/features/event_details/presentation/manager/publisher/cubit/publisher_cubit.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/about_section.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/event_info_tile.dart';
import 'package:event_booking_app/features/event_details/presentation/view/widget/organizer_info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class EventInfoBody extends StatefulWidget {
  const EventInfoBody({super.key, required this.eventModel});
  final EventModel eventModel;

  @override
  State<EventInfoBody> createState() => _EventInfoBodyState();
}

class _EventInfoBodyState extends State<EventInfoBody> {
  bool _isFollowing = false;

  @override
  void initState() {
    super.initState();
    _checkFollowStatus();
  }

  Future<void> _checkFollowStatus() async {
    final currentUserState = context.read<CurrentUserCubit>().state;
    if (currentUserState is CurrentUserSuccess) {
      final currentUserId = currentUserState.user.uid;
      if (widget.eventModel.publisherId.isNotEmpty) {
        context.read<FollowCubit>().checkFollowStatus(
              followerId: currentUserId,
              followingId: widget.eventModel.publisherId,
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FollowCubit, FollowState>(
      listener: (context, state) {
        if (state is FollowSuccess) {
          setState(() {
            _isFollowing = state.isFollowing;
          });
        }
      },
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        Text(widget.eventModel.title, style: Styels.textStyleRegular35),
        const SizedBox(height: 20),
        EventInfoTile(
          imageIcon: AssetsData.dateIcon,
          title: dateFormat(dateTime: widget.eventModel.date),
          subtitle:
              "${dayFormat(dateTime: widget.eventModel.date)} ${timeRange(dateTime: widget.eventModel.date)}",
        ),
        const SizedBox(height: 15),
        EventInfoTile(
          imageIcon: AssetsData.mapIcon,
          title: widget.eventModel.location,
          subtitle: widget.eventModel.subLocation,
        ),
        const SizedBox(height: 15),

        // Google Maps widget to show event location
        if (widget.eventModel.locationCoordinates != null)
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      widget.eventModel.locationCoordinates!.latitude,
                      widget.eventModel.locationCoordinates!.longitude,
                    ),
                    zoom: 14,
                  ),
                  markers: {
                    Marker(
                      markerId: const MarkerId('event_location'),
                      position: LatLng(
                        widget.eventModel.locationCoordinates!.latitude,
                        widget.eventModel.locationCoordinates!.longitude,
                      ),
                      infoWindow: InfoWindow(
                        title: widget.eventModel.title,
                        snippet: widget.eventModel.location,
                      ),
                    ),
                  },
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  scrollGesturesEnabled: false,
                  zoomGesturesEnabled: false,
                  tiltGesturesEnabled: false,
                  rotateGesturesEnabled: false,
                ),
                // Tap overlay to open in Google Maps
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        final lat = widget.eventModel.locationCoordinates!.latitude;
                        final lng = widget.eventModel.locationCoordinates!.longitude;
                        final url = Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$lng');

                        if (await canLaunchUrl(url)) {
                          await launchUrl(url, mode: LaunchMode.externalApplication);
                        }
                      },
                      child: Container(
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.open_in_new, size: 16, color: Color(0xff5669FF)),
                              SizedBox(width: 4),
                              Text(
                                'Open in Maps',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff5669FF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 30),

        BlocBuilder<PublisherCubit, PublisherState>(
          builder: (context, state) {
            if (state is PublisherLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PublisherSuccess) {
              final user = state.user;
              return GestureDetector(
                onTap: () {
                  goToBackScreen(context);
                  pushToNewScreen(
                    context,
                    locationOfNewScreen: AppRouter.kOrganizerProfile,
                    extra: user.uid,
                  );
                },
                child: OrganizerInfoCard(
                  organizerEventPhoto: user.photoUrl,
                  name: user.fullName,
                  job: "Organizer",
                  organizerId: user.uid,
                  isFollowing: _isFollowing,
                ),
              );
            } else {
              return OrganizerInfoCard(
                organizerEventPhoto: AssetsData.organizerEventPhoto,
                name: "Unknown",
                job: "Organizer",
                organizerId: '',
                isFollowing: false,
              );
            }
          },
        ),

        const SizedBox(height: 40),
        AboutSection(aboutDescription: widget.eventModel.description),
        ],
      ),
    );
  }
}
