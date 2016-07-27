
 
package com.altera.simple.impl;

import com.altera.camel.simple.EchoService;

/**
 * @author Altera
 */
public class DefaultEchoService implements EchoService {

    public String echo(String message) {
        return message;
    }

}
