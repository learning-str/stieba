class Particle {
  ArrayList<Field> fields = new ArrayList<Field>();
  private PVector position;  // [px]
  private PVector velocity;  // [px/frm]
  private PVector force;  // [kg*px/frm/frm]
  private float weight;  // [kg]
  private float size;
  private color fillColor;
  private color strokeColor;
  private boolean bStroke;

  Particle(PVector position) {
    force = new PVector(0.0, 0.0);
    velocity = new PVector(0.0, 0.0);
    this.position = position.copy();
    size = random(10, 15);
    weight = size / 1;
    fillColor = color(0, 0, 0, 50);
    bStroke = false;
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
    if (bStroke) {
      strokeWeight(10);
      stroke(strokeColor);
    } else {
      noStroke();
    }
    fill(fillColor);
    ellipse(position.x, position.y, size, size);
  }

  void addField(Field f) {
    fields.add(f);
  }

  PVector position() { return position; }
  PVector velocity() { return velocity; }
  PVector force() { return force; }
  float weight() { return weight; }
  void setWeight(float weight) { this.weight = weight; }
  void setPosition(PVector position) { this.position = position; }
  void setFillColor(color fillColor) { this.fillColor = fillColor; }
  void setStrokeColor(color strokeColor) {
    this.strokeColor = strokeColor;
    bStroke = true;
  }
  void setSize(float size) { this.size = size; }
}
