import 'dart:async';
import 'package:ah/core/styel.dart';
import 'package:ah/feuters/home/prestion/view/widget/colockview.dart';
import 'package:ah/feuters/home/prestion/view/widget/textcolok.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  late DateTime dateTime;
  late Timer timer;
  bool isCancelled = true; // قم بتغيير القيمة إلى true لإلغاء التحديث كل ثانية
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  int initialNotificationCount = 0; // Track the initial number of notifications
  int canceledNotificationsCount = 0; // Track the number of canceled notifications

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    _loadInitialNotifications();
    _loadCanceledCount();
    if (!isCancelled) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (mounted) {
          setState(() {
            dateTime = DateTime.now();
          });
        }
      });
    }
  }

  void _loadInitialNotifications() async {
    final notifications = await _getScheduledNotifications();
    setState(() {
      initialNotificationCount = notifications.length;
    });
  }

  void _loadCanceledCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      canceledNotificationsCount = prefs.getInt('canceledNotificationsCount') ?? 0;
    });
  }

  void _saveCanceledCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('canceledNotificationsCount', canceledNotificationsCount);
  }

  @override
  void dispose() {
    if (!isCancelled) {
      timer.cancel();
    }
    super.dispose();
  }

  Future<List<PendingNotificationRequest>> _getScheduledNotifications() async {
    return await flutterLocalNotificationsPlugin.pendingNotificationRequests();
  }

  void _cancelNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
    setState(() {
      canceledNotificationsCount++;
      if (canceledNotificationsCount >= initialNotificationCount) {
        canceledNotificationsCount = 0; // Reset the count
      }
      _saveCanceledCount(); // Save the updated count
      // Update state to refresh UI and recalculate progress
    });
  }

  double _calculateProgress() {
    if (initialNotificationCount == 0) return 0.0;
    return canceledNotificationsCount / initialNotificationCount;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: LinearProgressIndicator(
            minHeight: 9,
            value: _calculateProgress(),
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 35,
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const colockview(),
                textcolock(dateTime: dateTime),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "ادويه اليوم",
                  style: AppStyles.stylesemi20(context).copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 23,
                  ),
                )
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: FutureBuilder<List<PendingNotificationRequest>>(
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
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xff2B99F0)),
                        ),
                        child: ListTile(
                          title: Text(
                            'رقم : ${notification.id}',
                            style: AppStyles.stylebold15(context),
                          ),
                          subtitle: Text(
                            'العنوان: ${notification.title}\nتفاصيل: ${notification.body}',
                            style: AppStyles.stylebold15(context),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.check, color: Colors.green),
                            onPressed: () {
                              _cancelNotification(notification.id);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('التنبيه رقم ${notification.id} اتلغي اليوم'),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
