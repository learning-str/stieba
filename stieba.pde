ParticleSystem ps;
CustomField field;

void setup() {
  size(500, 500);
  ps = new ParticleSystem();
  field = new CustomField();
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
  Particle p0 = new Particle(new PVector(width / 2, height / 2));
  p0.addField(field);
  p0.setWeight(1000);
  ps.addParticle(p0);
  for (int i = 0; i < 200; i++) {
    float posBAngle = random(0, TWO_PI);
    float posBLength = random(20, 100);
    PVector pos = new PVector(width / 2 + posBLength * cos(posBAngle),
      height / 2 + posBLength * sin(posBAngle));
    Particle p = new Particle(pos);
    for (int j = 0; j < ps.particleNum(); j++) {
      Repulsive r = new Repulsive(p, ps.particle(j), 100, 0.1);
      ps.addMutual(r);
    }
    if (ps.particleNum() != 0) {
      Spring s = new Spring(p, ps.particle(0), posBLength, 0.1);
      ps.addMutual(s);
    }
    field = new CustomField();
    p.addField(field);
    ps.addParticle(p);
  }
}
