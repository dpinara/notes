
- Validating pojo with Spring Assert : import org.springframework.util.Assert;
    
        public User(String username, VehicleIdentificationNumber vin) {
            Assert.hasLength(username, "Username must not be empty");
            Assert.notNull(vin, "VIN must not be null");
            this.username = username;
            this.vin = vin;
        }

- Create most important domain value as domain object 

        public VehicleIdentificationNumber(String vin) {
            Assert.notNull(vin, "VIN must not be null");
            Assert.isTrue(vin.length() == 17, "VIN must be exactly 17 characters");
            this.vin = vin;
        }
- @EnableConfigurationProperties Example

        @SpringBootApplication
        @EnableConfigurationProperties(MyProperties.class)
        public class Application {
        
            public Application(MyProperties properties) {
                System.out.println(properties.getAddress());
                System.out.println(properties.getPort());
                System.out.println(properties.getType());
            }
        
            public static void main(String[] args) {
                SpringApplication.run(Application.class, args);
            }
        
        }



        import org.springframework.boot.context.properties.ConfigurationProperties;
        
        @ConfigurationProperties(prefix = "myapp")
        public class MyProperties {
        
            /**
             * The connection type.
             */
            private ConnectionType type = ConnectionType.NORMAL;
        
            public ConnectionType getType() {
                return this.type;
            }
        
            public void setType(ConnectionType type) {
                this.type = type;
            }
        
        }


        In resources/application.properties
        myapp.type=fail-fast

        Here ConnectionType is enum
        public enum ConnectionType {
        	NORMAL,
        	FAIL_FAST;
        }


- CommandLineRunner is like load on start up
        @Component
        class SampleDataCLR implements CommandLineRunner {
        
            private final AccountRepository accountRepository;
        
            @Autowired
            public SampleDataCLR(AccountRepository accountRepository) {
                this.accountRepository = accountRepository;
            }
        
            @Override
            public void run(String... args) throws Exception {
                Stream.of("pwebb,boot", "dsyer,cloud", "jlong,spring", "rod,atomist")
                        .map(x -> x.split(","))
                        .forEach(tuple -> accountRepository.save(new Account(tuple[0], tuple[1], true)));
            }
        }


or 


        public class BookmarkServiceApplication {
        
            @Bean
            public CommandLineRunner init(BookmarkRepository bookmarkRepository) {
                return args -> {
                    bookmarkRepository.deleteAll();
        
                    Arrays.asList("pwebb", "jlong")
                            .forEach(n -> bookmarkRepository.save(new Bookmark(n,
                                    String.format("http://some-other-host-for-%s.com", n),
                                    String.format("A description for %s's link", n), n)));
                };
            }
        
            public static void main(String[] args) {
                SpringApplication.run(BookmarkServiceApplication.class, args);
            }
        
