import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home/provider/home_providers.dart';
import '../utils/logger.dart';
import '../widget/user_drawer.dart';

class MessagePage extends ConsumerStatefulWidget {
  const MessagePage({super.key, required this.userId});

  final String userId;

  @override
  ConsumerState<MessagePage> createState() => _MessagePageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _MessagePageState extends ConsumerState<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(homeProvider(widget.userId)).when(
          data: (user) {
            final posts = user.post;
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
                    backgroundImage: const NetworkImage(
                        'https://i.pinimg.com/564x/9b/47/a0/9b47a023caf29f113237d61170f34ad9.jpg'),
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
