package lista_3.helpers;

public class ArrayHelpers {

  public static <T> int indexOf(T[] arr, CompLambda1<T> condition) {
    for (int i = 0; i < arr.length; i++)
      if (condition.compare(arr[i]))
        return i;
    return -1;
  }

  public static <T> int indexOf(T[] arr, T value) {
    return indexOf(arr, (x) -> value.equals(x));
  }

  public static <T> T find(T[] arr, CompLambda1<T> condition) {
    int index = indexOf(arr, condition);
    if (index == -1)
      return null;
    else
      return arr[index];
  }

  public static <T> void addAtEnd(T[] arr, T element) {
    addAtEnd(arr, element, false);
  }

  public static <T> void addAtEnd(T[] arr, T element, boolean override) {
    for (int i = 0; i < arr.length; i++)
      if (arr[i] == null) {
        arr[i] = element;
        return;
      }
    if (override)
      arr[arr.length - 1] = element;
    else
      throw new RuntimeException("Array Cheio!");
  }

  public static <T> T[] fitIn(T[] arr, T[] target) {
    if (arr.length <= target.length)
      return arr;
    for (int i = 0; i < target.length; i++)
      target[i] = arr[i];
    return target;
  }

  public static <T> T[] padTo(T[] arr, T[] target) {
    if (arr.length >= target.length)
      return arr;
    for (int i = 0; i < arr.length; i++)
      target[i] = arr[i];
    return target;
  }

  public static <T> void remove(T[] arr, T elem) {
    int index = indexOf(arr, elem);
    if (index == -1)
      return;
    for (int i = index + 1; i < arr.length; i++) {
      arr[i - 1] = arr[i];
    }
    arr[arr.length - 1] = null;
  }

  public static <T> T[] resize(T[] arr, T[] newArr) {
    return padTo(fitIn(arr, newArr), newArr);
  }

  public static <T> T[] sort(T orig[], CompLambda2<T, T> shouldSwap) {
    var arr = orig.clone();
    int pos;
    for (int i = 0; i < arr.length; i++) {
      pos = i;
      for (int j = i + 1; j < arr.length; j++)
        if (arr[j] != null && shouldSwap.compare(arr[j], arr[pos]))
          pos = j;

      T temp = arr[pos];
      arr[pos] = arr[i];
      arr[i] = temp;
    }

    return arr;
  }

}
