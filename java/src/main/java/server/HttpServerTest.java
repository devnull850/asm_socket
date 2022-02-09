package server;

import com.sun.net.httpserver.HttpServer;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class HttpServerTest {

	private static final String URL = "localhost";
	private static final int PORT = 8080;

	public static void main(String[] args) throws IOException {
		ExecutorService thread = Executors.newSingleThreadExecutor();

		HttpServer server =
			HttpServer.create(new InetSocketAddress(URL, PORT), 0);
		server.createContext("/", new SimpleHttpHandler());
		server.setExecutor(thread);
		server.start();
	}

}
