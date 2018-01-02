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
    for (int j = 0; j < ps.particleNum(); j++) {
      Repulsive r = new Repulsive(p, ps.particle(j), 100, 0.01);
      ps.addMutual(r);
    }
    if(ps.particleNum() != 0) {
      Spring s = new Spring(p, ps.particle(0), 100, 0.01);
      ps.addMutual(s);
    }
    ps.addParticle(p);
  }
}
