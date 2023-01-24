import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/ui/search/widget/search_result_card.dart';

import '../../providers/auth_user_providers.dart';
import '../../providers/searchUsers_provider.dart';
import '../../providers/user_tweet_providers.dart';
import '../utils/logger.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key, required this.uid});

  final String uid;

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchUser = ref.watch(searchUserProvider(_searchController.text));
    final uid = ref.watch(authUserProvider);

    return uid.when(
      data: (uid) {
        if (uid != null) {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: SizedBox(
                height: 45,
                width: 250,
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: '検索',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.amber,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.amber,
                        )),
                  ),
                  onChanged: (input) {
                    if (input.isNotEmpty) {
                      setState(() {
                        ref.refresh(searchUserProvider(input).future);
                      });
                    }
                  },
                ),
              ),
            ),
            body: searchUser.when(
              data: (users) {
                return ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) => UserCard(
                          userInfo: users[index],
                          uid: widget.uid,
                        ));
              },
              error: (e, _) {
                logger.warning(e);
                return const Center(
                  child: Text('error'),
                );
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          );
        } else {
          return const Text('error');
        }
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
