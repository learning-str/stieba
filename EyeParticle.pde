class EyeParticle extends Particle {
  EyeParticle(PVector position) {
    super(position);
  }

  void draw() {
    noStroke();
    fill(#4a4a4a);
    ellipse(position.x, position.y, size, size);
    fill(#231815);
    ellipse(position.x, position.y, size - 2, size - 2);
    fill(#cdcdcd);
    ellipse(position.x, position.y, size - 4, size - 4);
    fill(#434343);
    ellipse(position.x, position.y, size - 6, size - 6);
    fill(#cdcdcd);
    ellipse(position.x - 2, position.y - 2, size - 21, size - 21);
  }
}
