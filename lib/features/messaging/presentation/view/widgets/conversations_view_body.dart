import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_booking_app/core/constants/app_color.dart';
import 'package:event_booking_app/core/controllers/conversations_cubit/conversations_cubit.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_cubit.dart';
import 'package:event_booking_app/core/controllers/current_user_cubit/current_user_state.dart';
import 'package:event_booking_app/core/models/conversation_model.dart';
import 'package:event_booking_app/core/repositories/user_repo/user_repo.dart';
import 'package:event_booking_app/core/utils/assets.dart';
import 'package:event_booking_app/core/utils/helpers.dart';
import 'package:event_booking_app/features/messaging/presentation/view/chat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationsViewBody extends StatelessWidget {
  const ConversationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConversationsCubit, ConversationsState>(
      builder: (context, state) {
        if (state is ConversationsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ConversationsLoaded) {
          if (state.conversations.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.message_outlined, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No messages yet',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              final currentUserState = context.read<CurrentUserCubit>().state;
              if (currentUserState is CurrentUserSuccess) {
                await context.read<ConversationsCubit>().loadConversations(
                  userId: currentUserState.user.uid,
                );
              }
            },
            child: ListView.separated(
              itemCount: state.conversations.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final conversation = state.conversations[index];
                return ConversationTile(conversation: conversation);
              },
            ),
          );
        } else if (state is ConversationsFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 80, color: Colors.red),
                const SizedBox(height: 16),
                Text(
                  state.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    final currentUserState =
                        context.read<CurrentUserCubit>().state;
                    if (currentUserState is CurrentUserSuccess) {
                      context.read<ConversationsCubit>().loadConversations(
                        userId: currentUserState.user.uid,
                      );
                    }
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}

class ConversationTile extends StatelessWidget {
  const ConversationTile({super.key, required this.conversation});

  final ConversationModel conversation;

  @override
  Widget build(BuildContext context) {
    final currentUserState = context.read<CurrentUserCubit>().state;
    if (currentUserState is! CurrentUserSuccess) {
      return const SizedBox.shrink();
    }

    final currentUserId = currentUserState.user.uid;
    final otherUserId = conversation.getOtherParticipantId(currentUserId);
    final unreadCount = conversation.getUnreadCountForUser(currentUserId);

    return FutureBuilder(
      future: context.read<UserRepo>().getUserByUid(otherUserId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const ListTile(
            leading: CircleAvatar(child: Icon(Icons.person)),
            title: Text('Loading...'),
          );
        }

        final result = snapshot.data!;
        return result.fold(
          (failure) => const ListTile(
            leading: CircleAvatar(child: Icon(Icons.error)),
            title: Text('Error loading user'),
          ),
          (otherUser) => ListTile(
            onTap: () {
              // Navigate to chat screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => ChatView(
                        otherUserId: otherUserId,
                        otherUserName: otherUser.fullName,
                        otherUserPhoto: otherUser.photoUrl,
                      ),
                ),
              );
            },
            leading: CircleAvatar(
              radius: 28,
              backgroundImage:
                  otherUser.photoUrl.isNotEmpty &&
                          (otherUser.photoUrl.startsWith('http://') ||
                              otherUser.photoUrl.startsWith('https://'))
                      ? CachedNetworkImageProvider(otherUser.photoUrl)
                      : const AssetImage(AssetsData.defaultPhotoForNewUser)
                          as ImageProvider,
            ),
            title: Text(
              otherUser.fullName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Row(
              children: [
                if (conversation.lastMessageSenderId == currentUserId)
                  const Icon(Icons.check, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    conversation.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: unreadCount > 0 ? Colors.black : Colors.grey,
                      fontWeight:
                          unreadCount > 0 ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  formatTimeAgo(conversation.lastMessageTime),
                  style: TextStyle(
                    fontSize: 12,
                    color: unreadCount > 0 ? AppColor.primary : Colors.grey,
                  ),
                ),
                if (unreadCount > 0) ...[
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      unreadCount > 9 ? '9+' : unreadCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
