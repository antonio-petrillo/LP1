public class Esterna {
  private int segreto;
  Esterna() { segreto = 7; }

  class Interna {
    private int segreto = 8;
    int getSegreto() { return segreto; }
  }

  Interna creaInterna() { return new Interna(); }
}
