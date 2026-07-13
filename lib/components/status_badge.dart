import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String status;

  const StatusBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color borderColor;
    Color textColor;
    IconData icon;

    switch (status) {
      case "Confirmed":
        bgColor = const Color(0xFFE8FFF1);
        borderColor = const Color(0xFF86EFAC);
        textColor = const Color(0xFF16A34A);
        icon = Icons.check_circle_outline;
        break;

      case "Pending":
        bgColor = const Color(0xFFFFF8E1);
        borderColor = const Color(0xFFFACC15);
        textColor = const Color(0xFFD97706);
        icon = Icons.schedule_outlined;
        break;

      case "Cancelled":
        bgColor = const Color(0xFFFFECEC);
        borderColor = const Color(0xFFFCA5A5);
        textColor = const Color(0xFFDC2626);
        icon = Icons.cancel_outlined;
        break;

      default:
        bgColor = Colors.grey.shade100;
        borderColor = Colors.grey.shade400;
        textColor = Colors.grey;
        icon = Icons.help_outline;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: textColor,
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              status,
                  overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: textColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}