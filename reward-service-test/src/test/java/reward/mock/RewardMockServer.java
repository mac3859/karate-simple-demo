package reward.mock;

import com.intuit.karate.core.MockServer;
import com.intuit.karate.http.HttpServer;

public class RewardMockServer {
    private static HttpServer server;

    public static void startServer() {
        if (server == null) {
            server = MockServer
                .feature("classpath:reward/mock/RewardMockServer.feature")
                .http(58987)
                .build();
        }
    }

    public static void stopServer() {
        if (server != null) {
            server.stop();
            server = null;
        }
    }
}