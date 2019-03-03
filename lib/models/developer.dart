class Developer {
    final String id;
    final String name;
    final String location;
    final String distance;
    final String gravity;
    final String description;
    final String image;

    const Developer({this.id, this.name, this.location, this.distance, this.gravity,
      this.description, this.image});
  }

List<Developer> developers = [
    const Developer(
      id: "1",
          name: "Mars",
          location: "Milkyway Galaxy",
          distance: "227.9m Km",
          gravity: "3.711 m/s ",
          description: "Lorem ipsum...",
          image: "assets/img/mars.png",
        ),
    const Developer(
          id: "2",
          name: "Neptune",
          location: "Milkyway Galaxy",
          distance: "54.6m Km",
          gravity: "11.15 m/s ",
          description: "Lorem ipsum...",
          image: "assets/img/neptune.png",
        ),
    const Developer(
          id: "3",
          name: "Moon",
          location: "Milkyway Galaxy",
          distance: "54.6m Km",
          gravity: "1.622 m/s ",
          description: "Lorem ipsum...",
          image: "assets/img/moon.png",
        ),
    const Developer(
          id: "4",
          name: "Earth",
          location: "Milkyway Galaxy",
          distance: "54.6m Km",
          gravity: "9.807 m/s ",
          description: "Lorem ipsum...",
          image: "assets/img/earth.png",
        ),
    const Developer(
          id: "5",
          name: "Mercury",
          location: "Milkyway Galaxy",
          distance: "54.6m Km",
          gravity: "3.7 m/s ",
          description: "Lorem ipsum...",
          image: "assets/img/mercury.png",
        ),
  ];