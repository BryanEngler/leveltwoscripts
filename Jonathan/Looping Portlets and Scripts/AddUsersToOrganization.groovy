import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;

long companyId = 10157; // Change this

long organizationId = 17491; // Change this

long[] userIds = new long[1001];

for (int i = 0; i <= 1000; i++) {
	User user = UserLocalServiceUtil.getUserByEmailAddress(companyId, i + "@liferay.com");

	userIds[i] = user.getUserId();

	System.out.println(i);
}

UserLocalServiceUtil.addOrganizationUsers(organizationId, userIds);