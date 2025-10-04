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
      padding: const EdgeInsets.only(top: 34, left: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: const Text("Share with friends", style: Styels.textStyle24),
          ),
          const SizedBox(height: 23),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: 5,
            runSpacing: 22,
            children:
                shareOptions.map((option) {
                  return Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(option["icon"]),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Text(option['label'], style: Styels.textStyle17),
                      ),
                    ],
                  );
                }).toList(),
          ),
          const SizedBox(height: 34),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: const Text("CANCEL", style: Styels.textStyle16),
            ),
          ),
          const SizedBox(height: 23),
        ],
      ),
    );
  }
}
