import 'package:flutter/material.dart';

import '../../../../models/models.dart';

class CustomerWidget extends StatelessWidget {
  final VoidCallback onTap;
  final Customer customer;
  const CustomerWidget({
    Key key,
    @required this.onTap,
    @required this.customer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${customer.name} ${customer.lastName}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                customer.creditAvailable
                    ? const Icon(Icons.done_sharp, color: Colors.green)
                    : const Icon(Icons.done_sharp, color: Colors.grey)
              ],
            ),
            const SizedBox(height: 8.0),
            Text('${customer.email}'),
          ],
        ),
      ),
    );
  }
}
