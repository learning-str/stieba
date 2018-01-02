class ParticleSystem {
  ArrayList<Particle> particles;
  ArrayList<MutualForce> mutualFrcs;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
    mutualFrcs = new ArrayList<MutualForce>();
  }

  void update() {
    for (Particle p : particles) {
      p.resetForce();
    }

    for (MutualForce m : mutualFrcs) {
      m.update();
    }

    for (Particle p : particles) {
      p.update();
    }
  }

  void draw() {
    for (Particle p : particles) {
      p.draw();
    }
    for (MutualForce m : mutualFrcs) {
      m.draw();
    }
  }

  void addParticle(Particle p) {
    particles.add(p);
  }

  void addMutual(MutualForce m) {
    mutualFrcs.add(m);
  }

  Particle particle(int index) {
    return particles.get(index);
  }

  float particleNum() {
    return particles.size();
  }
}
