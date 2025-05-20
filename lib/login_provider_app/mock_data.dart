const sampleJson = '''
{
  "status": "success",
  "data": {
    "selectedUser": {
      "userName": "SHYAM",
      "userId": "CBS123",
      "designation": "Manager",
      "department": "test4",
      "status": ""
    },
    "reportees": [
      {
        "userName": "RAMAN",
        "userId": "DTC014",
        "designation": "Manager",
        "department": "test4",
        "status": "",
        "reportees": "2"
      },
      {
        "userName": "SHOBHIT AGARWAL",
        "userId": "DT1037",
        "designation": "Manager",
        "department": "test4",
        "status": "Present",
        "reportees": "2"
      },
      {
        "userName": "ATUL",
        "userId": "DT125",
        "designation": "HR",
        "department": "test4",
        "status": "Absent",
        "reportees": "2"
      },
      {
        "userName": "testing1020255",
        "userId": "DT101111",
        "designation": "ASE",
        "department": "Sales",
        "status": "",
        "reportees": "2"
      }
    ],
    "managers": [
      {
        "level": 1,
        "userName": "Rishabh Jain",
        "userId": "DT1025",
        "designation": "AsstSoftwareDeveloper",
        "department": "DotNet",
        "status": "Absent",
        "reportees": "2"
      },
      {
        "level": 2,
        "userName": "Chirag Kaushik",
        "userId": "DT1071",
        "designation": "AsstSoftwareDeveloper",
        "department": "DotNet",
        "status": "",
        "reportees": "2"
      }
    ]
  }
}
''';
