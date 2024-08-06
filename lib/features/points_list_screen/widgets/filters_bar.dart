import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../../../utils/context_extensions.dart';
import '../models/filters_enum.dart';

class FiltersBar extends StatefulWidget {

  const FiltersBar({super.key, required this.currentFilter, required this.onTap});

  final Filters currentFilter;
  final void Function(int) onTap;
  
  @override
  State<FiltersBar> createState() => _FiltersBarState();
}

class _FiltersBarState extends State<FiltersBar> {
  String filterText(Filters filter){
    switch(filter){
      case Filters.all:
        return context.localize.all;

      case Filters.visited:
        return context.localize.visited;

      case Filters.unvisited:
        return context.localize.not_visited;
    }
  }

  bool isMarked(Filters filter){
    if(widget.currentFilter == filter) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) => _FilterButton(
          index: index,
          text: filterText(Filters.values[index]),
          isMarked: isMarked(Filters.values[index]),
          onTap: widget.onTap,
        ),
        itemCount: Filters.values.length,
        separatorBuilder: (context, index) => const SizedBox(width: 15,),
      )
    );
  }
}


class _FilterButton extends StatelessWidget {
  const _FilterButton({
    required this.text,
    required this.index,
    required this.isMarked,
    required this.onTap,
  });

  final String text;
  final int index;
  final bool isMarked;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => onTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        decoration: BoxDecoration(
          color: isMarked ? Colors.grey[500] : Colors.grey[400],
          borderRadius: const BorderRadius.all(Radius.circular(16))
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            text,
            style: context.textTheme.smallText,
          ),
        ),
      )
    );
  }
}