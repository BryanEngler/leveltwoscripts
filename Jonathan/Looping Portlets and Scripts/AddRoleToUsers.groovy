import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;

long roleId = 10164; // Change this

long[] userIds = new long[1001];

for (int i = 0; i <= 1000; i++) {
	User user = UserLocalServiceUtil.getUserByEmailAddress(
		10157L, //companyId
		i + "@liferay.com" //emailAddress
	)

	userIds[i] = user.getUserId();
}

UserLocalServiceUtil.addRoleUsers(roleId, userIds);