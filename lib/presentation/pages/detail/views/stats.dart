import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/stats.dart' as st;

class Stats extends StatelessWidget {
  const Stats(this.stats, {super.key});

  final List<st.Stats> stats;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: stats.length,
        itemBuilder: (context, index) {
          stats[index].baseStat = stats[index].baseStat!>100? stats[index].baseStat! % 101 : stats[index].baseStat;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(stats[index].stat!.name!, style: Theme.of(context).textTheme.titleMedium,),
                const SizedBox(width: 15,),
                Text("${stats[index].baseStat!}"),
                const SizedBox(width: 10,),
                Expanded(child: LinearProgressIndicator(
                    value: stats[index].baseStat!/100,
                    color: stats[index].baseStat!<=50? Colors.red : Colors.green,
                  )
                )
              ],
            ),
          );
        },
      ),
    );
  }
}