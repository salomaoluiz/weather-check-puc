const searchAddressMock = '''
{
  "summary": {
    "query": "maringá paraná brasil",
    "queryType": "NON_NEAR",
    "queryTime": 88,
    "numResults": 10,
    "offset": 0,
    "totalResults": 133,
    "fuzzyLevel": 1
  },
  "results": [
    {
      "type": "Geography",
      "id": "XNKRsMQ1-eQYeQlULsg9RA",
      "score": 6.4274897575,
      "entityType": "Municipality",
      "matchConfidence": {
        "score": 1
      },
      "address": {
        "municipality": "Maringá",
        "countrySubdivision": "Paraná",
        "countrySubdivisionName": "Paraná",
        "countrySubdivisionCode": "PR",
        "countryCode": "BR",
        "country": "Brazil",
        "countryCodeISO3": "BRA",
        "freeformAddress": "Maringá"
      },
      "position": {
        "lat": -23.42732,
        "lon": -51.93696
      },
      "viewport": {
        "topLeftPoint": {
          "lat": -23.25371,
          "lon": -52.1012
        },
        "btmRightPoint": {
          "lat": -23.55801,
          "lon": -51.83583
        }
      },
      "boundingBox": {
        "topLeftPoint": {
          "lat": -23.25371,
          "lon": -52.1012
        },
        "btmRightPoint": {
          "lat": -23.55801,
          "lon": -51.83583
        }
      },
      "dataSources": {
        "geometry": {
          "id": "00005858-5800-1200-0000-00007736f46c"
        }
      }
    }
  ]
}
''';
