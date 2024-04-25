import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:piniary/models/pini.dart';
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
  late final TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: widget.piniary.content);
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
      body: Column(
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
                        return Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    Pini.app.path,
                                    width: 100,
                                  ),
                                  Image.asset(
                                    Pini.happy.path,
                                    width: 100,
                                  ),
                                ],
                              ),
                              const Row(),
                              const Row(),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: PiniSticker(pini: widget.piniary.pini),
                ),
              ),
            ],
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: null,
            controller: textController,
          ),
        ],
      ),
    );
  }
}
