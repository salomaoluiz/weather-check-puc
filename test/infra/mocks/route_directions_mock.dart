const routeDirectionsMocksJson = '''
{
  "formatVersion": "0.0.12",
  "routes": [
    {
      "summary": {
        "lengthInMeters": 435309,
        "travelTimeInSeconds": 18419,
        "trafficDelayInSeconds": 0,
        "trafficLengthInMeters": 0,
        "departureTime": "2024-03-18T20:52:11-03:00",
        "arrivalTime": "2024-03-19T01:59:10-03:00",
        "noTrafficTravelTimeInSeconds": 18396,
        "historicTrafficTravelTimeInSeconds": 18484,
        "liveTrafficIncidentsTravelTimeInSeconds": 18419
      },
      "guidance": {
        "instructions": [
          {
            "routeOffsetInMeters": 0,
            "travelTimeInSeconds": 0,
            "point": {
              "latitude": -23.43249,
              "longitude": -51.96783
            },
            "pointIndex": 0,
            "instructionType": "LOCATION_DEPARTURE",
            "street": "Avenida Doutor Luiz Teixeira Mendes",
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "DEPART",
            "message": "Leave from <street>Avenida Doutor Luiz Teixeira Mendes</street>"
          },
          {
            "routeOffsetInMeters": 1252,
            "travelTimeInSeconds": 139,
            "point": {
              "latitude": -23.43541,
              "longitude": -51.95677
            },
            "pointIndex": 30,
            "instructionType": "TURN",
            "street": "Rua Visconde de Nacar",
            "junctionType": "REGULAR",
            "turnAngleInDecimalDegrees": 45,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "BEAR_RIGHT",
            "message": "Bear right at <street>Rua Visconde de Nacar</street>"
          },
          {
            "routeOffsetInMeters": 2181,
            "travelTimeInSeconds": 231,
            "point": {
              "latitude": -23.43631,
              "longitude": -51.94807
            },
            "pointIndex": 44,
            "instructionType": "TURN",
            "street": "Avenida Euclídes da Cunha",
            "junctionType": "REGULAR",
            "turnAngleInDecimalDegrees": 90,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "TURN_RIGHT",
            "message": "Turn right onto <street>Avenida Euclídes da Cunha</street>"
          },
          {
            "routeOffsetInMeters": 3948,
            "travelTimeInSeconds": 425,
            "point": {
              "latitude": -23.43683,
              "longitude": -51.93388
            },
            "pointIndex": 97,
            "instructionType": "TURN",
            "street": "Avenida Pres Juscelino K Oliveira",
            "junctionType": "ROUNDABOUT",
            "turnAngleInDecimalDegrees": -90,
            "roundaboutExitNumber": 2,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "ROUNDABOUT_LEFT",
            "message": "At the roundabout take the <roundaboutExitNumber>second</roundaboutExitNumber> exit onto <street>Avenida Pres Juscelino K Oliveira</street>"
          },
          {
            "routeOffsetInMeters": 4196,
            "travelTimeInSeconds": 455,
            "point": {
              "latitude": -23.43644,
              "longitude": -51.93319
            },
            "pointIndex": 116,
            "instructionType": "TURN",
            "street": "Avenida Pres Juscelino K Oliveira",
            "junctionType": "ROUNDABOUT",
            "turnAngleInDecimalDegrees": 45,
            "roundaboutExitNumber": 0,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "TAKE_EXIT",
            "message": "Take the exit onto <street>Avenida Pres Juscelino K Oliveira</street>"
          },
          {
            "routeOffsetInMeters": 6607,
            "travelTimeInSeconds": 709,
            "point": {
              "latitude": -23.42706,
              "longitude": -51.91303
            },
            "pointIndex": 159,
            "instructionType": "TURN",
            "street": "Avenida Tuiuti",
            "junctionType": "ROUNDABOUT",
            "turnAngleInDecimalDegrees": 0,
            "roundaboutExitNumber": 2,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "ROUNDABOUT_CROSS",
            "message": "At the roundabout take the <roundaboutExitNumber>second</roundaboutExitNumber> exit onto <street>Avenida Tuiuti</street>"
          },
          {
            "routeOffsetInMeters": 6745,
            "travelTimeInSeconds": 725,
            "point": {
              "latitude": -23.42651,
              "longitude": -51.91224
            },
            "pointIndex": 172,
            "instructionType": "TURN",
            "street": "Avenida Tuiuti",
            "junctionType": "ROUNDABOUT",
            "turnAngleInDecimalDegrees": 45,
            "roundaboutExitNumber": 0,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "TAKE_EXIT",
            "message": "Take the exit onto <street>Avenida Tuiuti</street>"
          },
          {
            "routeOffsetInMeters": 7391,
            "travelTimeInSeconds": 819,
            "point": {
              "latitude": -23.42216,
              "longitude": -51.90839
            },
            "pointIndex": 191,
            "instructionType": "TURN",
            "roadNumbers": [
              "BR-376"
            ],
            "street": "Avenida Colombo",
            "junctionType": "REGULAR",
            "turnAngleInDecimalDegrees": 45,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "BEAR_RIGHT",
            "message": "Bear right at <street>Avenida Colombo</street>/<roadNumber>BR-376</roadNumber>"
          },
          {
            "routeOffsetInMeters": 9811,
            "travelTimeInSeconds": 1055,
            "point": {
              "latitude": -23.43188,
              "longitude": -51.88807
            },
            "pointIndex": 229,
            "instructionType": "TURN",
            "roadNumbers": [
              "BR-376"
            ],
            "signpostText": "Curitiba",
            "junctionType": "ROUNDABOUT",
            "turnAngleInDecimalDegrees": 0,
            "roundaboutExitNumber": 2,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "ROUNDABOUT_CROSS",
            "message": "At the roundabout take the <roundaboutExitNumber>second</roundaboutExitNumber> exit onto <roadNumber>BR-376</roadNumber> toward <signpostText>Curitiba</signpostText>"
          },
          {
            "routeOffsetInMeters": 10163,
            "travelTimeInSeconds": 1076,
            "point": {
              "latitude": -23.43342,
              "longitude": -51.88512
            },
            "pointIndex": 246,
            "instructionType": "DIRECTION_INFO",
            "roadNumbers": [
              "BR-376"
            ],
            "signpostText": "Mandaguari",
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "FOLLOW",
            "message": "Follow <roadNumber>BR-376</roadNumber> toward <signpostText>Mandaguari</signpostText>"
          },
          {
            "routeOffsetInMeters": 30827,
            "travelTimeInSeconds": 1962,
            "point": {
              "latitude": -23.50982,
              "longitude": -51.7204
            },
            "pointIndex": 531,
            "instructionType": "TURN",
            "junctionType": "BIFURCATION",
            "turnAngleInDecimalDegrees": 45,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "KEEP_RIGHT",
            "message": "Keep right"
          },
          {
            "routeOffsetInMeters": 75835,
            "travelTimeInSeconds": 3716,
            "point": {
              "latitude": -23.61046,
              "longitude": -51.39939
            },
            "pointIndex": 1307,
            "instructionType": "TURN",
            "roadNumbers": [
              "BR-376"
            ],
            "street": "Rodovia do Café",
            "junctionType": "BIFURCATION",
            "turnAngleInDecimalDegrees": -45,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "KEEP_LEFT",
            "message": "Keep left at <street>Rodovia do Café</street>/<roadNumber>BR-376</roadNumber>"
          },
          {
            "routeOffsetInMeters": 76325,
            "travelTimeInSeconds": 3734,
            "point": {
              "latitude": -23.61417,
              "longitude": -51.39706
            },
            "pointIndex": 1318,
            "instructionType": "DIRECTION_INFO",
            "roadNumbers": [
              "BR-376"
            ],
            "street": "Rodovia do Café",
            "signpostText": "Curitiba",
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "FOLLOW",
            "message": "Follow <street>Rodovia do Café</street>/<roadNumber>BR-376</roadNumber> toward <signpostText>Curitiba</signpostText>"
          },
          {
            "routeOffsetInMeters": 200919,
            "travelTimeInSeconds": 8903,
            "point": {
              "latitude": -24.38499,
              "longitude": -50.78889
            },
            "pointIndex": 3448,
            "instructionType": "DIRECTION_INFO",
            "roadNumbers": [
              "BR-376"
            ],
            "street": "Rodovia do Café",
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "FOLLOW",
            "message": "Follow <street>Rodovia do Café</street>/<roadNumber>BR-376</roadNumber>"
          },
          {
            "routeOffsetInMeters": 209767,
            "travelTimeInSeconds": 9225,
            "point": {
              "latitude": -24.45346,
              "longitude": -50.7565
            },
            "pointIndex": 3593,
            "instructionType": "TURN",
            "roadNumbers": [
              "BR-376"
            ],
            "street": "Rodovia do Café",
            "junctionType": "BIFURCATION",
            "turnAngleInDecimalDegrees": -45,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "KEEP_LEFT",
            "message": "Keep left at <street>Rodovia do Café</street>/<roadNumber>BR-376</roadNumber>"
          },
          {
            "routeOffsetInMeters": 210317,
            "travelTimeInSeconds": 9244,
            "point": {
              "latitude": -24.45754,
              "longitude": -50.75341
            },
            "pointIndex": 3601,
            "instructionType": "DIRECTION_INFO",
            "roadNumbers": [
              "BR-376"
            ],
            "street": "Rodovia do Café",
            "signpostText": "Ponta Grossa",
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "FOLLOW",
            "message": "Follow <street>Rodovia do Café</street>/<roadNumber>BR-376</roadNumber> toward <signpostText>Ponta Grossa</signpostText>"
          },
          {
            "routeOffsetInMeters": 309816,
            "travelTimeInSeconds": 12893,
            "point": {
              "latitude": -25.08125,
              "longitude": -50.19225
            },
            "pointIndex": 5003,
            "instructionType": "TURN",
            "street": "Estrada do Contorno",
            "signpostText": "Curitiba",
            "junctionType": "REGULAR",
            "turnAngleInDecimalDegrees": 45,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "TAKE_EXIT",
            "message": "Take the exit onto <street>Estrada do Contorno</street> toward <signpostText>Curitiba</signpostText>"
          },
          {
            "routeOffsetInMeters": 312124,
            "travelTimeInSeconds": 13005,
            "point": {
              "latitude": -25.09941,
              "longitude": -50.19744
            },
            "pointIndex": 5051,
            "instructionType": "TURN",
            "street": "Estrada do Contorno",
            "signpostText": "Curitiba",
            "junctionType": "BIFURCATION",
            "turnAngleInDecimalDegrees": -45,
            "possibleCombineWithNext": true,
            "drivingSide": "RIGHT",
            "maneuver": "KEEP_LEFT",
            "message": "Keep left at <street>Estrada do Contorno</street> toward <signpostText>Curitiba</signpostText>",
            "combinedMessage": "Keep left at <street>Estrada do Contorno</street> toward <signpostText>Curitiba</signpostText> then keep left at <street>Avenida Pres Kennedy BR-376</street> toward <signpostText>Curitiba</signpostText>"
          },
          {
            "routeOffsetInMeters": 312610,
            "travelTimeInSeconds": 13026,
            "point": {
              "latitude": -25.10359,
              "longitude": -50.19626
            },
            "pointIndex": 5063,
            "instructionType": "TURN",
            "street": "Avenida Pres Kennedy BR-376",
            "signpostText": "Curitiba",
            "junctionType": "BIFURCATION",
            "turnAngleInDecimalDegrees": -45,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "KEEP_LEFT",
            "message": "Keep left at <street>Avenida Pres Kennedy BR-376</street> toward <signpostText>Curitiba</signpostText>"
          },
          {
            "routeOffsetInMeters": 313055,
            "travelTimeInSeconds": 13045,
            "point": {
              "latitude": -25.10641,
              "longitude": -50.19311
            },
            "pointIndex": 5069,
            "instructionType": "DIRECTION_INFO",
            "street": "Avenida Pres Kennedy BR-376",
            "signpostText": "Curitiba",
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "FOLLOW",
            "message": "Follow <street>Avenida Pres Kennedy BR-376</street> toward <signpostText>Curitiba</signpostText>"
          },
          {
            "routeOffsetInMeters": 360031,
            "travelTimeInSeconds": 14780,
            "point": {
              "latitude": -25.34985,
              "longitude": -49.84021
            },
            "pointIndex": 5593,
            "instructionType": "DIRECTION_INFO",
            "roadNumbers": [
              "BR-376"
            ],
            "street": "Rodovia do Café",
            "signpostText": "Curitiba",
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "FOLLOW",
            "message": "Follow <street>Rodovia do Café</street>/<roadNumber>BR-376</roadNumber> toward <signpostText>Curitiba</signpostText>"
          },
          {
            "routeOffsetInMeters": 384969,
            "travelTimeInSeconds": 15697,
            "point": {
              "latitude": -25.47211,
              "longitude": -49.65825
            },
            "pointIndex": 5820,
            "instructionType": "DIRECTION_INFO",
            "roadNumbers": [
              "BR-376",
              "BR-277"
            ],
            "street": "Rodovia do Café",
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "FOLLOW",
            "message": "Follow <street>Rodovia do Café</street>/<roadNumber>BR-376</roadNumber>/<roadNumber>BR-277</roadNumber>"
          },
          {
            "routeOffsetInMeters": 394285,
            "travelTimeInSeconds": 16119,
            "point": {
              "latitude": -25.46203,
              "longitude": -49.58151
            },
            "pointIndex": 5986,
            "instructionType": "TURN",
            "junctionType": "BIFURCATION",
            "turnAngleInDecimalDegrees": -45,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "KEEP_LEFT",
            "message": "Keep left"
          },
          {
            "routeOffsetInMeters": 418619,
            "travelTimeInSeconds": 17099,
            "point": {
              "latitude": -25.43249,
              "longitude": -49.36927
            },
            "pointIndex": 6381,
            "instructionType": "TURN",
            "roadNumbers": [
              "BR-376",
              "BR-277"
            ],
            "street": "Rodovia do Café",
            "signpostText": "Curitiba",
            "junctionType": "REGULAR",
            "turnAngleInDecimalDegrees": 0,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "STRAIGHT",
            "message": "Keep straight on at <street>Rodovia do Café</street>/<roadNumber>BR-376</roadNumber>/<roadNumber>BR-277</roadNumber> toward <signpostText>Curitiba</signpostText>"
          },
          {
            "routeOffsetInMeters": 419064,
            "travelTimeInSeconds": 17118,
            "point": {
              "latitude": -25.43196,
              "longitude": -49.36489
            },
            "pointIndex": 6390,
            "instructionType": "DIRECTION_INFO",
            "roadNumbers": [
              "BR-376",
              "BR-277"
            ],
            "street": "Rodovia do Café",
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "FOLLOW",
            "message": "Follow <street>Rodovia do Café</street>/<roadNumber>BR-376</roadNumber>/<roadNumber>BR-277</roadNumber>"
          },
          {
            "routeOffsetInMeters": 424231,
            "travelTimeInSeconds": 17341,
            "point": {
              "latitude": -25.43222,
              "longitude": -49.31447
            },
            "pointIndex": 6473,
            "instructionType": "TURN",
            "street": "Rua Luiz Felippe Lopes",
            "junctionType": "BIFURCATION",
            "turnAngleInDecimalDegrees": -45,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "KEEP_LEFT",
            "message": "Keep left at <street>Rua Luiz Felippe Lopes</street>"
          },
          {
            "routeOffsetInMeters": 425932,
            "travelTimeInSeconds": 17495,
            "point": {
              "latitude": -25.44442,
              "longitude": -49.30542
            },
            "pointIndex": 6519,
            "instructionType": "TURN",
            "street": "Rua Major Heitor Guimarães",
            "junctionType": "BIFURCATION",
            "turnAngleInDecimalDegrees": 45,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "KEEP_RIGHT",
            "message": "Keep right at <street>Rua Major Heitor Guimarães</street>"
          },
          {
            "routeOffsetInMeters": 426299,
            "travelTimeInSeconds": 17533,
            "point": {
              "latitude": -25.44753,
              "longitude": -49.30478
            },
            "pointIndex": 6530,
            "instructionType": "TURN",
            "street": "Rua General Mário Tourinho",
            "junctionType": "BIFURCATION",
            "turnAngleInDecimalDegrees": -45,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "KEEP_LEFT",
            "message": "Keep left at <street>Rua General Mário Tourinho</street>"
          },
          {
            "routeOffsetInMeters": 426808,
            "travelTimeInSeconds": 17578,
            "point": {
              "latitude": -25.45209,
              "longitude": -49.30476
            },
            "pointIndex": 6547,
            "instructionType": "TURN",
            "street": "Rua Professor João Argemiro Loyola",
            "junctionType": "ROUNDABOUT",
            "turnAngleInDecimalDegrees": -90,
            "roundaboutExitNumber": 3,
            "possibleCombineWithNext": true,
            "drivingSide": "RIGHT",
            "maneuver": "ROUNDABOUT_LEFT",
            "message": "At the roundabout take the <roundaboutExitNumber>third</roundaboutExitNumber> exit onto <street>Rua Professor João Argemiro Loyola</street>",
            "combinedMessage": "At the roundabout take the <roundaboutExitNumber>third</roundaboutExitNumber> exit onto <street>Rua Professor João Argemiro Loyola</street> then keep left at <street>Avenida Silva Jardim</street>"
          },
          {
            "routeOffsetInMeters": 427466,
            "travelTimeInSeconds": 17646,
            "point": {
              "latitude": -25.45148,
              "longitude": -49.29883
            },
            "pointIndex": 6573,
            "instructionType": "TURN",
            "street": "Avenida Silva Jardim",
            "junctionType": "BIFURCATION",
            "turnAngleInDecimalDegrees": -45,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "KEEP_LEFT",
            "message": "Keep left at <street>Avenida Silva Jardim</street>"
          },
          {
            "routeOffsetInMeters": 428193,
            "travelTimeInSeconds": 17717,
            "point": {
              "latitude": -25.44901,
              "longitude": -49.29214
            },
            "pointIndex": 6591,
            "instructionType": "TURN",
            "street": "Avenida Silva Jardim",
            "junctionType": "REGULAR",
            "turnAngleInDecimalDegrees": -45,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "BEAR_LEFT",
            "message": "Bear left at <street>Avenida Silva Jardim</street>"
          },
          {
            "routeOffsetInMeters": 428945,
            "travelTimeInSeconds": 17789,
            "point": {
              "latitude": -25.44636,
              "longitude": -49.28526
            },
            "pointIndex": 6605,
            "instructionType": "TURN",
            "street": "Avenida Silva Jardim",
            "junctionType": "BIFURCATION",
            "turnAngleInDecimalDegrees": -45,
            "possibleCombineWithNext": true,
            "drivingSide": "RIGHT",
            "maneuver": "KEEP_LEFT",
            "message": "Keep left at <street>Avenida Silva Jardim</street>",
            "combinedMessage": "Keep left at <street>Avenida Silva Jardim</street> then keep left at <street>Avenida Silva Jardim</street>"
          },
          {
            "routeOffsetInMeters": 429174,
            "travelTimeInSeconds": 17817,
            "point": {
              "latitude": -25.44556,
              "longitude": -49.28316
            },
            "pointIndex": 6610,
            "instructionType": "TURN",
            "street": "Avenida Silva Jardim",
            "junctionType": "BIFURCATION",
            "turnAngleInDecimalDegrees": -45,
            "possibleCombineWithNext": true,
            "drivingSide": "RIGHT",
            "maneuver": "KEEP_LEFT",
            "message": "Keep left at <street>Avenida Silva Jardim</street>",
            "combinedMessage": "Keep left at <street>Avenida Silva Jardim</street> then keep left at <street>Avenida Silva Jardim</street>"
          },
          {
            "routeOffsetInMeters": 429682,
            "travelTimeInSeconds": 17866,
            "point": {
              "latitude": -25.44381,
              "longitude": -49.27849
            },
            "pointIndex": 6624,
            "instructionType": "TURN",
            "street": "Avenida Silva Jardim",
            "junctionType": "BIFURCATION",
            "turnAngleInDecimalDegrees": -45,
            "possibleCombineWithNext": true,
            "drivingSide": "RIGHT",
            "maneuver": "KEEP_LEFT",
            "message": "Keep left at <street>Avenida Silva Jardim</street>",
            "combinedMessage": "Keep left at <street>Avenida Silva Jardim</street> then keep left at <street>Avenida Silva Jardim</street>"
          },
          {
            "routeOffsetInMeters": 430322,
            "travelTimeInSeconds": 17947,
            "point": {
              "latitude": -25.44158,
              "longitude": -49.27263
            },
            "pointIndex": 6634,
            "instructionType": "TURN",
            "street": "Avenida Silva Jardim",
            "junctionType": "BIFURCATION",
            "turnAngleInDecimalDegrees": -45,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "KEEP_LEFT",
            "message": "Keep left at <street>Avenida Silva Jardim</street>"
          },
          {
            "routeOffsetInMeters": 431270,
            "travelTimeInSeconds": 18041,
            "point": {
              "latitude": -25.43833,
              "longitude": -49.26393
            },
            "pointIndex": 6655,
            "instructionType": "TURN",
            "street": "Avenida Silva Jardim",
            "junctionType": "BIFURCATION",
            "turnAngleInDecimalDegrees": -45,
            "possibleCombineWithNext": true,
            "drivingSide": "RIGHT",
            "maneuver": "KEEP_LEFT",
            "message": "Keep left at <street>Avenida Silva Jardim</street>",
            "combinedMessage": "Keep left at <street>Avenida Silva Jardim</street> then turn right onto <street>Viaduto Colorado</street>"
          },
          {
            "routeOffsetInMeters": 431633,
            "travelTimeInSeconds": 18088,
            "point": {
              "latitude": -25.43713,
              "longitude": -49.26058
            },
            "pointIndex": 6665,
            "instructionType": "TURN",
            "street": "Viaduto Colorado",
            "junctionType": "REGULAR",
            "turnAngleInDecimalDegrees": 90,
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "TURN_RIGHT",
            "message": "Turn right onto <street>Viaduto Colorado</street>"
          },
          {
            "routeOffsetInMeters": 434853,
            "travelTimeInSeconds": 18351,
            "point": {
              "latitude": -25.45784,
              "longitude": -49.2398
            },
            "pointIndex": 6758,
            "instructionType": "TURN",
            "street": "Rua Alcides Terezio de Carvalh",
            "junctionType": "REGULAR",
            "turnAngleInDecimalDegrees": 90,
            "possibleCombineWithNext": true,
            "drivingSide": "RIGHT",
            "maneuver": "TURN_RIGHT",
            "message": "Turn right onto <street>Rua Alcides Terezio de Carvalh</street>",
            "combinedMessage": "Turn right onto <street>Rua Alcides Terezio de Carvalh</street> then turn left onto <street>Rua Pe Oswaldo Gomes</street>"
          },
          {
            "routeOffsetInMeters": 435266,
            "travelTimeInSeconds": 18401,
            "point": {
              "latitude": -25.45986,
              "longitude": -49.24324
            },
            "pointIndex": 6764,
            "instructionType": "TURN",
            "street": "Rua Pe Oswaldo Gomes",
            "junctionType": "REGULAR",
            "turnAngleInDecimalDegrees": -90,
            "possibleCombineWithNext": true,
            "drivingSide": "RIGHT",
            "maneuver": "TURN_LEFT",
            "message": "Turn left onto <street>Rua Pe Oswaldo Gomes</street>",
            "combinedMessage": "Turn left onto <street>Rua Pe Oswaldo Gomes</street> then you have arrived at <street>Rua Pe Oswaldo Gomes</street>. Your destination is on the right"
          },
          {
            "routeOffsetInMeters": 435309,
            "travelTimeInSeconds": 18419,
            "point": {
              "latitude": -25.46019,
              "longitude": -49.24302
            },
            "pointIndex": 6765,
            "instructionType": "LOCATION_ARRIVAL",
            "street": "Rua Pe Oswaldo Gomes",
            "possibleCombineWithNext": false,
            "drivingSide": "RIGHT",
            "maneuver": "ARRIVE_RIGHT",
            "message": "You have arrived at <street>Rua Pe Oswaldo Gomes</street>. Your destination is on the right"
          }
        ]
      }
    }
  ],
  "optimizedWaypoints": []
}
''';
