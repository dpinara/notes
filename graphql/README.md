
#### Dependency

    <dependency>
     <groupId>com.graphql-java</groupId>
     <artifactId>graphql-spring-boot-starter</artifactId>
     <version>5.0.2</version>
    </dependency>
    
    <dependency>
     <groupId>com.graphql-java</groupId>
     <artifactId>graphql-java-tools</artifactId>
     <version>5.2.4</version>
    </dependency>
    
    <dependency>
     <groupId>com.graphql-java</groupId>
     <artifactId>graphiql-spring-boot-starter</artifactId>
     <version>5.0.2</version>
    </dependency>

#### GraphQL Query resolver

    @Component
    public class Query implements GraphQLQueryResolver {
     private ApplicationRepository applicationRepository;
    
     public Query(ApplicationRepository applicationRepository) {
     this.applicationRepository = applicationRepository;
     }
    
     public Iterable<Application> findAllApplications() {
     return applicationRepository.findAll();
     }
    
     public long countApplications() {
     return applicationRepository.count();
     }
    }
    logging.level.org.springframework: DEBUG

#### GraphQL Mutation resolver

    @Component
    public class Mutation implements GraphQLMutationResolver {
     private ApplicationRepository applicationRepository;
    
     public Mutation(ApplicationRepository applicationRepository) {
     this.applicationRepository = applicationRepository;
     }
    
     public Application newApplication(String name, String owner,
     String description) {
     Application app = new Application(name, owner, description);
     applicationRepository.save(app);
     return app;
     }
    
     public boolean deleteApplication(Long id) {
     applicationRepository.deleteById(id);
     return true;
     }
    
     public Application updateApplicationOwner(String newOwner, Long id) {
     Optional<Application> optionalApplication = applicationRepository.findById(id);
    
     if(optionalApplication.isPresent()) {
     Application application = optionalApplication.get();
     application.setOwner(newOwner);
     applicationRepository.save(application);
     return application;
     } else {
     throw new ApplicationNotFoundException("Application Not Found", id);
     }
     }
    }


#### Custom Graphql Exception

    package com.pluralsight.exception;
    
    import graphql.ErrorType;
    import graphql.GraphQLError;
    import graphql.language.SourceLocation;
    
    import java.util.HashMap;
    import java.util.List;
    import java.util.Map;
    
    public class ApplicationNotFoundException extends RuntimeException implements GraphQLError {
    
     private Map<String, Object> extensions = new HashMap<>();
    
     public ApplicationNotFoundException(String message, Long invalidApplicationId) {
     super(message);
     extensions.put("invalidApplicationId", invalidApplicationId);
     }
    
     @Override
     public List<SourceLocation> getLocations() {
     return null;
     }
    
     @Override
     public Map<String, Object> getExtensions() {
     return extensions;
     }
    
     @Override
     public ErrorType getErrorType() {
     return ErrorType.DataFetchingException;
     }
    }

