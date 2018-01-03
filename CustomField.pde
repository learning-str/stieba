class CustomField extends Field {
  private float dynamicFriction;
  private float staticFriction;

  public CustomField() {
    dynamicFriction = 0.1;
    staticFriction = 0.3;
  }

  public PVector getForce(Particle particle) {
    PVector position = particle.position();
    float weight = particle.weight();
    PVector mouseForce = PVector.sub(new PVector(mouseX, mouseY), position);
    mouseForce.mult(0.01);
    PVector afterAddedForce = PVector.add(mouseForce, particle.force());
    if (particle.velocity().mag() < 0.5 &&
        afterAddedForce.mag() < weight * staticFriction) {
      PVector frictionForce = particle.velocity().copy().mult(-weight);
      return PVector.mult(particle.force(), -1).add(frictionForce);
    } else {
      PVector velDir = particle.velocity().copy().normalize();
      return mouseForce.add(velDir.mult(weight * -dynamicFriction));
    }
  }
}
