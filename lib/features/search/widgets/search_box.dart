import 'package:debounce_throttle/debounce_throttle.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/application/presentation/utils/app_localizations.dart';
import 'package:movie_app/application/presentation/utils/color_constants.dart';

class SearchBox extends StatefulWidget {
  const SearchBox({
    Key? key,
    required this.onSearch,
  }) : super(key: key);

  final void Function(String) onSearch;

  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final Debouncer<String> debouncer = Debouncer<String>(
    const Duration(milliseconds: 500),
    initialValue: '',
  );

  @override
  void initState() {
    super.initState();
    debouncer.values.listen((query) {
      widget.onSearch(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        onChanged: (query) {
          debouncer.value = query;
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorConstants.grey1,
          hintText: context.l10n.label_search_show_and_movie,
          hintStyle: const TextStyle(color: ColorConstants.white1),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorConstants.grey1),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
