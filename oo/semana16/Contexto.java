package semana16;

import java.util.HashMap;

public class Contexto {
  private HashMap<String, Object> storage = new HashMap<>();

  public <T> void add(String key, T value) {
    storage.put(key, value);
  }

  public <T> T get(String key) {
    return (T) storage.get(key);
  }
}
