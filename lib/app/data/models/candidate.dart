class Candidate {
  int candidateId, votes;
  String name, politicalParty, position, image;

  Candidate(
      {this.candidateId,
      this.name,
      this.politicalParty,
      this.position,
      this.image,
      this.votes});

  List<Candidate> alcaldiaList() {
    return [
      Candidate(
          candidateId: 1,
          name: 'César Dockweiler',
          politicalParty: 'MAS-IPSP',
          position: 'ALCALDIA',
          image: 'assets/ballot/mas.png',
          votes: 0),
      Candidate(
          candidateId: 2,
          name: 'Iván Arias',
          politicalParty: 'Somos Pueblo',
          position: 'ALCALDIA',
          image: 'assets/ballot/arias.png',
          votes: 0),
      Candidate(
          candidateId: 2,
          name: 'Álvaro Blondel',
          politicalParty: 'Sol.bo',
          position: 'ALCALDIA',
          image: 'assets/ballot/solbo.png',
          votes: 0),
      Candidate(
          candidateId: 3,
          name: 'Luis Larrea',
          politicalParty: 'UI',
          position: 'ALCALDIA',
          image: 'assets/ballot/nologo.png',
          votes: 0),
      Candidate(
          candidateId: 4,
          name: 'David Castro',
          politicalParty: 'Jallalla',
          position: 'ALCALDIA',
          image: 'assets/ballot/jallalla.png',
          votes: 0),
      Candidate(
          candidateId: 5,
          name: 'Juan Carlos Arana',
          politicalParty: 'MPS',
          position: 'ALCALDIA',
          image: 'assets/ballot/nologo.png',
          votes: 0),
      Candidate(
          candidateId: 6,
          name: 'Jose Manuel Encinas',
          politicalParty: 'Venceremos',
          position: 'ALCALDIA',
          image: 'assets/ballot/venceremos.jpg',
          votes: 0),
      Candidate(
          candidateId: 7,
          name: 'Alberto Miranda',
          politicalParty: 'ASP',
          position: 'ALCALDIA',
          image: 'assets/ballot/nologo.png',
          votes: 0),
      Candidate(
          candidateId: 8,
          name: 'Amilcar Barral',
          politicalParty: 'PAN-BOL',
          position: 'ALCALDIA',
          image: 'assets/ballot/nologo.png',
          votes: 0),
      Candidate(
          candidateId: 9,
          name: 'Ronald Escobar',
          politicalParty: 'MTS',
          position: 'ALCALDIA',
          image: 'assets/ballot/nologo.png',
          votes: 0),
      Candidate(
          candidateId: 10,
          name: 'Peter Maldonado',
          politicalParty: 'UCS',
          position: 'ALCALDIA',
          image: 'assets/ballot/nologo.png',
          votes: 0),
      Candidate(
          candidateId: 11,
          name: 'Blanco',
          politicalParty: 'Blanco',
          position: 'ALCALDIA',
          image: 'assets/ballot/nologo.png',
          votes: 0),
      Candidate(
          candidateId: 12,
          name: 'Nulo',
          politicalParty: 'Nulo',
          position: 'ALCALDIA',
          image: 'assets/ballot/nologo.png',
          votes: 0)
    ];
  }

  List<Candidate> gobernacionList() {
    return [
      Candidate(
          candidateId: 1,
          name: 'Franklin Flores',
          politicalParty: 'MAS-IPSP',
          position: 'GOBERNACION',
          image: 'assets/ballot/mas.png',
          votes: 0),
      Candidate(
          candidateId: 2,
          name: 'Santos Quispe',
          politicalParty: 'Jallalla',
          position: 'GOBERNACION',
          image: 'assets/ballot/jallalla.png',
          votes: 0),
      Candidate(
          candidateId: 3,
          name: 'Rafael Quispe',
          politicalParty: 'SP',
          position: 'GOBERNACION',
          image: 'assets/ballot/nologo.png',
          votes: 0),
      Candidate(
          candidateId: 4,
          name: 'Felix Patzi',
          politicalParty: 'MTS',
          position: 'GOBERNACION',
          image: 'assets/ballot/nologo.png',
          votes: 0),
      Candidate(
          candidateId: 5,
          name: 'Franclin Gutierrez',
          politicalParty: 'FPV',
          position: 'GOBERNACION',
          image: 'assets/ballot/nologo.png',
          votes: 0),
      Candidate(
          candidateId: 6,
          name: 'Mateo Laura',
          politicalParty: 'CC',
          position: 'GOBERNACION',
          image: 'assets/ballot/nologo.png',
          votes: 0),
      Candidate(
          candidateId: 7,
          name: 'Beatriz Alvarez',
          politicalParty: 'Sol.bo',
          position: 'GOBERNACION',
          image: 'assets/ballot/solbo.png',
          votes: 0),
      Candidate(
          candidateId: 8,
          name: 'Claudia Bravo',
          politicalParty: 'UN',
          position: 'GOBERNACION',
          image: 'assets/ballot/nologo.png',
          votes: 0),
      Candidate(
          candidateId: 9,
          name: 'Orlando Quispe',
          politicalParty: 'PAN-BOL',
          position: 'GOBERNACION',
          image: 'assets/ballot/nologo.png',
          votes: 0),
      Candidate(
          candidateId: 10,
          name: 'Juan Choque',
          politicalParty: 'Venceremos',
          position: 'GOBERNACION',
          image: 'assets/ballot/venceremos.jpg',
          votes: 0),
      Candidate(
          candidateId: 11,
          name: 'Federico Zelada',
          politicalParty: 'Venceremos',
          position: 'GOBERNACION',
          image: 'assets/ballot/nologo.png',
          votes: 0),
      Candidate(
          candidateId: 12,
          name: 'Julio Tito',
          politicalParty: 'ASP',
          position: 'GOBERNACION',
          image: 'assets/ballot/nologo.png',
          votes: 0),
      Candidate(
          candidateId: 13,
          name: 'Santiago Quenta',
          politicalParty: 'UI',
          position: 'GOBERNACION',
          image: 'assets/ballot/nologo.png',
          votes: 0),
      Candidate(
          candidateId: 14,
          name: 'Blanco',
          politicalParty: 'Blanco',
          position: 'GOBERNACION',
          image: 'assets/ballot/nologo.png',
          votes: 0),
      Candidate(
          candidateId: 15,
          name: 'Nulo',
          politicalParty: 'Nulo',
          position: 'GOBERNACION',
          image: 'assets/ballot/nologo.png',
          votes: 0)
    ];
  }

  /*Map<String, dynamic> toMap() {
    return {
      'document': document,
      'expedido': expedido,
      'docType': docType,
      'name': name,
      'lastName': lastName,
      'birthDay': birthDay,
      'phone': phone,
      'email': email,
      'sex': sex,
      'address': address,
      'nacionalityId': nacionalityId,
      'profileId': profileId,
      'photo': photo,
      'token_firebase': token
    };
  }

  Candidate.fromJson(Map<String, dynamic> json)
      : document = json['document'],
        docType = json['doc_type'],
        expedido = '',
        name = json['name'],
        lastName = json['last_name'],
        phone = json['cell_phone_number'],
        email = '',
        address = '',
        photo = '',
        token = '',
        birthDay = json['birth_day'],
        nacionalityId = 0,
        profileId = 1;
*/
}
