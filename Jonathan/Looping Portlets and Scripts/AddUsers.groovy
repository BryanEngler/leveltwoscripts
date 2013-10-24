import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextThreadLocal;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.util.WebKeys;

ServiceContext serviceContext =
	ServiceContextThreadLocal.getServiceContext();

ThemeDisplay themeDisplay = (ThemeDisplay) actionRequest.getAttribute(
	WebKeys.THEME_DISPLAY);

long userId = themeDisplay.getUserId();

User user = UserLocalServiceUtil.getUserById(userId);

long companyId = user.getCompanyId();

Locale locale = user.getLocale();

String defaultScreenName = "user";

String defaultFirstName = "firstName";

for (int i = 0; i <=1000; i++) {

	UserLocalServiceUtil.addUser(
		userId, // creatorUserId
		companyId, // companyId
		true, // autoPassword
		null, // password1
		null, // password2
		false, // autoScreenName
		defaultScreenName + String.valueOf(i), // screenName
		String.valueOf(i) + "@liferay.com", // emailAddress
		0, // facebookId
		"", // openId
		locale, // locale
		defaultFirstName + String.valueOf(i), // firstName
		"", // middleName
		"", // lastName
		0, // prefixId
		0, // suffixId
		true, // male
		1, // birthdayMonth
		1, // birthdayDay
		1990, // birthdayYear
		"", // jobTitle
		null, // groupIds
		null, // organizationIds
		null, // roleIds
		null, // userGroupIds
		false, // sendEmail
		serviceContext // serviceContext
	);
}