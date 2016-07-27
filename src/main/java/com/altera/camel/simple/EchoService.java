
 
package com.altera.camel.simple;

import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;

/**
 * Simple service exposed via SOAP over JMS and HTTP.
 * 
 * @author Altera POC 
 */
@WebService(targetNamespace = "http://cameldemo/echoservice/v1", name = "echo")
public interface EchoService {

    @WebResult(name = "echo")
    public String echo(@WebParam(name = "message") String message);
    
    //TO DO
    //Replace the string object with Complex Altera Object later
}
