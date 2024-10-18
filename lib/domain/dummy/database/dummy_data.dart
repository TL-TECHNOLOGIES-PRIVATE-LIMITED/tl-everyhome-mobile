import 'dart:convert';

var dummyCustomerEncoded = json.encode(dummyCusotmer);
var dummyBussinessEncoded = json.encode(dummyBussines);
var dummyWorkerEncoded = json.encode(dummyWorker);
var dummyNotificationEncoded = json.encode(dummyNotification);

List<Map<String, dynamic>> dummyCusotmer = [
  {
    "id": 1,
    "name": "Caleb Bell",
    "user_id": 1,
    "profile_pic": "assets/persons/person1.jfif",
    "place": "Thrissre,Irinjalakuda"
  },
  {
    "id": 2,
    "name": "Jacob McBride",
    "user_id": 1,
    "profile_pic": "assets/persons/person2.jfif",
    "place": "Czech Republic,nation industrialcattle anywhere,Ghana"
  },
  {
    "id": 3,
    "name": "Garrett Gonzales",
    "user_id": 1,
    "profile_pic": "assets/persons/person3.jfif",
    "place": "Nicaragua,almost repliedshort failed,St. Pierre & Miquelon"
  },
  {
    "id": 4,
    "name": "Marc Cobb",
    "user_id": 1,
    "profile_pic": "assets/persons/person4.jfif",
    "place": "Nauru,we straightfairly vegetable,Barbados"
  },
  {
    "id": 5,
    "name": "Glen McLaughlin",
    "user_id": 1,
    "profile_pic": "assets/persons/person5.jfif",
    "place": "Pitcairn Islands,anyway exchangeill else,Caribbean Netherlands"
  },
  {
    "id": 6,
    "name": "Keith Saunders",
    "user_id": 1,
    "profile_pic": "assets/persons/person6.jfif",
    "place": "U.S. Virgin Islands,nor hitup generally,Angola"
  }
];

List<Map<String, dynamic>> dummyNotification = [
  {
    "id": 1,
    "sender_id": 2,
    "message":
        "enter play stove finally influence knife plan although perfectly final interior center east valley you sheep piece characteristic enough mixture ice heading noise loose",
    "date": "1/25/2058"
  },
  {
    "id": 2,
    "sender_id": 2,
    "message":
        "fellow worker tobacco gently new flew receive certain aware engine look former pencil beside mirror lose turn angry its began dress hunt battle hello",
    "date": "12/17/2117"
  },
  {
    "id": 3,
    "sender_id": 4,
    "message":
        "flat one camp baseball hurried be expression rock different back tin fight fine collect touch help private slabs coach structure town where trap globe",
    "date": "5/13/2118"
  },
  {
    "id": 4,
    "sender_id": 4,
    "message":
        "about proper folks fur aware feathers beneath essential began believed substance blood taught region pitch needle pass five afternoon slight year sudden skill day",
    "date": "8/24/2073"
  },
  {
    "id": 5,
    "sender_id": 2,
    "message":
        "lion hole explain growth central bar greatest carry sheet hot too wide let by grew transportation cage personal final last bee fully coming weight",
    "date": "10/9/2107"
  }
];

List<Map<String, dynamic>> dummyWorker = [
  {
    "id": 1,
    "user_id": 2,
    "name": "Clara Norris",
    "place": "Malta Bahrain,Botswana",
    "worker_price": 907,
    "profile_pic": "assets/persons/person7.jfif",
    "description":
        "shout money speak occur tank manner too gulf adult tax noted first hot nobody rising pilot trunk arrange board till individual said teach safety",
    "skills": ["driving", "excitement", "except", "shore"],
    "portfolio_image": []
  },
  {
    "id": 2,
    "user_id": 2,
    "name": "Virginia Parks",
    "place": "Martinique Nepal,French Southern Territories",
    "worker_price": 529,
    "profile_pic": "assets/persons/person8.jfif",
    "description":
        "worried pocket steep lady neighbor bent wear amount refused someone in dig original cabin saw did country dirt consonant equal seed tobacco race live",
    "skills": ["origin", "represent", "tie", "crack"],
    "portfolio_image": []
  },
  {
    "id": 3,
    "user_id": 2,
    "name": "Eric Young",
    "place": "Eritrea Gambia,Mozambique",
    "worker_price": 819,
    "profile_pic": "assets/persons/person9.jfif",
    "description":
        "die pretty managed which blind onto canal next eventually steady why rod nature smile up win duty branch claws establish ice dance cloth put",
    "skills": ["mother", "land", "rope", "would"],
    "portfolio_image": []
  },
  {
    "id": 4,
    "user_id": 2,
    "name": "Dennis Nunez",
    "place": "North Korea Colombia,Guyana",
    "worker_price": 916,
    "profile_pic": "assets/persons/person1.jfif",
    "description":
        "particular fifth dirt few gentle wing if perhaps team earlier forgotten percent floating bigger fox victory freedom travel weigh pride hall score powder root",
    "skills": ["path", "lead", "map", "solution"],
    "portfolio_image": [],
  },
  {
    "id": 5,
    "user_id": 2,
    "name": "Sally Oliver",
    "place": "Tunisia Aruba,Kyrgyzstan",
    "worker_price": 850,
    "profile_pic": "assets/persons/person2.jfif",
    "description":
        "weight refused flat typical compound tax square magic drove impossible case develop rather sight inside tightly coffee flame grew against report tool total tip",
    "skills": ["particular", "sight", "but", "silence"],
    "portfolio_image": [],
  }
];

List<Map<String, dynamic>> dummyBussines = [
  {
    "id": 1,
    "user_id": 3,
    "name": "officer Iraq",
    "place": "Malta Bahrain,Botswana",
    "profile_pic": "assets/persons/person3.jfif",
    "description":
        "shout money speak occur tank manner too gulf adult tax noted first hot nobody rising pilot trunk arrange board till individual said teach safety",
    "skills": ["driving", "excitement", "except", "shore"],
    "portfolio_image": []
  },
  {
    "id": 2,
    "user_id": 3,
    "name": "drop British Virgin Islands",
    "place": "Martinique Nepal,French Southern Territories",
    "profile_pic": "assets/persons/person4.jfif",
    "description":
        "worried pocket steep lady neighbor bent wear amount refused someone in dig original cabin saw did country dirt consonant equal seed tobacco race live",
    "skills": ["origin", "represent", "tie", "crack"],
    "portfolio_image": []
  },
  {
    "id": 3,
    "user_id": 3,
    "name": "principle Tanzania",
    "place": "Eritrea Gambia,Mozambique",
    "profile_pic": "assets/persons/person5.jfif",
    "description":
        "die pretty managed which blind onto canal next eventually steady why rod nature smile up win duty branch claws establish ice dance cloth put",
    "skills": ["mother", "land", "rope", "would"],
    "portfolio_image": []
  },
  {
    "id": 4,
    "user_id": 3,
    "name": "as Greenland",
    "place": "North Korea Colombia,Guyana",
    "profile_pic": "assets/persons/person6.jfif",
    "description":
        "particular fifth dirt few gentle wing if perhaps team earlier forgotten percent floating bigger fox victory freedom travel weigh pride hall score powder root",
    "skills": ["path", "lead", "map", "solution"],
    "portfolio_image": []
  },
  {
    "id": 5,
    "user_id": 3,
    "name": "half Bolivia",
    "place": "Tunisia Aruba,Kyrgyzstan",
    "profile_pic": "assets/persons/person7.jfif",
    "description":
        "weight refused flat typical compound tax square magic drove impossible case develop rather sight inside tightly coffee flame grew against report tool total tip",
    "skills": ["particular", "sight", "but", "silence"],
    "portfolio_image": []
  }
];

List<Map<String, dynamic>> dummyFavourites = [
  {
    "id": 1,
    "worker_id": 2,
    "customer_id": 2,
  }
];
List<Map<String, dynamic>> dummyWorkSchedules = [
  {
    "id": 1,
    "customer_id": 2,
    "worker_id": 4,
    "issue_type": "",
    "issue_description": "",
    "images": [],
    "customer_address": "",
    "date": "",
    "time": ""
  }
];
