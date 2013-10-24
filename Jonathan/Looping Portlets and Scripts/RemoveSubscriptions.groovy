import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.model.User;
import com.liferay.portal.kernel.dao.orm.QueryUtil;
import com.liferay.portal.kernel.messaging.DestinationNames;
import com.liferay.portal.kernel.messaging.Message;
import com.liferay.portal.kernel.messaging.MessageBusUtil;
import org.apache.commons.lang.time.StopWatch;

List<User> user_list = UserLocalServiceUtil.getUsers(QueryUtil.ALL_POS, QueryUtil.ALL_POS);

long[] userIds = new long[user_list.size()];

int count = 0;

for (User user : user_list) {
	userIds[count] = user.getUserId();
	count = count + 1;
}

StopWatch stopWatch = new StopWatch();

stopWatch.start();

Message message = new Message();
message.put("groupId", 0L);
message.put("userIds", userIds);
MessageBusUtil.sendMessage(
	DestinationNames.SUBSCRIPTION_CLEAN_UP, message);

System.out.println("Total Time: " + stopWatch.getTime());