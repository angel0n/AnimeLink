import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemDetalheHeader extends StatelessWidget {
  const ItemDetalheHeader({
    super.key,
    required this.pictureMedium,
    required this.title,
    required this.rank,
    required this.status,
    required this.dateStart,
    required this.dateEnd,
    required this.startSeasonYear,
    required this.startSeason,
    required this.numEpisodes,
  });

  final String pictureMedium;
  final String title;
  final int? rank;
  final String status;
  final String? dateStart;
  final String? dateEnd;
  final int? startSeasonYear;
  final String? startSeason;
  final int? numEpisodes;

  @override
  Widget build(BuildContext context) {
    String dateStartFormat = "";
    String dateEndFormat = "";
    if(dateStart != null){
      dateStartFormat = dateStart!.isNotEmpty && DateTime.tryParse(dateStart!) != null
        ? DateFormat('dd/MM/yyyy').format(DateTime.parse(dateStart!))
        : "??/??/????";
    }
    
    if(dateStart != null) {
      dateEndFormat = dateEnd!.isNotEmpty && DateTime.tryParse(dateEnd!) != null
        ? DateFormat('dd/MM/yyyy').format(DateTime.parse(dateEnd!))
        : "??/??/????";
    }


    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: pictureMedium.isNotEmpty ? Image.network(pictureMedium) : null,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 15, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Rank",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(183, 183, 183, 1)),
                        ),
                        Text(
                          "#${rank.toString().padLeft(2, '0')}",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "status",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(183, 183, 183, 1)),
                        ),
                        Text(
                          status,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Inicio",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(183, 183, 183, 1)),
                        ),
                        Text(
                          dateStartFormat,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Termino",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(183, 183, 183, 1)),
                        ),
                        Text(
                          dateEndFormat,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Temporada",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(183, 183, 183, 1)),
                        ),
                        Text(
                          "$startSeason/$startSeasonYear",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Eps",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(183, 183, 183, 1)),
                        ),
                        Text(
                          "$numEpisodes",
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
          )
        ],
      ),
    );
  }
}
