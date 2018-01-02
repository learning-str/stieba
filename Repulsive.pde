class Repulsive extends MutualForce {
  private Particle particleA;
  private Particle particleB;
  float strength;
  float maxDist;

  public Repulsive(Particle particleA, Particle particleB, float maxDist,
      float strength) {
    this.particleA = particleA;
    this.particleB = particleB;
    this.strength = strength;
    this.maxDist = maxDist;
  }

  void update() {
    PVector posBtoA = PVector.sub(particleA.position(), particleB.position());
    float dist = posBtoA.mag();
    if (dist < maxDist) {
      float pct = 1.0 - (dist / maxDist);
      posBtoA.normalize();
      particleA.addForce(posBtoA.mult(strength * pct));
      particleB.addForce(posBtoA.mult(-1));
    }
  }

  void draw() {}
}
