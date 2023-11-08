import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:saddam_app/add_friends_screen.dart';
import 'package:saddam_app/models/friend_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box<FriendModel>? friendBox;
  List<FriendModel> friendsList = [];
  @override
  void initState() {
    friendBox = Hive.box<FriendModel>('friends');

    //getAllFriends();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text('Home Screen'),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddFriendsScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.amber,
      ),

      body: Container(
        height: MediaQuery.sizeOf(context).height,
        child: ValueListenableBuilder(
            valueListenable: friendBox!.listenable(),
            builder: (context, _, __) {
              friendsList = friendBox!.values.toList().cast<FriendModel>();
              return ListView.builder(
                itemCount: friendsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      tileColor: Colors.amber,
                      leading: CircleAvatar(
                        backgroundImage: MemoryImage(
                          friendsList[index].friendImage!,
                        ),
                      ),
                      title: Row(
                        children: [
                          Text(friendsList[index].name!),
                          Spacer(),
                          Text(friendsList[index].mobile!),
                        ],
                      ),
                      subtitle: Text(friendsList[index].desc!),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }

  // Future<void> getAllFriends() async {
  //   print('...................${friendsList.length}');
  // }
}
