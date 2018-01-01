class Spring {
  Particle particleA;
  Particle particleB;
  float springLength;
  float springiness;

  Spring(Particle particleA, Particle particleB, float springLength,
      float springiness) {
    this.particleA = particleA;
    this.particleB = particleB;
    this.springLength = springLength;
    this.springiness = springiness;
  }

  void update() {
    if ((particleA == null) || (particleB == null)) {
      return;
    }
    PVector posA = particleA.position();
    PVector posB = particleB.position();
    float dist = PVector.dist(posA, posB);
    float springForce = (springiness * (springLength - dist));
    PVector forceToAdd = PVector.sub(posA, posB).normalize().mult(springForce);
    particleA.addForce(forceToAdd);
    particleB.addForce(forceToAdd.mult(-1.0));
  }

  void draw() {
    noFill();
    stroke(0);
    PVector posA = particleA.position();
    PVector posB = particleB.position();
    line(posA.x, posA.y, posB.x, posB.y);
  }
}
