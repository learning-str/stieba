class Particle {
  ArrayList<Field> fields = new ArrayList<Field>();
  private PVector position;  // [px]
  private PVector velocity;  // [px/frm]
  private PVector force;  // [kg*px/frm/frm]
  private float weight;  // [kg]
  private float size;

  Particle(PVector position) {
    force = new PVector(0.0, 0.0);
    velocity = new PVector(0.0, 0.0);
    this.position = position.copy();
    size = random(10, 15);
    weight = size / 1;
  }

  void resetForce() {
    force.set(0.0, 0.0);
  }

  void addForce(PVector force) {
    this.force.add(force);
  }

  void update() {
    for (Field f : fields) {
      force.add(f.getForce(this));

    }
    velocity.add(PVector.div(force, weight));
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

  PVector position() { return position; }
  PVector velocity() { return velocity; }
  void setWeight(float weight) { this.weight = weight; }
  void setPosition(PVector position) { this.position = position; }
}
