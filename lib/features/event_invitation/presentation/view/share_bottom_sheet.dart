import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/styels.dart';
import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> shareOptions = [
      {'icon': AssetsData.shareLink, 'label': 'Copy Link'},
      {'icon': AssetsData.shareWhatsappIcon, 'label': 'WhatsApp'},
      {'icon': AssetsData.shareFacebookIcon, 'label': 'Facebook'},
      {'icon': AssetsData.shareMassengerIcon, 'label': 'Messenger'},
      {'icon': AssetsData.shareXIcon, 'label': 'Twitter'},
      {'icon': AssetsData.shareInstgramIcon, 'label': 'Instagram'},
      {'icon': AssetsData.shareSkypeIcon, 'label': 'Skype'},
      {'icon': AssetsData.shareMessageIcon, 'label': 'Message'},
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Share with friends", style: Styels.textStyle24),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 20,
            runSpacing: 20,
            children:
                shareOptions.map((option) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(option['icon'], width: 50, height: 50),
                      const SizedBox(height: 8),
                      Text(option['label']),
                    ],
                  );
                }).toList(),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: const Text("CANCEL", style: Styels.textStyle16),
            ),
          ),
        ],
      ),
    );
  }
}
