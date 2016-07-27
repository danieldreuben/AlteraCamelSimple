package com.altera.camel.simple;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.camel.builder.RouteBuilder;

/**
 * A Camel Java DSL Router
 */
public class MyRouteBuilder extends RouteBuilder {

    /**
     * Let's configure the Camel routing rules using Java code...
     */
    public void configure() {

        // here is a sample which processes the input files
        // (leaving them in place - see the 'noop' flag)
        // then performs content based routing on the message using XPath
        /*from("servlet:///px/ucm2")
        	process(new Processor() {
        		public void process(Exchange exchange) throws Exception {
        			System.out.println("java route ucm2: ");
        	}});*/
        String readDir = "c:/temp";
        from("file://"+readDir+"?noop=true&include=([a-zA-Z]|[0-9])*.(xml)")
            .to("xslt:test.xsl")
            .to("fop:application/pdf")
            /*
            .process(new Processor() {
                public void process(Exchange exchange) throws Exception {
                    exchange.getOut().setHeader(Exchange.CONTENT_TYPE, "application/pdf");
                  }
              })*/
            .to("file:///temp/x");

        from("servlet:///mstr?servletName=camel").process(new Processor() {
            public void process(Exchange exchange) throws Exception {
                String contentType = exchange.getIn().getHeader(Exchange.CONTENT_TYPE, String.class);
                String path = exchange.getIn().getHeader(Exchange.HTTP_URI, String.class);
                path = path.substring(path.lastIndexOf("/"));

                //assertEquals("Get a wrong content type", CONTENT_TYPE, contentType);
                // assert camel http header
                String charsetEncoding = exchange.getIn().getHeader(Exchange.HTTP_CHARACTER_ENCODING, String.class);
                //assertEquals("Get a wrong charset name from the message heaer", "UTF-8", charsetEncoding);
                // assert exchange charset
                //assertEquals("Get a wrong charset naem from the exchange property", "UTF-8", exchange.getProperty(Exchange.CHARSET_NAME));
                exchange.getOut().setHeader(Exchange.CONTENT_TYPE, contentType + "; charset=UTF-8");
                exchange.getOut().setHeader("PATH", path);
                exchange.getOut().setBody("<b>Hello World from microstrategy!!</b>");
            }
        });
        from("servlet:///px/test?servletName=camel").process(new Processor() {
            public void process(Exchange exchange) throws Exception {
                String contentType = exchange.getIn().getHeader(Exchange.CONTENT_TYPE, String.class);
                String path = exchange.getIn().getHeader(Exchange.HTTP_URI, String.class);
                path = path.substring(path.lastIndexOf("/"));

                //assertEquals("Get a wrong content type", CONTENT_TYPE, contentType);
                // assert camel http header
                String charsetEncoding = exchange.getIn().getHeader(Exchange.HTTP_CHARACTER_ENCODING, String.class);
                //assertEquals("Get a wrong charset name from the message heaer", "UTF-8", charsetEncoding);
                // assert exchange charset
                //assertEquals("Get a wrong charset naem from the exchange property", "UTF-8", exchange.getProperty(Exchange.CHARSET_NAME));
                exchange.getOut().setHeader(Exchange.CONTENT_TYPE, contentType + "; charset=UTF-8");
                exchange.getOut().setHeader("PATH", path);
                exchange.getOut().setBody("<b>Hello World from test!!</b>");
            }
        });

        from("servlet:///logo?servletName=camel")
            .to("http://www.bgcgw.org/alexandria/files/2012/11/Ross-Store-Logo.jpg");

    }

}
