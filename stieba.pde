ParticleSystem ps;

void setup() {
  size(500, 500);
  ps = new ParticleSystem();

  init();
}

void update() {
  ps.update();
}

void draw() {
  update();
  background(255);
  ps.draw();
}

void init() {
  for (int i = 0; i < 100; i++) {
    float posBAngle = random(0, TWO_PI);
    float posBLength = random(0, 100);
    PVector pos = new PVector(width / 2 + posBLength * cos(posBAngle),
      height / 2 + posBLength * sin(posBAngle));
    Particle p = new Particle(pos);
    ps.addParticle(p);
  }
}
