import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';
import '../models/checkpoint_model.dart';

class CheckpointsListview extends StatelessWidget {
  const CheckpointsListview({
    super.key,
    required this.points
  });

  final List<CheckpointModel> points;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20),
        separatorBuilder: (context, index) => const SizedBox(height: 10,),
        itemCount: points.length,
        itemBuilder: (context, index) => _CheckpointListTile(
          index: index,
          text: points[index].name,
          onTap: () {},
          isVisited: points[index].isVisited,
        ),
      )
    );
  }
}

class _CheckpointListTile extends StatelessWidget {
  const _CheckpointListTile({
    required this.index,
    required this.text,
    required this.onTap,
    required this.isVisited
  });

  final int index;
  final String text;
  final VoidCallback onTap;
  final bool isVisited;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: context.colorTheme.greyLight,
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            isVisited ? Icons.check_box_sharp : Icons.cancel_sharp,
            color: isVisited ? Colors.green[300] : Colors.red[300],
          ),

          const SizedBox(width: 10,),

          Text(
            text,
            style: context.textTheme.smallText,
          ),

          const Spacer(),

          _CustomIconButton(
            icon: Icons.qr_code_2,
            onPressed: () {}
          ),

          const SizedBox(width: 8,),

          _CustomIconButton(
            icon: Icons.arrow_forward_ios,
            onPressed: () {}
          ),
        ],
      ),
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        color: Colors.grey[300],
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            icon
          ),
        ),
      ),
    );
  }
}