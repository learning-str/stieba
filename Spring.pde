class Spring extends MutualForce {
  Particle particleA;
  Particle particleB;
  float springLength;
  float springiness;
  private color strokeColor;

  Spring(Particle particleA, Particle particleB, float springLength,
      float springiness) {
    this.particleA = particleA;
    this.particleB = particleB;
    this.springLength = springLength;
    this.springiness = springiness;
    strokeColor = color(0, 0, 0);
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
    stroke(strokeColor);
    PVector posA = particleA.position();
    PVector posB = particleB.position();
    line(posA.x, posA.y, posB.x, posB.y);
  }
}
