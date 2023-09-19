import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:linkapp/helpers/my_flutter_app_icons.dart';
import 'package:linkapp/models/link_model.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkItem extends StatefulWidget {
  final LinkModel link;

  const LinkItem({super.key, required this.link});

  @override
  State<LinkItem> createState() => _LinkItemState();
}

class _LinkItemState extends State<LinkItem> {
  FToast fToast = FToast();

  @override
  void initState() {
    super.initState();

    fToast = FToast();
    fToast.init(context);
  }

  void showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.copy, size: 16, color: Colors.black),
          SizedBox(
            width: 12.0,
          ),
          Text(
            "Link copied to clipboard!",
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 1),
    );
  }

  Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> copyToClipboard(String url) async {
    await Clipboard.setData(ClipboardData(text: url));

    showToast();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {openUrl(widget.link.link)},
      onDoubleTap: () => {copyToClipboard(widget.link.link)},
      child: Column(children: [
        Expanded(
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(10.0)),
                child: const Icon(
                  MyFlutterApp.link,
                )),
          ),
        ),
        Text(
          widget.link.name,
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w300,
              fontSize: 12),
        ),
      ]),
    );
  }
}
