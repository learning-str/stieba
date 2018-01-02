class Particle {
  ArrayList<Field> fields = new ArrayList<Field>();
  private PVector position;  // [px]
  PVector velocity;  // [px/frm]
  PVector force;  // [kg*px/frm/frm]
  float weight;  // [kg]
  float size;

  Particle(PVector position) {
    force = new PVector(0.0, 0.0);
    velocity = new PVector(0.0, 0.0);
    this.position = position.copy();
    size = random(10, 15);
    weight = size / 10;
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
  void setWeight(float weight) { this.weight = weight; }
}
