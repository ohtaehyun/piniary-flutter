import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:piniary/models/piniary.dart';
import 'package:piniary/widgets/app_bar.dart';
import 'package:piniary/widgets/pini_sticker.dart';

class PiniaryDetailScreen extends StatefulWidget {
  final Piniary piniary;
  const PiniaryDetailScreen({super.key, required this.piniary});

  @override
  State<PiniaryDetailScreen> createState() => _PiniaryDetailScreenState();
}

class _PiniaryDetailScreenState extends State<PiniaryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PiniaryAppBar(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(DateFormat('yyyy-MM-dd').format(widget.piniary.date)),
              PiniSticker(pini: widget.piniary.pini),
            ],
          ),
        ],
      ),
    );
  }
}
