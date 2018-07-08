|Sr No| Usage 
|------------ | 
| 1. |![Heart of FI Concept](images/functionalInterface.jpg) |
|![Composing function](images/composing-funct.jpg) |
|![FI for Primitive Data Types](images/func-interface-primitive.jpg) |
|![Mapping for primitive data types](images/Stream-Flow.jpg) |
|![Mapping for primitive data types while calculating](images/primitive-map.jpg) |
|![FI's special way to process primitive data types](images/primitive-funct-interface.jpg) |
|![Optional for Primitive Data types](images/optional-primitive.jpg) |
|![Lambda and Anonymous object difference](images/lambda-anonymous-diff.jpg) |
|![Comparator Comparable difference in functional point of view](images/comparator-comparable-diff.jpg) |

|ExpectedException : Help us to do assert message text after exception is thrown |
|------------ | 
     @Rule
     public ExpectedException thrown = ExpectedException.none();

     @Test
     public void createWhenVinIsNullShouldThrowException() throws Exception {
       this.thrown.expect(IllegalArgumentException.class);
       this.thrown.expectMessage("VIN must not be null");
       new VehicleIdentificationNumber(null);
     }
