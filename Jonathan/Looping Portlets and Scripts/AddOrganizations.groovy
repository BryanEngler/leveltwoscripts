import com.liferay.portal.service.OrganizationLocalServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.util.WebKeys;

ThemeDisplay themeDisplay = (ThemeDisplay) actionRequest.getAttribute(
	WebKeys.THEME_DISPLAY);

long userId = themeDisplay.getUserId();

String defaultOrganizationName = "Organization";

for (int i = 0; i <=1000; i++) {
	OrganizationLocalServiceUtil.addOrganization(
		userId, //userId
		0, //parentSite
		defaultOrganizationName + String.valueOf(i), //Organization Name
		false // Create site
	);

	System.out.println("Organization " + i);
}