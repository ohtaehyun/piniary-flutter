import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:piniary/models/piniary.dart';
import 'package:piniary/services/piniary_service.dart';
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
      bottomNavigationBar: BottomAppBar(
        child: GestureDetector(
          onTap: () {
            PiniaryService.save(piniary: widget.piniary);
            Navigator.pop(context);
          },
          child: const Center(
            child: Icon(Icons.check_outlined),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(DateFormat('yyyy-MM-dd').format(widget.piniary.date)),
              Hero(
                tag: DateFormat('yyyy-MM-dd').format(widget.piniary.date),
                child: PiniSticker(pini: widget.piniary.pini),
              ),
            ],
          ),
          const TextField(
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: null,
          ),
        ],
      ),
    );
  }
}
