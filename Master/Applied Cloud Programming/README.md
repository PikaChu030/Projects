# Goals
1. Create a Java-REST-Service  
- Preferred with Spring Boot
- Port 8080 is consumed  
- Implement one endpoint each for POST and GET  
- Proper parameter handling  
- Proper return code handling  
- JSON handling  
2. Place the service in a docker image   

## General:
- Whenever you have a successful operation, you return 200 as code. If something is not found
(and should be there), 404. Any other code is not to be used.  
- For the valuemanager calls below you can assume to use an internal data structure like a
Dictionary in Java. It won’t survive a recycling of the controller and service, yet as long as you
make sure that a controller recycling is ok, you are good. Normally a static variable would
sort this.  

## REST-Service:
1. uuid (HTTP GET)  
Return your student id in a HTML page embedded in a <h1></h1> tag. As it is HTML,
not only the <h1> tag is necessary to form a valid HTML page, but you need [more](https://www.engr.colostate.edu/ets/htmlstructure/#:~:text=Within%20a%20web%20page%2C%20some,before%20the%20tags.)  
2. Write (HTTP POST) a key/value to the system and store it in memory in a key-value table. New keys will be inserted; existing keys will be overwritten.  
Implement two types of endpoints:  
a) valuemanager?key=keyToUse&value=valueToWrite  
b) valuemanager/key/valueToWrite  
3. valuemanager/key (HTTP DELETE) shall delete the key if present.  
4. valuemanager/key (HTTP GET) - key might not be present, or an empty string  
a) Read the current value for the given key from the system and return as MIMEtype text/plain.  
b) If the key is not present and no empty string code 404 is to be returned.  
c) If no key is given, return all entries as JSON as MIME-type application/JSON in the format:  
{  
“key1”: “value1”,  
“key2”: “value2”  
...  
}  
5. callservice (HTTP POST with a body consisting of a JSON object)  
The body of the request contains a JSON-object in the following format:  
{  
 “externalBaseUrl”: “the URL of the remote server”,  
 “parameters”: “the parameters to combine with the URL”  
}  
The endpoint is to construct a URL from the “passed in” data (externalBaseUrl + parameters), call the endpoint with a GET, and return the data in the response as the same type as the original response was (so application/json remains application/json, etc.).  
Should this not be possible, you can degrade to text/plain and pass back what you can.  
Just be careful with constructing a valid URL as the passed in data might be incorrect(consider /, illegal constructs, etc.).  
This is a typical example where a webservice calls other services to for example consolidate data and returns the aggregation / analysis to the caller.  
For testing purposes, you can use the base [URL](https://ilp-rest-2024.azurewebsites.net) and actuator/health as parameter which will produce an application/json response. If you want to check, actuator/health/livenessState produces a different response  

The following should be considered when implementing the REST-service:  
- Do proper checking for URLs, data, etc. Don’t handle anything not accurate (you will
receive error data and requests!)  
- Your endpoint names have to match the specification  
- Test your endpoints using a tool like Postman or curl. Plain Chrome / Firefox, etc. will do equally for the GET operations  