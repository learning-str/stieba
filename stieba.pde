ParticleSystem ps;
// CustomField field;

void setup() {
  size(500, 500);
  ps = new ParticleSystem();
  // field = new CustomField();
  init();
}

void update() {
  ps.update();
}

void draw() {
  update();
  background(255);
  ps.draw();
  filter(DILATE);
}

void init() {
  Particle p0 = new EyeParticle(new PVector(width / 2, height / 2));
  CustomField f0 = new CustomField();
  p0.addField(f0);
  p0.setWeight(1000);
  p0.setSize(20);
  ps.addParticle(p0);
  for (int i = 0; i < 1000; i++) {
    float posBAngle = random(0, TWO_PI);
    float posBLength = random(20, 100);
    PVector pos = new PVector(width / 2 + posBLength * cos(posBAngle),
      height / 2 + posBLength * sin(posBAngle));
    Particle p;
    if (i == 0) {
      p = new EyeParticle(pos);
      p.setSize(20);
      } else {
      p = new BodyParticle(pos);
    }
    for (int j = 0; j < ps.particleNum(); j++) {
      Repulsive r = new Repulsive(p, ps.particle(j), 100, 0.1);
      ps.addMutual(r);
    }
    if (ps.particleNum() != 0) {
      Spring s = new Spring(p, ps.particle(0), posBLength, 0.1);
      ps.addMutual(s);
    }
    CustomField f = new CustomField();
    p.addField(f);
    ps.addParticle(p);
  }
}
