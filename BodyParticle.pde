class BodyParticle extends Particle {
  BodyParticle(PVector position) {
    super(position);
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
}
