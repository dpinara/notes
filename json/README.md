## json parser..

### org.json.simple.parser.JSONParser; Longer way to get data..

    '''
        public List<Car> parseFile() throws IOException, ParseException {
            JSONParser parser = new JSONParser();
            JSONObject json = (JSONObject) parser.parse(new FileReader(targetFilePath));
            JSONArray cars = (JSONArray) json.get("cars");
    
            List<JSONObject> carList = (List<JSONObject>) cars.stream().collect(Collectors.toList());
    
            return carList.stream()
                .map(x -> new Car((String) x.get("make"), (String) x.get("model"), (String) x.get("colour"), (Double) x.get("engine_size")))
                .collect(Collectors.toList());
        }
    '''
    