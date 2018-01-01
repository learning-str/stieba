class ParticleSystem {
  ArrayList<Particle> particles;
  ArrayList<Spring> springs;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
    springs = new ArrayList<Spring>();
  }

  void update() {
    for (Particle p : particles) {
      p.resetForce();
    }

    for (Spring s : springs) {
      s.update();
    }

    for (Particle p : particles) {
      p.update();
    }
  }

  void draw() {
    for (Particle p : particles) {
      p.draw();
    }
    for (Spring s : springs) {
      s.draw();
    }
  }

  void addParticle(Particle p) {
    particles.add(p);
  }

  void addSpring(Spring s) {
    springs.add(s);
  }
}
