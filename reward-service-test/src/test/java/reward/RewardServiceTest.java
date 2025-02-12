package reward;

import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import reward.mock.RewardMockServer;

public class RewardServiceTest {

    @BeforeAll
    public static void setUp() {
        RewardMockServer.startServer();
    }

    @AfterAll
    public static void tearDown() {
        RewardMockServer.stopServer();
    }

    @Karate.Test
    Karate testRewardService() {
        return Karate.run("classpath:reward/features/redeem-reward.feature")
            .relativeTo(getClass())
            .systemProperty("baseUrl", "http://localhost:58987");
    }
}