class CustomField extends Field {
  private float friction;
  private PVector prevMouse;

  public CustomField() {
    friction = 0.1;
    randomFriction();
    prevMouse = new PVector(mouseX, mouseY);
  }

  private void randomFriction() {
    friction = pow(random(0.5, 0.9), 2);
  }

  public PVector getForce(Particle particle) {
    PVector velocity = particle.velocity();
    PVector mouse = new PVector(mouseX, mouseY);
    PVector force = PVector.sub(mouse, prevMouse).mult(0.2);
    prevMouse = mouse;
    return PVector.mult(velocity, -friction).add(force);
  }
}
