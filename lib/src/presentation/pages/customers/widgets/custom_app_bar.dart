import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final TextEditingController controller;

  final VoidCallback changeSearching;

  final bool isSearching;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  const CustomAppBar({
    Key key,
    @required this.changeSearching,
    @required this.controller,
    @required this.isSearching,
    @required this.focusNode,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: isSearching
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: TextField(
                focusNode: focusNode,
                controller: controller,
                onChanged: onChanged,
                style: const TextStyle(
                  color: Palette.accent,
                  fontFamily: 'Lato',
                ),
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  hintText: 'search customers...',
                ),
              ),
            )
          : const Text('Customers'),
      actions: [
        IconButton(
          icon: isSearching
              ? const Icon(
                  Icons.close,
                )
              : const Icon(
                  Icons.search,
                ),
          onPressed: changeSearching,
        )
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
