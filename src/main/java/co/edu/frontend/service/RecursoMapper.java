package co.edu.frontend.service;

import co.edu.frontend.model.*;
import java.util.List;
import java.util.stream.Collectors;

public class RecursoMapper {
    public static List<Aula> filtrarAulas(List<RecursoRaw> raws) {
        return raws.stream()
                   .filter(r -> r.getCapacidad() != null)
                   .map(r -> {
                       Aula a = new Aula();
                       a.setId(r.getId());
                       a.setCapacidad(r.getCapacidad());
                       a.setUbicacion(r.getUbicacion());
                       a.setDimensiones(r.getDimensiones());
                       a.setTipo(r.getTipo());
                       a.setEstado(r.getEstado());
                       a.setEsExamen(r.getEsExamen());
                       return a;
                   })
                   .collect(Collectors.toList());
    }

    public static List<Material> filtrarMateriales(List<RecursoRaw> raws) {
        return raws.stream()
                   .filter(r -> r.getNombre() != null)
                   .map(r -> {
                       Material m = new Material();
                       m.setId(r.getId());
                       m.setNombre(r.getNombre());
                       m.setTipo(r.getTipo());
                       m.setEstado(r.getEstado());
                       return m;
                   })
                   .collect(Collectors.toList());
    }
}
