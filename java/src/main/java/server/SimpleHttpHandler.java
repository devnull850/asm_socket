package server;

import com.sun.net.httpserver.*;

import java.io.*;

public class SimpleHttpHandler implements HttpHandler {

	private static final String PATH = "res/blob";
	private static final int BLOB_SIZE = 0x31;

	@Override
	public void handle(HttpExchange exchange) throws IOException {
		if (exchange.getRequestMethod().equals("GET")) {
			try (OutputStream out = exchange.getResponseBody();
			     FileInputStream in = new FileInputStream(PATH)) {
				byte[] b = new byte[BLOB_SIZE];
				in.read(b, 0, BLOB_SIZE);

				exchange.sendResponseHeaders(200, b.length);
				out.write(b);
				out.flush();
			}
		}
	}

}
