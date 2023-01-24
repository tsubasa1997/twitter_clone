import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/user_tweet_providers.dart';
import '../utils/logger.dart';
import '../tweet/widgets/user_drawer.dart';

class MessagePage extends ConsumerStatefulWidget {
  const MessagePage({super.key, required this.uid});

  final String uid;

  @override
  ConsumerState<MessagePage> createState() => _MessagePageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _MessagePageState extends ConsumerState<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(userTweetProvider(widget.uid)).when(
          data: (user) {
            return Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: const Text(
                  'メッセージ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  icon: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 16,
                  ),
                ),
              ),
              drawer: UserDrawer(
                userId: user.id,
              ),
            );
          },
          error: (error, __) {
            logger.warning(error);
            return const Center(
              child: Text('error'),
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
  }
}
