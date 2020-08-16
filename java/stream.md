|handle_exceptions_in_streams |  
|------------ | 
####TYPE ONE
         
         //Handling Stream processing with exception
              static List<LogBook> getAll() throws IOException {
         try (Stream<Path> stream = Files.walk(Paths.get("/var/log"))) {
                     return stream.filter(Files::isRegularFile)
                                  .filter(LogBook::isLogbook)
                                  .flatMap(path -> {
                                      try {
                                          return Stream.of(new LogBook(path));
                                      } catch (IOException e) {
                                          return Stream.empty();
                                      }
                                  })
                                  .collect(Collectors.toList());
                 }
             }
         }
 
####TYPE TWO
 
     private static Path STORAGE = Paths.get("/var/log");
 
     static List<LogBook> getAll() throws IOException {
         try (Stream<Path> stream = Files.walk(STORAGE)) {
 
             return stream.filter(Files::isRegularFile)
                          .filter(LogBook::isLogbook)
                          .map(path -> {
                              try {
                                  return new LogBook(path);
                              } catch (IOException e) {
                                  return null;
                              }
                          })
                          .filter(Objects::nonNull)
                          .collect(Collectors.toList());
         }
     }

