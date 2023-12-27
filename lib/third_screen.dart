import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:suit_media1/second_screen.dart';
import 'package:suit_media1/user_models.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final String baseUrl = "https://reqres.in/api/users?per_page=15";
  late List<UserModels> users;
  int page = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    users = [];
    fetchData();
  }

  Future<void> fetchData() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    final response = await http.get(
      Uri.parse('$baseUrl&page=$page&per_page=15'),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      setState(() {
        users.addAll(UserModels.userFromSnapshot(data));
        page++; // Increment page for the next request
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      throw Exception('Failed to load users');
    }
  }

  Future<void> refreshData() async {
    setState(() {
      users = [];
      page = 1;
    });
    await fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Third Screen",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: refreshData,
        child: users.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: users.length + 1,
                itemBuilder: (context, index) {
                  if (index == users.length) {
                    return _buildLoadingIndicator();
                  } else {
                    final user = users[index];
                    return ListTile(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SecondScreen(
                                selectedUsername:
                                    "${user.firstName}${user.lastName}",),
                          ),
                        );
                      },
                      title: Text('${user.firstName} ${user.lastName}'),
                      subtitle: Text(user.email),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                    );
                  }
                },
              ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
