import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart';

import 'package:sola/common/matrix_locals.dart';

class StateMessage extends StatelessWidget {
  final Event event;

  const StateMessage(this.event, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 7,
        bottom: 6,
      ),
      alignment: Alignment.center,
      child: FutureBuilder<String>(
          future: event.calcLocalizedBody(MatrixLocals(L10n.of(context)!)),
          builder: (context, snapshot) {
            return Text(
              snapshot.data ??
                  event.calcLocalizedBodyFallback(
                    MatrixLocals(L10n.of(context)!),
                  ),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                height: 15 / 10,
                color: Color(0xFF7B7B7B),
              ),
            );
          }),
    );
  }
}
