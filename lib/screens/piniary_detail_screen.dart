import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:piniary/models/piniary.dart';
import 'package:piniary/services/piniary_service.dart';
import 'package:piniary/widgets/app_bar.dart';
import 'package:piniary/widgets/pini_selector.dart';
import 'package:piniary/widgets/pini_sticker.dart';

class PiniaryDetailScreen extends StatefulWidget {
  final Piniary piniary;
  const PiniaryDetailScreen({super.key, required this.piniary});

  @override
  State<PiniaryDetailScreen> createState() => _PiniaryDetailScreenState();
}

class _PiniaryDetailScreenState extends State<PiniaryDetailScreen> {
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(
      text: widget.piniary.content,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PiniaryAppBar(),
      bottomNavigationBar: BottomAppBar(
        child: GestureDetector(
          onTap: () {
            widget.piniary.content = textController.text;
            PiniaryService.save(piniary: widget.piniary);
            Navigator.pop(context);
          },
          child: const Center(
            child: Icon(Icons.check_outlined),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 15,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(DateFormat('yyyy-MM-dd').format(widget.piniary.date)),
                Hero(
                  tag: DateFormat('yyyy-MM-dd').format(widget.piniary.date),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return PiniSelector(
                            piniary: widget.piniary,
                          );
                        },
                      ).then((pini) {
                        setState(() {
                          if (pini != null) widget.piniary.pini = pini;
                        });
                      });
                    },
                    child: PiniSticker(
                      pini: widget.piniary.pini,
                      size: 45,
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: null,
              controller: textController,
              decoration: const InputDecoration(border: InputBorder.none),
            ),
          ],
        ),
      ),
    );
  }
}
