## This program is taken from learning-java-9-databases-multithreading

### Read a file, break line in multiple threads processing, merge them with java 8 functional programming

    '''
    public class Main {
        public static void main(String args[]) throws IOException, InterruptedException, ExecutionException {
            long startTime = System.currentTimeMillis();
            int threads = 4;
            ExecutorService executorService = Executors.newFixedThreadPool(threads);
            final ExecutorCompletionService<Map<String, Long>> completionService = new ExecutorCompletionService<>(executorService);
    
            List<List<String>> listOfLists = getSplitLists(threads);
    
            Map<String, Long> allCounts = executeWork(completionService, listOfLists);
    
            LinkedHashMap<String, Long> sortedMap = allCounts.entrySet().stream()
                .sorted(Map.Entry.comparingByValue(Comparator.reverseOrder()))
                .collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue,
                    (oldValue, newValue) -> oldValue, () -> new LinkedHashMap<String, Long>()));
    
            System.out.println(sortedMap);
            long stopTime = System.currentTimeMillis();
            long elapsedTime = stopTime - startTime;
            System.out.println("Total execution time is " + elapsedTime + " ms");
    
            executorService.shutdown();
        }
    
        private static Map<String, Long> executeWork(ExecutorCompletionService<Map<String, Long>> completionService, List<List<String>> listOfLists) throws InterruptedException, ExecutionException {
            listOfLists.forEach(sublist -> completionService.submit(new WordCounter(sublist)));
    
            Map<String, Long> allCounts = new HashMap<>();
            for (int i = 0; i < listOfLists.size(); i++) {
                Map<String, Long> newCounts = completionService.take().get();
                newCounts.forEach((k, v) -> allCounts.merge(k, v, Long::sum));
            }
            return allCounts;
        }
    
        private static List<List<String>> getSplitLists(int threads) throws FileNotFoundException {
            URL file_path = Hibernate.Main.class.getClassLoader().getResource("words.txt");
    
            String content = new Scanner(new File(file_path.getPath())).useDelimiter("\\Z").next();
            List<String> lines = Arrays.asList(content.split("\n"));
    
            return splitList(lines, lines.size() / threads);
        }
    
    
        private static List<List<String>> splitList(List<String> originalList, int partitionSize) {
            List<List<String>> partitions = new LinkedList<>();
            for (int i = 0; i < originalList.size(); i += partitionSize) {
                partitions.add(originalList.subList(i,
                    Math.min(i + partitionSize, originalList.size())));
            }
    
            return partitions;
        }
    }
    
    
    
    
    
    public class WordCounter implements Callable<Map<String, Long>> {
        private final List<String> lineList;
    
        WordCounter(List<String> lineList) {
            this.lineList = lineList;
        }
    
        @Override
        public Map<String, Long> call() {
            long startTime = System.currentTimeMillis();
            String threadName = Thread.currentThread().getName();
    
            Map<String, Long> results = lineList.stream()
                .filter(line -> !line.equals(""))
                .flatMap(line -> Arrays.stream(line.split(" ")))
                .map(word -> word.replaceAll("[^\\w]", ""))
                .filter(word -> !word.equals(""))
                .filter(word -> word.length() > 1)
                .collect(Collectors.groupingBy(Function.identity(), Collectors.counting()));
    
            long stopTime = System.currentTimeMillis();
            long elapsedTime = stopTime - startTime;
            System.out.println(threadName + "Finished work in " + elapsedTime + " ms");
    
            return results;
        }
    }

    '''
    