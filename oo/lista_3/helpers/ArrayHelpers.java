package lista_3.helpers;

public class ArrayHelpers {

  public static <T> int indexOf(T[] arr, CompLambda1<T> condition) {
    for (int i = 0; i < arr.length; i++)
      if (condition.compare(arr[i]))
        return i;
    return -1;
  }

  public static <T> int indexOf(T[] arr, T value) {
    return indexOf(arr, (x) -> x.equals(value));
  }

  public static <T> T find(T[] arr, CompLambda1<T> condition) {
    int index = indexOf(arr, condition);
    if (index == -1)
      return null;
    else
      return arr[index];
  }

  public static <T> T[] cut(T[] arr, int size) {
    if (arr.length <= size)
      return arr;
    final T[] newArr = (T[]) new Object[size];
    for (int i = 0; i < newArr.length; i++)
      newArr[i] = arr[i];
    return newArr;
  }

  public static <T> T[] pad(T[] arr, int size) {
    if (arr.length >= size)
      return arr;
    final T[] newArr = (T[]) new Object[size];
    for (int i = 0; i < arr.length; i++)
      newArr[i] = arr[i];
    return newArr;
  }

  public static <T> T[] resize(T[] arr, int size) {
    return pad(cut(arr, size), size);
  }
}
