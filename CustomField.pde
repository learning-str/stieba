class CustomField extends Field {
  private float friction;

  public CustomField() {
    friction = 0.01;
  }

  public PVector getForce(Particle particle) {
    PVector velocity = particle.velocity();
    return PVector.mult(velocity, -friction);
  }
}
