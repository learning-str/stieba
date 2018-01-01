class Particle {
  ArrayList<Field> fields = new ArrayList<Field>();
  private PVector position;
  PVector velocity;
  PVector force;
  float size;

  Particle(PVector position) {
    force = new PVector(0.0, 0.0);
    velocity = new PVector(0.0, 0.0);
    this.position = position.copy();
    size = random(10, 15);
  }

  void resetForce() {
    force.set(0.0, 0.0);
  }

  void addForce(PVector force) {
    this.force.add(force);
  }

  void update() {
    for (Field f : fields) {
      f.getForce(this);
    }
    velocity.add(force);
    position.add(velocity);
  }

  void draw() {
    noStroke();
    fill(0);
    ellipse(position.x, position.y, size, size);
  }

  void addField(Field f) {
    fields.add(f);
  }

  PVector position() {
    return position;
  }
}
