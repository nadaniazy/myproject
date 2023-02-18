import 'package:flutter/material.dart';

class Account{
  IconData? iconData;
  String? text;
  IconData? icon;
  Account(this.iconData,this.text,this.icon);

}

List<Account> details=[
  Account(Icons.shopping_bag_outlined, "Order", Icons.arrow_forward_ios),
  Account(Icons.details_outlined, "My datails", Icons.arrow_forward_ios),
  Account(Icons.location_on_outlined, "Delivery address", Icons.arrow_forward_ios),
  Account(Icons.payment, "Payment methods", Icons.arrow_forward_ios),
  Account(Icons.card_travel, "Promo card", Icons.arrow_forward_ios),
  Account(Icons.notifications_active_outlined, "Notifications", Icons.arrow_forward_ios),
  Account(Icons.help_outline, "Help", Icons.arrow_forward_ios),
  Account(Icons.pageview_outlined, "About", Icons.arrow_forward_ios),
];