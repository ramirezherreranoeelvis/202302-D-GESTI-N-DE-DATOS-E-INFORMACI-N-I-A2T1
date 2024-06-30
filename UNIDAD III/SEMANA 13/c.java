public class c {
    public static void main(String[] args) {
        System.out.println(Math.pow(9, 4));
        var perro = new Perro(0, null);
        System.out.println(perro.idPerro + perro.name);
    }
}

class Perro {
    int idPerro;
    String name;

    public Perro(int idPerro, String name) {
        this.idPerro = idPerro;
        this.name = name;
    }
}