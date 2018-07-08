
		assertThat(actual).isEqualTo(details);
		assertThat(vin1).isEqualTo(vin1).isEqualTo(vin2).isNotEqualTo(vin3);
		assertThat(user.getUsername()).isEqualTo("donald");


- usage of assertj with @JsonTest

        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.boot.test.autoconfigure.json.JsonTest;
        import org.springframework.boot.test.json.JacksonTester;
        import org.springframework.test.context.junit4.SpringRunner;
        
        import static org.assertj.core.api.Assertions.assertThat;
        
        /**
         * JSON tests for {@link VehicleDetails}.
         */
        @RunWith(SpringRunner.class)
        @JsonTest
        public class VehicleDetailsJsonTest {
        
            @Autowired
            private JacksonTester<VehicleDetails> json;
        
            @Test
            public void serializeJson() throws Exception {
                VehicleDetails details = new VehicleDetails("Honda", "Civic");
                assertThat(this.json.write(details)).isEqualTo("vehicledetails.json"); // Compares with the file if string ends with .json
                assertThat(this.json.write(details)).isEqualToJson("vehicledetails.json");
                assertThat(this.json.write(details)).hasJsonPathStringValue("@.make");
                assertThat(this.json.write(details)).extractingJsonPathStringValue("@.make")
                        .isEqualTo("Honda");
            }
        
            @Test
            public void deserializeJson() throws Exception {
                String content = "{\"make\":\"Ford\",\"model\":\"Focus\"}";
                assertThat(this.json.parse(content))
                        .isEqualTo(new VehicleDetails("Ford", "Focus"));
                assertThat(this.json.parseObject(content).getMake()).isEqualTo("Ford");
            }
        
- vehicledetails.json looks like this.
            {
                "make" : "Honda",
                "model" : "Civic"
            }
            