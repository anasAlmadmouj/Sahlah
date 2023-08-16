class Notifications{
  final String message;
  final String time;

  Notifications({required this.message,required this.time,});
}

List<Notifications> notificationsList = [
  Notifications(message: 'Your orders has been picked up', time: 'Now'),
  Notifications(message: 'Your order has been delivered', time: '1h ago'),
  Notifications(message: 'Your order has been canceled', time: '3h ago'),
  Notifications(message: 'Lorem ipsum dolor sit amet, cons adipiscing elit,', time: '1d ago'),
  Notifications(message: 'Lorem ipsum dolor sit amet, cons ,', time: '1d ago'),
];