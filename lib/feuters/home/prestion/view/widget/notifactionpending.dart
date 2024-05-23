import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationsScreen extends StatefulWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  const NotificationsScreen({super.key, required this.flutterLocalNotificationsPlugin});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  Future<List<PendingNotificationRequest>> _getScheduledNotifications() async {
    return await widget.flutterLocalNotificationsPlugin.pendingNotificationRequests();
  }

  void _cancelNotification(int id) async {
    await widget.flutterLocalNotificationsPlugin.cancel(id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scheduled Notifications'),
      ),
      body: FutureBuilder<List<PendingNotificationRequest>>(
        future: _getScheduledNotifications(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No scheduled notifications.'));
          } else {
            final notifications = snapshot.data!;
            return ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return ListTile(
                  title: Text('ID: ${notification.id}'),
                  subtitle: Text('Title: ${notification.title}\nBody: ${notification.body}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.check, color: Colors.green),
                    onPressed: () {
                      _cancelNotification(notification.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Notification with ID ${notification.id} cancelled'),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
