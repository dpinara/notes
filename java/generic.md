Defining Generic method. If its not inside the typed class ( which always defines K V) we need to explicitly define <K,V>

    public static <K,V> void printPair(K key, V value)
    {
        System.out.println("key: "+key);
        System.out.println("value: "+ value);
    }
Similiar example which explains <E Extends Comparable<E>>

    public static void main(String[] args) {
        Integer[] ints = {10, 20, 30, 40, 50, 60, 70, 80};
        String[] daysOfWeek = {"Monday", "Tuesday", "Wednesday", "Thursday",
            "Friday", "Saturday", "Sunday"};
        
        print(ints);
        print(daysOfWeek);
        System.out.println(countGreaterThan(daysOfWeek,"S"));
    
    }
    public static <T extends Comparable<T>> int countGreaterThan(T[] list, T elem)
    {
        int count = 0;
        for(T element:list)
        {
            if(element.compareTo(elem) > 0)
                count++;    
        }
        return count;
    }
    public static <E> void print(E[] list)
    {
        for(E element:list)
        {
            System.out.print(element+" ");
        }
        System.out.println("");
    }


    public class EliminateDuplicates {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        ArrayList<String> list = new ArrayList<>();
        list.add("red");
        list.add("green");
        list.add("blue");
        list.add("red");
        list.add("green");
        list.add("yellow");
        list.add("orange");
        list.add("blue");
        ArrayList<String> nodups = removeDups(list);
        System.out.println(list);
        System.out.println(nodups);
    }
    public static <E extends Comparable<E>> ArrayList<E> removeDups(ArrayList<E> list)
    {
        boolean found = false;
        if(list.size()==0)
            return list;
        ArrayList<E> newList = new ArrayList<>();
        newList.add(list.get(0));
        for(int i = 1; i<list.size();i++)
        {
            for(int j=0;j<newList.size();j++)
            {
                if(list.get(i).compareTo(newList.get(j))==0)
                {
                    found = true;
                    break;
                }
            }
            if(found != true)
                newList.add(list.get(i)); 
            found = false;
        }
       
        return newList;
    }
    
    }
    
Generic Method
    
    public class GenericMethods {
    
        static Character[] charArray = {'h', 'e', 'l', 'l', 'o'};
        static Integer[] intArray = {1, 2, 3, 4, 5};
        static Boolean[] boolArray = {true, false, true};
    
        public static <T> List<T> arrayToList(T[] array, List<T> list) {
            for (T object : array) {
                list.add(object);
            }
            return list;
        }
    
        public static void main(String[] args) {
            List<Character> charList = arrayToList(charArray, new ArrayList<>());
            List<Boolean> boolList = arrayToList(boolArray, new ArrayList<>());
            List<Integer> intList = arrayToList(intArray, new ArrayList<>());
            System.out.println(intList.get(0));
        }
    
    }

Wildcard character 


    // For in variable use ? extends Buildings
    static void printBuildings(List<? extends Building> buildings) {
        for(int i = 0; i < buildings.size(); i++) {
            System.out.println(buildings.get(i).toString() + " " + (i + 1));
        }
        System.out.println();
    }
    
    // For out variable, use ? super Hose
    static void addHouseToList(List<? super House> buildings) {
        buildings.add(new House());
        System.out.println();
    }
    
