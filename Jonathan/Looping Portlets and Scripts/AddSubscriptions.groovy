import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.kernel.dao.orm.QueryUtil;
import com.liferay.portal.service.SubscriptionLocalServiceUtil;
import com.liferay.portal.model.User;

List<User> user_list = UserLocalServiceUtil.getUsers(QueryUtil.ALL_POS, QueryUtil.ALL_POS);

long[] userIds = new long[user_list.size()];

int count = 0;

for (User user : user_list) {
	SubscriptionLocalServiceUtil.addSubscription(
		user.getUserId(),
		351961L,
		"com.liferay.portlet.blogs.model.BlogsEntry",
		480407L);
}