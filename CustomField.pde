class CustomField extends Field {
  private float friction;

  public CustomField() {
    friction = 0.1;
    randomFriction();
  }

  private void randomFriction() {
    friction = random(0.5, 0.9);
  }

  public PVector getForce(Particle particle) {
    PVector velocity = particle.velocity();
    return PVector.mult(velocity, -friction);
  }
}
